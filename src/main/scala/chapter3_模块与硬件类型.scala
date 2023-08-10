/*
Chisel在构建硬件的思路上类似Verilog。在Verilog中，是以“模块(module)”为基本单位组成一个完整的独立功能实体，所以Chisel也是按模块划分的，只不过不是用关键字“module”开头来定义模块，而是用一个继承自Module类的自定义class。

在Verilog里，模块内部主要有“线网(wire)”和“四态变量(reg)”两种硬件类型，它们用于描述数字电路的组合逻辑和时序逻辑。在Chisel里，也按这个思路定义了一些硬件类型，包括基本的线网和寄存器，以及一些常用的其它类型。前一章介绍了Chisel的数据类型，这还不够，因为这些数据类型是无法独立工作的。实际的电路应该是由硬件类型的对象构成的，不管是信号的声明，还是用赋值进行信号传递，都是由硬件类型的对象来完成的。数据类型和硬件类型融合在一起，才能构成完整、可运行的组件。比如要声明一个线网，这部分工作由硬件类型来完成；这个线网的位宽是多少、按无符号数还是有符号数解释、是不是向量等等，这些则是由作为参数的数据类型对象来定义的。

本章将介绍Chisel里的常用硬件类型以及如何编写一个基本的模块，对于高级类型，读者可以自行研究。这些类型的语法很简单，都是由定义在单例对象里的apply工厂方法来完成。字面的名字已经把硬件含义表明得很清楚，至于它们的具体实现是什么，读者可以不用关心。
一、Chisel是如何赋值的

有了硬件类型后，就可以用赋值操作来进行信号的传递或者电路的连接。只有硬件赋值才有意义，单纯的数据对象进行赋值并不会被编译器转换成实际的电路，因为在Verilog里也是对wire、reg类型的硬件进行赋值。那么，赋值操作需要什么样的操作符来完成呢？

在Chisel里，所有对象都应该由val类型的变量来引用，因为硬件电路的不可变性。因此，一个变量一旦初始化时绑定了一个对象，就不能再发生更改。但是，引用的对象很可能需要被重新赋值。例如，输出端口在定义时使用了“=”与端口变量名进行了绑定，那等到驱动该端口时，就需要通过变量名来进行赋值操作，更新数据。很显然，此时“=”已经不可用了，因为变量在声明的时候不是var类型。即使是var类型，这也只是让变量引用新的对象，而不是直接更新原来的可变对象。

为了解决这个问题，几乎所有的Chisel类都定义了方法“:=”，作为等号赋值的代替。所以首次创建变量时用等号初始化，如果变量引用的对象不能立即确定状态或本身就是可变对象，则在后续更新状态时应该用“:=”。从前面讲的操作符优先级来判断，该操作符以等号结尾，而且不是四种逻辑比较符号之一，所以优先级与等号一致，是最低的。例如：

    val x = Wire(UInt(4.W))

    val y = Wire(UInt(4.W))

    x := "b1010".U  // 向4bit的线网x赋予了无符号数10

    y := ~x  // 把x按位取反，传递给y

二、端口
   Ⅰ、定义端口列表

定义一个模块前一定要先定义好端口。整个端口列表是由方法“IO[T <: Data](iodef: T)”来定义的，通常其参数是一个Bundle类型的对象，而且引用的字段名称必须是“io”。因为端口存在方向，所以还需要方法“Input[T <: Data](source: T)”和“Output[T <: Data](source: T)”来为每个端口表明具体的方向。注意，“Input[T <: Data](source: T)”和“Output[T <: Data](source: T)”仅仅是复制它们的参数，所以不能是已经被硬件类型包裹的数据类型。目前Chisel还不支持双向端口inout，只能通过黑盒里的Analog端口来模拟外部Verilog的双向端口。

一旦端口列表定义完成，就可以通过“io.xxx”来使用。输入可以驱动内部其它信号，输出可以被其他信号驱动。可以直接进行赋值操作，布尔类型的端口还能直接作为使能信号。端口不需要再使用其它硬件类型来定义，不过要注意从性质上来说它仍然属于组合逻辑的线网。例如：

    class MyIO extends Bundle {
       val in = Input(Vec(5, UInt(32.W)))
       val out = Output(UInt(32.W))
    }

    ......
       val io = IO(new MyIO)  // 模块的端口列表
    ......

   Ⅱ、翻转端口列表的方向

对于两个相连的模块，可能存在大量同名但方向相反的端口。仅仅为了翻转方向而不得不重写一遍端口显得费时费力，所以Chisel提供了“Flipped[T <: Data](source: T)”方法，可以把参数里所有的输入转输出，输出转输入。如果是黑盒里的Analog端口，则仍是双向的。例如：

     class MyIO extends Bundle {
       val in = Input(Vec(5, UInt(32.W)))
       val out = Output(UInt(32.W))
    }

    ......
       val io = IO(new MyIO)  // in是输入，out是输出
    ......
       val io = IO(Flipped(new MyIO))  // out是输入，in是输出

   Ⅲ、整体连接

翻转方向的端口列表通常配合整体连接符号“<>”使用。该操作符会把左右两边的端口列表里所有同名的端口进行连接，而且同一级的端口方向必须是输入连输出、输出连输入，父级和子级的端口方向则是输入连输入、输出连输出。注意，方向必须按这个规则匹配，而且不能存在端口名字、数量、类型不同的情况。这样就省去了大量连线的代码。例如：

    class MyIO extends Bundle {
       val in = Input(Vec(5, UInt(32.W)))
       val out = Output(UInt(32.W))
    }

    ......
       val io = IO(new Bundle {
           val x = new MyIO
           val y = Flipped(new MyIO)
       })

       io.x <> io.y  // 相当于 io.y.in := io.x.in; io.x.out := io.y.out
    ......

三、模块
   Ⅰ、定义模块

在Chisel里面是用一个自定义的类来定义模块的，这个类有以下三个特点：①继承自Module类。②有一个抽象字段“io”需要实现，该字段必须引用前面所说的端口对象。③在类的主构造器里进行内部电路连线。因为非字段、非方法的内容都属于主构造方法，所以用操作符“:=”进行的赋值、用“<>”进行的连线或一些控制结构等等，都属于主构造方法。从Scala的层面来讲，这些代码在实例化时表示如何构造一个对象；从Chisel的层面来讲，它们就是在声明如何进行模块内部子电路的连接、信号的传递，类似于Verilog的assign和always语句。实际上这些用赋值表示的电路连接在转换成Verilog时，组合逻辑就是大量的assign语句，时序逻辑就是always语句。

还有一点需要注意，这样定义的模块会继承一个字段“clock”，类型是Clock，它表示全局时钟，在整个模块内都可见。对于组合逻辑，是用不上它的，而时序逻辑虽然需要这个时钟，但也不用显式声明。还有一个继承的字段“reset”，类型是Reset，表示全局复位信号，在整个模块内可见。对于需要复位的时序元件，也可以不用显式使用该字段。如果确实需要用到全局时钟和复位，则可以通过它们的字段名称来使用，但要注意类型是否匹配，经常需要“reset.toBool”这样的语句把Reset类型转换成Bool类型用于控制。隐式的全局时钟和复位端口只有在生成Verilog代码时才能看到。

要编写一个双输入多路选择器，其代码如下所示：

    // mux2.scala
    package test

    import chisel3._

    class Mux2 extends Module {
      val io = IO(new Bundle{
        val sel = Input(UInt(1.W))
        val in0 = Input(UInt(1.W))
        val in1 = Input(UInt(1.W))
        val out = Output(UInt(1.W))
      })

      io.out := (io.sel & io.in1) | (~io.sel & io.in0)
    }

在这里，“new Bundle { ... }”的写法是声明一个匿名类继承自Bundle，然后实例化匿名类。对于短小、简单的端口列表，可以使用这种简便写法。对于大的公用接口，应该单独写成具名的Bundle子类，方便修改。“io.out := ...”其实就是主构造方法的一部分，通过内建操作符和三个输入端口，实现了输出端口的逻辑行为。
   Ⅱ、例化模块

要例化一个模块，并不是直接用new生成一个实例对象就完成了，还需要再把实例的对象传递给单例对象Module的apply方法。这种别扭的语法是Scala的语法限制造成的，就像端口需要写成“IO(new Bundle {...})”，无符号数要写成“UInt(n.W)”等等一样。例如，下面的代码通过例化刚才的双输入多路选择器构建四输入多路选择器：

    // mux4.scala
    package test

    import chisel3._

    class Mux4 extends Module {
      val io = IO(new Bundle {
        val in0 = Input(UInt(1.W))
        val in1 = Input(UInt(1.W))
        val in2 = Input(UInt(1.W))
        val in3 = Input(UInt(1.W))
        val sel = Input(UInt(2.W))
        val out = Output(UInt(1.W))
      })

      val m0 = Module(new Mux2)
      m0.io.sel := io.sel(0)
      m0.io.in0 := io.in0
      m0.io.in1 := io.in1

      val m1 = Module(new Mux2)
      m1.io.sel := io.sel(0)
      m1.io.in0 := io.in2
      m1.io.in1 := io.in3

      val m2 = Module(new Mux2)
      m2.io.sel := io.sel(1)
      m2.io.in0 := m0.io.out
      m2.io.in1 := m1.io.out

      io.out := m2.io.out
    }

   Ⅲ、例化多个模块

像上个例子中，模块Mux2例化了三次，实际只需要一次性例化三个模块就可以了。对于要多次例化的重复模块，可以利用向量的工厂方法VecInit[T <: Data]。因为该方法接收的参数类型是Data的子类，而模块的字段io正好是Bundle类型，并且实际的电路连线仅仅只需针对模块的端口，所以可以把待例化模块的io字段组成一个序列，或者按重复参数的方式作为参数传递。通常使用序列作为参数，这样更节省代码。生成序列的一种方法是调用单例对象Seq里的方法fill，该方法的一个重载版本有两个单参数列表，第一个接收Int类型的对象，表示序列的元素个数，第二个是传名参数，接收序列的元素。

因为Vec是一种可索引的序列，所以这种方式例化的多个模块类似于“模块数组”，用下标索引第n个模块。另外，因为Vec的元素已经是模块的端口字段io，所以要引用例化模块的某个具体端口时，路径里不用再出现“io”。例如：

    // mux4_2.scala
    package test

    import chisel3._

    class Mux4_2 extends Module {
      val io = IO(new Bundle {
        val in0 = Input(UInt(1.W))
        val in1 = Input(UInt(1.W))
        val in2 = Input(UInt(1.W))
        val in3 = Input(UInt(1.W))
        val sel = Input(UInt(2.W))
        val out = Output(UInt(1.W))
      })

      val m = VecInit(Seq.fill(3)(Module(new Mux2).io))  // 例化了三个Mux2，并且参数是端口字段io
      m(0).sel := io.sel(0)  // 模块的端口通过下标索引，并且路径里没有“io”
      m(0).in0 := io.in0
      m(0).in1 := io.in1

      m(1).sel := io.sel(0)
      m(1).in0 := io.in2
      m(1).in1 := io.in3

      m(2).sel := io.sel(1)
      m(2).in0 := m(0).out
      m(2).in1 := m(1).out

      io.out := m(2).out
    }

四、线网

Chisel把线网作为电路的节点，通过工厂方法“Wire[T <: Data](t: T)”来定义。可以对线网进行赋值，也可以连接到其他电路节点，这是组成组合逻辑的基本硬件类型。例如：

    val myNode = Wire(UInt(8.W))

    myNode := 0.U

因为Scala作为软件语言是顺序执行的，定义具有覆盖性，所以如果对同一个线网多次赋值，则只有最后一次有效。例如下面的代码与上面的例子是等效的：

    val myNode = Wire(UInt(8.W))

    myNode := 10.U

    myNode := 0.U

五、寄存器

寄存器是时序逻辑的基本硬件类型，它们都是由当前时钟域的时钟上升沿触发的。如果模块里没有多时钟域的语句块，那么寄存器都是由隐式的全局时钟来控制。对于有复位信号的寄存器，如果不在多时钟域语句块里，则由隐式的全局复位来控制，并且高有效。目前Chisel所有的复位都是同步复位，异步复位功能还在开发中。如果需要异步复位寄存器，则需要通过黑盒引入。

有五种内建的寄存器，第一种是跟随寄存器“RegNext[T <: Data](next: T)”，在每个时钟上升沿，它都会采样一次传入的参数，并且没有复位信号。它的另一个版本的apply工厂方法是“RegNext[T <: Data](next: T, init: T)”，也就是由复位信号控制，当复位信号有效时，复位到指定值，否则就跟随。

第二种是复位到指定值的寄存器“RegInit[T <: Data](init: T)”，参数需要声明位宽，否则就是默认位宽。可以用内建的when语句进行条件赋值。

第三种是普通的寄存器“Reg[T <: Data](t: T)”，它可以在when语句里用全局reset信号进行同步复位(reset信号是Reset类型，要用toBool进行类型转换)，也可以进行条件赋值或无条件跟随。参数同样要指定位宽。

第四种是util包里的带一个使能端的寄存器“RegEnable[T <: Data](next: T, init: T, enable: Bool)”，如果不需要复位信号，则第二个参数可以省略给出。

第五种是util包里的移位寄存器“ShiftRegister[T <: Data](in: T, n: Int, resetData: T, en: Bool)”，其中第一个参数in是带移位的数据，第二个参数n是需要延迟的周期数，第三个参数resetData是指定的复位值，可以省略，第四个参数en是使能移位的信号，默认为true.B。

假如有如下代码：

    // reg.scala
    package test

    import chisel3._
    import chisel3.util._

    class REG extends Module {
      val io = IO(new Bundle {
        val a = Input(UInt(8.W))
        val en = Input(Bool())
        val c = Output(UInt(1.W))
      })

      val reg0 = RegNext(io.a)
      val reg1 = RegNext(io.a, 0.U)
      val reg2 = RegInit(0.U(8.W))
      val reg3 = Reg(UInt(8.W))
      val reg4 = Reg(UInt(8.W))
      val reg5 = RegEnable(io.a + 1.U, 0.U, io.en)
      val reg6 = RegEnable(io.a - 1.U, io.en)
      val reg7 = ShiftRegister(io.a, 3, 0.U, io.en)
      val reg8 = ShiftRegister(io.a, 3, io.en)

      reg2 := io.a.andR
      reg3 := io.a.orR

      when(reset.toBool) {
        reg4 := 0.U
      } .otherwise {
        reg4 := 1.U
      }

      io.c := reg0(0) & reg1(0) & reg2(0) & reg3(0) & reg4(0) & reg5(0) & reg6(0) & reg7(0) & reg8(0)
    }

对应生成的主要Verilog代码为：

    // REG.v
    module REG(
      input        clock,
      input        reset,
      input  [7:0] io_a,
      input        io_en,
      output       io_c
    );
      reg [7:0] reg0;
      reg [7:0] reg1;
      reg [7:0] reg2;
      reg [7:0] reg3;
      reg [7:0] reg4;
      wire [7:0] _T_1;
      reg [7:0] reg5;
      wire [8:0] _T_2;
      wire [8:0] _T_3;
      wire [7:0] _T_4;
      reg [7:0] reg6;
      reg [7:0] _T_5;
      reg [7:0] _T_6;
      reg [7:0] reg7;
      reg [7:0] _T_7;
      reg [7:0] _T_8;
      reg [7:0] reg8;
      wire [7:0] _T_9;
      wire  _T_10;
      wire  _T_11;
      wire  _GEN_8;
      wire  _T_13;
      wire  _T_14;
      wire  _T_15;
      wire  _T_16;
      wire  _T_17;
      wire  _T_18;
      wire  _T_19;
      wire  _T_20;
      wire  _T_21;
      wire  _T_22;
      wire  _T_23;
      wire  _T_24;
      wire  _T_25;
      wire  _T_26;
      wire  _T_27;
      wire  _T_28;
      assign _T_1 = io_a + 8'h1;
      assign _T_2 = io_a - 8'h1;
      assign _T_3 = $unsigned(_T_2);
      assign _T_4 = _T_3[7:0];
      assign _T_9 = ~ io_a;
      assign _T_10 = _T_9 == 8'h0;
      assign _T_11 = io_a != 8'h0;
      assign _GEN_8 = reset ? 1'h0 : 1'h1;
      assign _T_13 = reg0[0];
      assign _T_14 = reg1[0];
      assign _T_15 = _T_13 & _T_14;
      assign _T_16 = reg2[0];
      assign _T_17 = _T_15 & _T_16;
      assign _T_18 = reg3[0];
      assign _T_19 = _T_17 & _T_18;
      assign _T_20 = reg4[0];
      assign _T_21 = _T_19 & _T_20;
      assign _T_22 = reg5[0];
      assign _T_23 = _T_21 & _T_22;
      assign _T_24 = reg6[0];
      assign _T_25 = _T_23 & _T_24;
      assign _T_26 = reg7[0];
      assign _T_27 = _T_25 & _T_26;
      assign _T_28 = reg8[0];
      assign io_c = _T_27 & _T_28;

      always @(posedge clock) begin
        reg0 <= io_a;
        if (reset) begin
          reg1 <= 8'h0;
        end else begin
          reg1 <= io_a;
        end
        if (reset) begin
          reg2 <= 8'h0;
        end else begin
          reg2 <= {{7'd0}, _T_10};
        end
        reg3 <= {{7'd0}, _T_11};
        reg4 <= {{7'd0}, _GEN_8};
        if (reset) begin
          reg5 <= 8'h0;
        end else begin
          if (io_en) begin
            reg5 <= _T_1;
          end
        end
        if (io_en) begin
          reg6 <= _T_4;
        end
        if (reset) begin
          _T_5 <= 8'h0;
        end else begin
          if (io_en) begin
            _T_5 <= io_a;
          end
        end
        if (reset) begin
          _T_6 <= 8'h0;
        end else begin
          if (io_en) begin
            _T_6 <= _T_5;
          end
        end
        if (reset) begin
          reg7 <= 8'h0;
        end else begin
          if (io_en) begin
            reg7 <= _T_6;
          end
        end
        if (io_en) begin
          _T_7 <= io_a;
        end
        if (io_en) begin
          _T_8 <= _T_7;
        end
        if (io_en) begin
          reg8 <= _T_8;
        end
      end
    endmodule

六、寄存器组

上述构造寄存器的工厂方法，它们的参数可以是任何Data的子类型。如果把子类型Vec[T]作为参数传递进去，就会生成多个位宽相同、行为相同、名字前缀相同的寄存器。同样，寄存器组在Chisel代码里可以通过下标索引。例如：

    // reg2.scala
    package test

    import chisel3._
    import chisel3.util._

    class REG2 extends Module {
      val io = IO(new Bundle {
        val a = Input(UInt(8.W))
        val en = Input(Bool())
        val c = Output(UInt(1.W))
      })

      val reg0 = RegNext(VecInit(io.a, io.a))
      val reg1 = RegNext(VecInit(io.a, io.a), VecInit(0.U, 0.U))
      val reg2 = RegInit(VecInit(0.U(8.W), 0.U(8.W)))
      val reg3 = Reg(Vec(2, UInt(8.W)))
      val reg4 = Reg(Vec(2, UInt(8.W)))
      val reg5 = RegEnable(VecInit(io.a + 1.U, io.a + 1.U), VecInit(0.U(8.W), 0.U(8.W)), io.en)
      val reg6 = RegEnable(VecInit(io.a - 1.U, io.a - 1.U), io.en)
      val reg7 = ShiftRegister(VecInit(io.a, io.a), 3, VecInit(0.U(8.W), 0.U(8.W)), io.en)
      val reg8 = ShiftRegister(VecInit(io.a, io.a), 3, io.en)

      reg2(0) := io.a.andR
      reg2(1) := io.a.andR
      reg3(0) := io.a.orR
      reg3(1) := io.a.orR

      when(reset.toBool) {
        reg4(0) := 0.U
        reg4(1) := 0.U
      } .otherwise {
        reg4(0) := 1.U
        reg4(1) := 1.U
      }

      io.c := reg0(0)(0) & reg1(0)(0) & reg2(0)(0) & reg3(0)(0) & reg4(0)(0) & reg5(0)(0) & reg6(0)(0) & reg7(0)(0) & reg8(0)(0) &
              reg0(1)(0) & reg1(1)(0) & reg2(1)(0) & reg3(1)(0) & reg4(1)(0) & reg5(1)(0) & reg6(1)(0) & reg7(1)(0) & reg8(1)(0)
    }

对应的主要Verilog代码为：

    // REG2.v
    module REG2(
      input        clock,
      input        reset,
      input  [7:0] io_a,
      input        io_en,
      output       io_c
    );
      reg [7:0] reg0_0;
      reg [7:0] reg0_1;
      reg [7:0] reg1_0;
      reg [7:0] reg1_1;
      reg [7:0] reg2_0;
      reg [7:0] reg2_1;
      reg [7:0] reg3_0;
      reg [7:0] reg3_1;
      reg [7:0] reg4_0;
      reg [7:0] reg4_1;
      wire [7:0] _T_5;
      reg [7:0] reg5_0;
      reg [7:0] reg5_1;
      wire [8:0] _T_10;
      wire [8:0] _T_11;
      wire [7:0] _T_12;
      reg [7:0] reg6_0;
      reg [7:0] reg6_1;
      reg [7:0] _T_19_0;
      reg [7:0] _T_19_1;
      reg [7:0] _T_20_0;
      reg [7:0] _T_20_1;
      reg [7:0] reg7_0;
      reg [7:0] reg7_1;
      reg [7:0] _T_22_0;
      reg [7:0] _T_22_1;
      reg [7:0] _T_23_0;
      reg [7:0] _T_23_1;
      reg [7:0] reg8_0;
      reg [7:0] reg8_1;
      wire [7:0] _T_24;
      wire  _T_25;
      wire  _T_28;
      wire  _GEN_16;
      wire  _T_31;
      wire  _T_32;
      wire  _T_33;
      wire  _T_34;
      wire  _T_35;
      wire  _T_36;
      wire  _T_37;
      wire  _T_38;
      wire  _T_39;
      wire  _T_40;
      wire  _T_41;
      wire  _T_42;
      wire  _T_43;
      wire  _T_44;
      wire  _T_45;
      wire  _T_46;
      wire  _T_47;
      wire  _T_48;
      wire  _T_49;
      wire  _T_50;
      wire  _T_51;
      wire  _T_52;
      wire  _T_53;
      wire  _T_54;
      wire  _T_55;
      wire  _T_56;
      wire  _T_57;
      wire  _T_58;
      wire  _T_59;
      wire  _T_60;
      wire  _T_61;
      wire  _T_62;
      wire  _T_63;
      wire  _T_64;
      assign _T_5 = io_a + 8'h1;
      assign _T_10 = io_a - 8'h1;
      assign _T_11 = $unsigned(_T_10);
      assign _T_12 = _T_11[7:0];
      assign _T_24 = ~ io_a;
      assign _T_25 = _T_24 == 8'h0;
      assign _T_28 = io_a != 8'h0;
      assign _GEN_16 = reset ? 1'h0 : 1'h1;
      assign _T_31 = reg0_0[0];
      assign _T_32 = reg1_0[0];
      assign _T_33 = _T_31 & _T_32;
      assign _T_34 = reg2_0[0];
      assign _T_35 = _T_33 & _T_34;
      assign _T_36 = reg3_0[0];
      assign _T_37 = _T_35 & _T_36;
      assign _T_38 = reg4_0[0];
      assign _T_39 = _T_37 & _T_38;
      assign _T_40 = reg5_0[0];
      assign _T_41 = _T_39 & _T_40;
      assign _T_42 = reg6_0[0];
      assign _T_43 = _T_41 & _T_42;
      assign _T_44 = reg7_0[0];
      assign _T_45 = _T_43 & _T_44;
      assign _T_46 = reg8_0[0];
      assign _T_47 = _T_45 & _T_46;
      assign _T_48 = reg0_1[0];
      assign _T_49 = _T_47 & _T_48;
      assign _T_50 = reg1_1[0];
      assign _T_51 = _T_49 & _T_50;
      assign _T_52 = reg2_1[0];
      assign _T_53 = _T_51 & _T_52;
      assign _T_54 = reg3_1[0];
      assign _T_55 = _T_53 & _T_54;
      assign _T_56 = reg4_1[0];
      assign _T_57 = _T_55 & _T_56;
      assign _T_58 = reg5_1[0];
      assign _T_59 = _T_57 & _T_58;
      assign _T_60 = reg6_1[0];
      assign _T_61 = _T_59 & _T_60;
      assign _T_62 = reg7_1[0];
      assign _T_63 = _T_61 & _T_62;
      assign _T_64 = reg8_1[0];
      assign io_c = _T_63 & _T_64;

      always @(posedge clock) begin
        reg0_0 <= io_a;
        reg0_1 <= io_a;
        if (reset) begin
          reg1_0 <= 8'h0;
        end else begin
          reg1_0 <= io_a;
        end
        if (reset) begin
          reg1_1 <= 8'h0;
        end else begin
          reg1_1 <= io_a;
        end
        if (reset) begin
          reg2_0 <= 8'h0;
        end else begin
          reg2_0 <= {{7'd0}, _T_25};
        end
        if (reset) begin
          reg2_1 <= 8'h0;
        end else begin
          reg2_1 <= {{7'd0}, _T_25};
        end
        reg3_0 <= {{7'd0}, _T_28};
        reg3_1 <= {{7'd0}, _T_28};
        reg4_0 <= {{7'd0}, _GEN_16};
        reg4_1 <= {{7'd0}, _GEN_16};
        if (reset) begin
          reg5_0 <= 8'h0;
        end else begin
          if (io_en) begin
            reg5_0 <= _T_5;
          end
        end
        if (reset) begin
          reg5_1 <= 8'h0;
        end else begin
          if (io_en) begin
            reg5_1 <= _T_5;
          end
        end
        if (io_en) begin
          reg6_0 <= _T_12;
        end
        if (io_en) begin
          reg6_1 <= _T_12;
        end
        if (reset) begin
          _T_19_0 <= 8'h0;
        end else begin
          if (io_en) begin
            _T_19_0 <= io_a;
          end
        end
        if (reset) begin
          _T_19_1 <= 8'h0;
        end else begin
          if (io_en) begin
            _T_19_1 <= io_a;
          end
        end
        if (reset) begin
          _T_20_0 <= 8'h0;
        end else begin
          if (io_en) begin
            _T_20_0 <= _T_19_0;
          end
        end
        if (reset) begin
          _T_20_1 <= 8'h0;
        end else begin
          if (io_en) begin
            _T_20_1 <= _T_19_1;
          end
        end
        if (reset) begin
          reg7_0 <= 8'h0;
        end else begin
          if (io_en) begin
            reg7_0 <= _T_20_0;
          end
        end
        if (reset) begin
          reg7_1 <= 8'h0;
        end else begin
          if (io_en) begin
            reg7_1 <= _T_20_1;
          end
        end
        if (io_en) begin
          _T_22_0 <= io_a;
        end
        if (io_en) begin
          _T_22_1 <= io_a;
        end
        if (io_en) begin
          _T_23_0 <= _T_22_0;
        end
        if (io_en) begin
          _T_23_1 <= _T_22_1;
        end
        if (io_en) begin
          reg8_0 <= _T_23_0;
        end
        if (io_en) begin
          reg8_1 <= _T_23_1;
        end
      end
    endmodule

七、用when给电路赋值

在Verilog里，可以使用“if...else if...else”这样的条件选择语句来方便地构建电路的逻辑。由于Scala已经占用了“if…else if…else”语法，所以相应的Chisel控制结构改成了when语句，其语法如下：

    when (condition 1) { definition 1 }
    .elsewhen (condition 2) { definition 2 }
    ...
    .elsewhen (condition N) { definition N }
    .otherwise { default behavior }

注意，“.elsewhen”和“.otherwise”的开头有两个句点。所有的判断条件都是返回Bool类型的传名参数，不要和Scala的Boolean类型混淆，也不存在Boolean和Bool之间的相互转换。对于UInt、SInt和Reset类型，可以用方法toBool转换成Bool类型来作为判断条件。

when语句不仅可以给线网赋值，还可以给寄存器赋值，但是要注意构建组合逻辑时不能缺失“.otherwise”分支。通常，when用于给带使能信号的寄存器更新数据，组合逻辑不常用。对于有复位信号的寄存器，推荐使用RegInit来声明，这样生成的Verilog会自动根据当前的时钟域来同步复位，尽量不要在when语句里用“reset.toBool”作为复位条件。

除了when结构，util包里还有一个与之对偶的结构“unless”，如果unless的判定条件为false.B则一直执行，否则不执行：

    import chisel3.util._

    unless (condition) { definition }

八、总结：数据类型与硬件类型的区别

前一章介绍了Chisel的数据类型，其中常用的就五种：UInt、SInt、Bool、Bundle和Vec[T]。本章介绍了硬件类型，最基本的是IO、Wire和Reg三种，还有指明端口方向的Input、Output和Flipped。Module是沿袭了Verilog用模块构建电路的规则，不仅让熟悉Verilog/VHDL的工程师方便理解，也便于从Chisel转化成Verilog代码。

数据类型必须配合硬件类型才能使用，它不能独立存在，因为编译器只会把硬件类型生成对应的Verilog代码。从语法规则上来讲，这两种类型也有很大的区别，编译器会对数据类型和硬件类型加以区分。尽管从Scala的角度来看，硬件类型对应的工厂方法仅仅是“封装”了一遍作为入参的数据类型，其返回结果没变，比如Wire的工厂方法定义为：

    def apply[T <: Data](t: T)(implicit sourceInfo: SourceInfo, compileOptions: CompileOptions): T

可以看到，入参t的类型与返回结果的类型是一样的，但是还有配置编译器的隐式参数，很可能区别就源自这里。

但是从Chisel编译器的角度来看，这两者就是不一样。换句话说，硬件类型就好像在数据类型上“包裹了一层外衣(英文原文用单词binding来形容)”。比如，线网“Wire(UInt(8.W))”就像给数据类型“UInt(8.W)”包上了一个“Wire( )”。所以，在编写Chisel时，要注意哪些地方是数据类型，哪些地方又是硬件类型。这时，静态语言的优势便体现出来了，因为编译器会帮助程序员检查类型是否匹配。如果在需要数据类型的地方出现了硬件类型、在需要硬件类型的地方出现了数据类型，那么就会引发错误。程序员只需要按照错误信息去修改相应的代码，而不需要人工逐个检查。

例如，在前面介绍寄存器组的时候，示例代码里的一句是这样的：

    val reg0 = RegNext(VecInit(io.a, io.a))

读者可能会好奇为什么不写成如下形式：

    val reg0 = RegNext(Vec(2, io.a))

如果改成这样，那么编译器就会发出如下错误：

    [error] chisel3.core.Binding$ExpectedChiselTypeException: vec type 'chisel3.core.UInt@6147b2fd' must be a Chisel type, not hardware

这是因为方法Vec期望第二个参数是数据类型，这样它才能推断出返回的Vec[T]是数据类型。但实际的“io.a”是经过Input封装过的硬件类型，导致Vec[T]变成了硬件类型，所以发生了类型匹配错误。错误信息里也明确指示了，“Chisel type”指的就是数据类型，“hardware”指的就是硬件类型，而vec的类型应该是“Chisel type”，不应该变成硬件。

Chisel提供了一个用户API——chiselTypeOf[T <: Data](target: T): T，其作用就是把硬件类型的“封皮”去掉，变成纯粹的数据类型。因此，读者可能会期望如下代码成功：

    val reg0 = RegNext(Vec(2, chiselTypeOf(io.a)))

但是编译器仍然发出了错误信息：

    [error] chisel3.core.Binding$ExpectedHardwareException: reg next 'Vec(chisel3.core.UInt@65b0972a, chisel3.core.UInt@25155aa4)' must be hardware, not a bare Chisel type. Perhaps you forgot to wrap it in Wire(_) or IO(_)?

只不过，这次是RegNext出错了。chiselTypeOf确实把硬件类型变成了数据类型，所以Vec[T]的检查通过了。但RegNext是实打实的硬件——寄存器，它也需要根据入参来推断返回结果的类型，所以传入一个数据类型Vec[T]就引发了错误。错误信息还额外提示程序员，是否忘记了用Wire(_)或IO(_)来包裹裸露的数据类型。甚至是带有字面量的数据类型，比如“0.U(8.W)”这样的对象，也被当作是硬件类型。

综合考虑这两种错误，只有写成“val reg0 = RegNext(VecInit(io.a, io.a))”合适，因为VecInit专门接收硬件类型的参数来构造硬件向量，给VecInit传入数据类型反而会报错，尽管它的返回类型也是Vec[T]。另外，Reg(_)的参数是数据类型，不是硬件类型，所以示例代码中它的参数是Vec，而别的参数都是VecInit。

有了基本的数据类型和硬件类型后，就已经可以编写绝大多数组合逻辑与时序逻辑电路。下一章将介绍Chisel库里定义的常用原语，有了这些原语就能更快速地构建电路，而不需要只用这些基本类型来搭积木
————————————————
版权声明：本文为CSDN博主「_iChthyosaur」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_34291505/article/details/87714172
 */
class chapter3_模块与硬件类型 {

}
object chapter3 extends App{
  println("It is chapter 3")
}
