/*
本章讲解的内容比较繁杂，没有一个统一的中心思想。这些问题与实际编程没有太大关系，但是读者需要稍微留意。
一、动态命名模块

Chisel可以动态定义模块的名字，也就是转成Verilog时的模块名不使用定义的类名，而是使用重写的desiredName方法的返回字符串。模块和黑盒都适用。例如：

    class Coffee extends BlackBox {
       val io = IO(new Bundle {
           val I = Input(UInt(32.W))
           val O = Output(UInt(32.W))
       })
       override def desiredName = "Tea"
    }

    class Salt extends Module {
       val io = IO(new Bundle {})
       val drink = Module(new Coffee)
       override def desiredName = "SodiumMonochloride"
    }

对应的Verilog为：

    module SodiumMonochloride(
         input   clock,
         input   reset
    );
         wire [31:0] drink_O;
         wire [31:0] drink_I;
         Tea drink (
             .O(drink_O),
             .I(drink_I)
         );
         assign drink_I = 32'h0;
    endmodule

二、动态修改端口

Chisel通过引入Scala的Boolean参数、可选值以及if语句可以创建出可选的端口，在例化该模块时可以通过控制Boolean入参来生成不同的端口。例如：

    class ModuleWithOptionalIOs(flag: Boolean) extends Module {
       val io = IO(new Bundle {
           val in = Input(UInt(12.W))
           val out = Output(UInt(12.W))
           val out2 = if (flag) Some(Output(UInt(12.W))) else None
      })

       io.out := io.in
       if(flag) {
         io.out2.get := io.in
       }
    }

注意，端口应该包装成可选值，这样不需要端口时就能用对象None代替，编译出来的Verilog就不会生成这个端口。在给可选端口赋值时，应该先用可选值的get方法把端口解放出来。这里也体现了可选值语法的便利性。
三、生成正确的块内信号名

一般情况下，在when、withClockAndReset等语句块里定义的信号(线网和寄存器)，转换成Verilog时不会生成正确的变量名。例如：

    // name.scala
    package test

    import chisel3._

    class TestMod extends Module {
      val io = IO(new Bundle {
        val a = Input(Bool())
        val b = Output(UInt(4.W))
      })
      when (io.a) {
        val innerReg = RegInit(5.U(4.W))
        innerReg := innerReg + 1.U
        io.b := innerReg
      } .otherwise {
        io.b := 10.U
      }
    }

    object NameGen extends App {
      chisel3.Driver.execute(args, () => new TestMod)
    }

它对应生成的Verilog为：

    // TestMod.v
    module TestMod(
      input        clock,
      input        reset,
      input        io_a,
      output [3:0] io_b
    );
      reg [3:0] _T;
      wire [3:0] _T_2;
      assign _T_2 = _T + 4'h1;
      assign io_b = io_a ? _T : 4'ha;
      always @(posedge clock) begin
        if (reset) begin
          _T <= 4'h5;
        end else begin
          _T <= _T_2;
        end
      end
    endmodule

注意看，when语句块里声明的寄存器innerReg，被命名成了“_T”。

如果想让名字正确，则需要在build.sbt文件里加上：

    addCompilerPlugin("org.scalamacros" % "paradise" % "2.1.0" cross CrossVersion.full)

同时，设计代码里需要加上传递给Firrtl的注解：

    ...
    import chisel3._
    import chisel3.experimental.chiselName

    @chiselName
    class TestMod extends Module {
    ...

这样，对应的Verilog文件就有了正确的寄存器名字：

    // TestMod.v
    module TestMod(
      input        clock,
      input        reset,
      input        io_a,
      output [3:0] io_b
    );
      reg [3:0] innerReg;
      wire [3:0] _T_1;
      assign _T_1 = innerReg + 4'h1;
      assign io_b = io_a ? innerReg : 4'ha;
      always @(posedge clock) begin
        if (reset) begin
          innerReg <= 4'h5;
        end else begin
          innerReg <= _T_1;
        end
      end
    endmodule

四、拆包一个值(给拼接变量赋值)

在Verilog中，左侧的赋值对象可以是一个拼接起多个变量的值，例如：

    wire [1:0] a;
    wire [3:0] b;
    wire [2:0] c;
    wire [8:0] z = [...];
    assign {a, b, c} = z;

在Chisel里不能直接这么赋值。最简单的做法是先定义一个a、b、c组成的Bundle，高位定义在前面，然后创建线网z。线网z可以被直接赋值，被赋值后，z再调用方法asTypeOf。该方法接收一个Data类型的参数，可以把调用对象强制转换成参数的类型并返回，在这里也就是把a、b、c组成的Bundle作为参数。注意，返回结果是一个新对象，并没有直接修改调用对象z。强制转换必须保证不会出错。例如：

    class MyBundle extends Bundle {
      val a = UInt(2.W)
      val b = UInt(4.W)
      val c = UInt(3.W)
    }

    val z = Wire(UInt(9.W))
    z := ...
    val unpacked = z.asTypeOf(new MyBundle)
    unpacked.a
    unpacked.b
    unpacked.c

五、子字赋值

在Verilog中，可以直接给向量的某几位赋值。同样，Chisel受限于Scala，不支持直接给Bits类型的某几位赋值。子字赋值的可行办法是先调用Bits类型的toBools方法。该方法根据调用对象的0、1排列返回一个相应的Seq[Bool]类型的结果，并且低位在序列里的下标更小，比如第0位的下标就是0、第n位的下标就是n。然后用这个Seq[Bool]对象配合VecInit构成一个向量，此时就可以给单个比特赋值。注意，必须都是Bool类型，要注意赋值前是否需要类型转换。子字赋值完成后，Bool向量再调用asUInt、asSInt方法转换回来。例如：

    class TestModule extends Module {
       val io = IO(new Bundle {
           val in = Input(UInt(10.W))
           val bit = Input(Bool())
           val out = Output(UInt(10.W))
       })
       val bools = VecInit(io.in.toBools)
       bools(0) := io.bit
       io.out := bools.asUInt
    }

六、参数化的Bundle

因为Chisel是基于Scala和JVM的，所以当一个Bundle类的对象用于创建线网、IO等操作时，它并不是把自己作为参数，而是交出自己的一个复制对象，也就是说编译器需要知道如何来创建当前Bundle对象的复制对象。Chisel提供了一个内部的API函数cloneType，任何继承自Data的Chisel对象，要复制自身时，都是由cloneType负责返回该对象的复制对象。它对应的用户API则是chiselTypeOf。

当自定义的Bundle的主构造方法没有参数时，Chisel会自动推断出如何构造Bundle对象的复制，原因很简单，因为构造一个新的复制对象不需要任何参数，仅仅使用关键字new就行了。但是，如果自定义的Bundle带有参数列表，那么Chisel就无法推断了，因为传递进去的参数可以是任意的，并不一定就是完全地复制。此时需要用户自己重写Bundle类的cloneType方法，其形式为：

    override def cloneType = (new CustomBundle(arguments)).asInstanceOf[this.type]

例如：

    class ExampleBundle(a: Int, b: Int) extends Bundle {
       val foo = UInt(a.W)
       val bar = UInt(b.W)
       override def cloneType = (new ExampleBundle(a, b)).asInstanceOf[this.type]
    }

    class ExampleBundleModule(btype: ExampleBundle) extends Module {
       val io = IO(new Bundle {
           val out = Output(UInt(32.W))
           val b = Input(chiselTypeOf(btype))
       })
       io.out := io.b.foo + io.b.bar
    }

    class Top extends Module {
       val io = IO(new Bundle {
           val out = Output(UInt(32.W))
           val in = Input(UInt(17.W))
       })
       val x = Wire(new ExampleBundle(31, 17))
       x := DontCare
       val m = Module(new ExampleBundleModule(x))
       m.io.b.foo := io.in
       m.io.b.bar := io.in
       io.out := m.io.out
    }

例子中的ExampleBundle有两个参数，编译器无法在复制它的对象时推断出这两个参数是什么，所以重写的cloneType方法需要用户手动将两个参数传入，而且用asInstanceOf[this.type]保证返回对象的类型与this对象是一样的。

如果没有这个重写的cloneType的方法，编译器会提示把ExampleBundle的参数变成固定的和可获取的，以便cloneType方法能被自动推断，即非参数化Bundle不需要重写该方法。此外，变量x必须要用Wire包住ExampleBundle的对象，否则x在传递给ExampleBundleModule时，编译器会提示应该传入一个硬件而不是裸露的Chisel类型，并询问是否遗漏了Wire(_)或IO(_)。与之相反，“Input(chiselTypeOf(btype))”中的chiselTypeOf方法也必不可少，因为此时传入的btype是一个硬件，编译器会提示Input的参数应该是Chisel类型而不是硬件，需要使用方法chiselTypeOf解除包住ExampleBundle对象的Wire。

这个例子中，cloneType在构造复制对象时，仅仅是传递了对应的参数，这就会构造一个一模一样的新对象。为了进一步说明cloneType的作用，再来看一个“别扭”的例子：

    class TestBundle(a: Int, b: Int) extends Bundle {
      val A = UInt(a.W)
      val B = UInt(b.W)
      override def cloneType = (new TestBundle(5*b, a+1)).asInstanceOf[this.type]
    }

    class TestModule extends Module {
      val io = IO(new Bundle {
        val x = Input(UInt(10.W))
        val y = Input(UInt(5.W))
        val out = Output(new TestBundle(10, 5))
      })

      io.out.A := io.x
      io.out.B := io.y
    }

这里，cloneType在构造复制对象前，先把形参a、b做了一些算术操作，再传递给TestBundle的主构造方法使用。按常规思路，代码“Output(new TestBundle(10, 5))”应该构造两个输出端口：10bit的A和5bit的B。但实际生成的Verilog如下：

    module TestModule(
      input         clock,
      input         reset,
      input  [9:0]  io_x,
      input  [4:0]  io_y,
      output [24:0] io_out_A,
      output [10:0] io_out_B
    );
      assign io_out_A = {{15'd0}, io_x};
      assign io_out_B = {{6'd0}, io_y};
    endmodule

也就是说，“Output(new TestBundle(10, 5))”的真正形式应该是“Output((new TestBundle(10, 5)).cloneType)”，即Output的真正参数是对象TestBundle(10, 5)的cloneType方法构造出来的对象。而cloneType方法是用实参“5 * 5(b)”和“10(a) + 1”来分别赋予形参a和b，因此得出A的实际位宽是25bit，B的实际位宽是11bit。
七、Chisel泛型

Chisel本质上还是Scala，所以Chisel的泛型就是使用Scala的泛型语法，这使得电路参数化更加方便。无论是Chisel的函数还是模块，都可以用类型参数和上、下界来泛化。在例化模块时，传入不同类型的参数，就可能会产生不同的电路，而无需编写额外的代码，当然前提是逻辑、类型必须正确。

要熟练使用泛型比较麻烦，所需素材很多，这里就不再介绍。读者可以通过阅读Chisel的源码来学习它是如何进行泛型的。
八、未驱动的线网

Chisel的Invalidate API支持检测未驱动的输出型IO以及定义不完整的Wire定义，在编译成firrtl时会产生“not fully initialized”错误。换句话说，就是组合逻辑的真值表不完整，不能综合出完整的电路。如果确实需要不被驱动的线网，则可以赋给一个DontCare对象，这会告诉Firrtl编译器，该线网故意不被驱动。转换成的Verilog会赋予该信号全0值，甚至把逻辑全部优化掉，所以谨慎使用。例如：

    val io = IO(new Bundle {
        val outs = Output(Vec(10, Bool()))
    })
    io.outs <> DontCare

检查机制是由CompileOptions.explicitInvalidate控制的，如果把它设置成true就是严格模式(执行检查)，设置成false就是不严格模式(不执行检查)。开关方法有两种，第一种是定义一个抽象的模块类，由抽象类设置，其余模块都继承自这个抽象类。例如：

    // 严格
    abstract class ExplicitInvalidateModule extends Module()(chisel3.core.ExplicitCompileOptions.NotStrict.copy(explicitInvalidate = true))

    // 不严格
    abstract class ImplicitInvalidateModule extends Module()(chisel3.core.ExplicitCompileOptions.Strict.copy(explicitInvalidate = false))

第二种方法是在每个模块里重写compileOptions字段，由该字段设置编译选项。例如：

    // 严格
    class MyModule extends Module {
      override val compileOptions = chisel3.core.ExplicitCompileOptions.NotStrict.copy(explicitInvalidate = true)
      ...
    }

    // 不严格
    class MyModule extends Module {
      override val compileOptions = chisel3.core.ExplicitCompileOptions.Strict.copy(explicitInvalidate = false)
      ...
    }

九、总结

本章内容是编写Chisel时的常见问题汇总。最常出现的错误就是“not fully initialized”，读者应该根据提示信息查看设计中是否有情况没覆盖全的组合逻
————————————————
版权声明：本文为CSDN博主「_iChthyosaur」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_34291505/article/details/87919766
 */
class chapter9_其它议题 {

}
