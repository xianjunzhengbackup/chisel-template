/*
前两章介绍了基本的数据类型和硬件类型，已经足够编写基本的小规模电路。至于要如何生成Verilog，会在后续章节讲解。如果要编写大型电路，当然也可以一砖一瓦地搭建，但是费时费力，完全体现不出软件语言的优势。Chisel在语言库里定义了很多常用的硬件原语，读者可以直接导入相应的包来使用。让编译器多干活，让程序员少费力。
一、多路选择器

因为多路选择器是一个很常用的电路模块，所以Chisel内建了几种多路选择器。第一种形式是二输入多路选择器“Mux(sel, in1, in2)”。sel是Bool类型，in1和in2的类型相同，都是Data的任意子类型。当sel为true.B时，返回in1，否则返回in2。

因为Mux仅仅是把一个输入返回，所以Mux可以内嵌Mux，构成n输入多路选择器，类似于嵌套的三元操作符。其形式为“Mux(c1, a, Mux(c2, b, Mux(..., default)))”。第二种就是针对上述n输入多路选择器的简便写法，形式为“MuxCase(default, Array(c1 -> a, c2 -> b, ...))”，它的展开与嵌套的Mux是一样的。第一个参数是默认情况下返回的结果，第二个参数是一个数组，数组的元素是对偶“(成立条件，被选择的输入)”。MuxCase在chisel3.util包里。

第三种是MuxCase的变体，它相当于把MuxCase的成立条件依次换成从0开始的索引值，就好像一个查找表，其形式为“MuxLookup(idx, default, Array(0.U -> a, 1.U -> b, ...))”。它的展开相当于“MuxCase(default, Array((idx === 0.U) -> a, (idx === 1.U) -> b, ...))”。MuxLookup也在chisel3.util包里。

第四种是chisel3.util包里的独热码多路选择器，它的选择信号是一个独热码。如果零个或多个选择信号有效，则行为未定义。其形式如下：

    val hotValue = Mux1H(Seq(
        io.selector(0) -> 2.U,
        io.selector(1) -> 4.U,
        io.selector(2) -> 8.U,
        io.selector(4) -> 11.U
    ))

内建的多路选择器会转换成Verilog的三元操作符“? :”，这对于构建组合逻辑而言是完全足够的，而且更推荐这种做法，所以when语句常用于给寄存器赋值，而很少用来给线网赋值。读者可能习惯用always语句块来编写电路，但这存在一些问题：首先，always既可以综合出时序逻辑又能综合出组合逻辑，导致reg变量存在二义性，常常使得新手误解reg就是寄存器；其次，if...else if...else不能传播控制变量的未知态x(某些EDA工具可以)，使得仿真阶段无法发现一些错误，但是assign语句会在控制变量为x时也输出x。工业级的Verilog，都是用assign语句来构建电路。时序逻辑也是通过例化触发器模块来完成的，相应的端口都是由assign来驱动，而且触发器会使用SystemVerilog的断言来寻找always语句里的x和z。整个设计应该尽量避免使用always语句。
二、ROM

可以通过工厂方法“VecInit[T <: Data](elt0: T, elts: T*)”或“VecInit[T <: Data](elts: Seq[T])”来创建一个只读存储器，参数就是ROM里的常量数值，对应的Verilog代码就是给读取ROM的线网或寄存器赋予常量值。例如：

    // rom.scala
    package test

    import chisel3._

    class ROM extends Module {
      val io = IO(new Bundle {
        val sel = Input(UInt(2.W))
        val out = Output(UInt(8.W))
      })

      val rom = VecInit(1.U, 2.U, 3.U, 4.U)

      io.out := rom(io.sel)
    }

对应的Verilog为：

    // ROM.v
    module ROM(
      input        clock,
      input        reset,
      input  [1:0] io_sel,
      output [7:0] io_out
    );
      wire [2:0] _GEN_1;
      wire [2:0] _GEN_2;
      wire [2:0] _GEN_3;
      assign _GEN_1 = 2'h1 == io_sel ? 3'h2 : 3'h1;
      assign _GEN_2 = 2'h2 == io_sel ? 3'h3 : _GEN_1;
      assign _GEN_3 = 2'h3 == io_sel ? 3'h4 : _GEN_2;
      assign io_out = {{5'd0}, _GEN_3};
    endmodule

在这个例子里需要提的一点是，Vec[T]类的apply方法不仅可以接收Int类型的索引值，另一个重载版本还能接收UInt类型的索引值。所以对于承担地址、计数器等功能的部件，可以直接作为由Vec[T]构造的元素的索引参数，比如这个例子中根据sel端口的值来选择相应地址的ROM值。
三、RAM

Chisel支持两种类型的RAM。第一种RAM是同步(时序)写，异步(组合逻辑)读，通过工厂方法“Mem[T <: Data](size: Int, t: T)”来构建。例如：

    val asyncMem = Mem(16, UInt(32.W))

由于现代的FPGA和ASIC技术已经不再支持异步读RAM，所以这种RAM会被综合成寄存器阵列。第二种RAM则是同步(时序)读、写，通过工厂方法“SyncReadMem[T <: Data](size: Int, t: T)”来构建，这种RAM会被综合成实际的SRAM。在Verilog代码上，这两种RAM都是由reg类型的变量来表示的，区别在于第二种RAM的读地址会被地址寄存器寄存一次。例如：

    val syncMem = SyncReadMem(16, UInt(32.W))

写RAM的语法是：

    when(wr_en) {
         mem.write(address, dataIn)
         out := DontCare
    }

其中DontCare告诉Chisel的未连接线网检测机制，写入RAM时读端口的行为无需关心。

读RAM的语法是：

    out := mem.read(address, rd_en)

读、写使能信号都可以省略。

要综合出实际的SRAM，读者最好了解自己的综合器是如何推断的，按照综合器的推断规则来编写模块的端口定义、时钟域划分、读写使能的行为等等，否则就可能综合出寄存器阵列而不是SRAM。以Vivado 2018.3为例，下面的单端口SRAM代码经过综合后会映射到FPGA上实际的BRAM资源，而不是寄存器：

    // ram.scala
    package test

    import chisel3._

    class SinglePortRAM extends Module {
      val io = IO(new Bundle {
        val addr = Input(UInt(10.W))
        val dataIn = Input(UInt(32.W))
        val en = Input(Bool())
        val we = Input(Bool())
        val dataOut = Output(UInt(32.W))
      })

      val syncRAM = SyncReadMem(1024, UInt(32.W))

      when(io.en) {
        when(io.we) {
          syncRAM.write(io.addr, io.dataIn)
          io.dataOut := DontCare
        } .otherwise {
          io.dataOut := syncRAM.read(io.addr)
        }
      } .otherwise {
        io.dataOut := DontCare
      }
    }

下面是Vivado综合后的部分截图，可以看到确实变成了实际的BRAM：
Vivado的BRAM最多支持真·双端口，按照对应的Verilog模板逆向编写Chisel，然后用编译器把Chisel转换成Verilog。但此时编译器生成的Verilog代码并不能被Vivado的综合器识别出来。原因在于SyncReadMem生成的Verilog代码是用一级寄存器保存输入的读地址，然后用读地址寄存器去异步读取RAM的数据，而Vivado的综合器识别不出这种模式的RAM。读者必须手动修改成用一级寄存器保存异步读取的数据而不是读地址，然后把读数据寄存器的内容用assign语句赋值给读数据端口，这样才能被识别成真·双端口BRAM。尚不清楚其它综合器是否有这个问题。经过咨询SiFive的工作人员，对方答复因为当前转换的代码把延迟放在地址一侧，所以流水线的节拍设计也是根据这个来的。考虑到贸然修改SyncReadMem的行为，可能会潜在地影响其它用户对流水线的设计，故而没有修改计划。如果确实需要自定义的、对综合器友好的Verilog代码，可以使用黑盒功能替代，或者给Firrtl编译器传入参数，改用自定义脚本来编译Chisel。
四、带写掩模的RAM

RAM通常都具备按字节写入的功能，比如数据写入端口的位宽是32bit，那么就应该有4bit的写掩模信号，只有当写掩模比特有效时，对应的字节才会写入。Chisel也具备构建带写掩模的RAM的功能。

当构建RAM的数据类型为Vec[T]时，就会推断出该RAM具有写掩模。此时，需要定义一个Seq[Bool]类型的写掩模信号，序列的元素个数为数据写入端口的位宽除以字节宽度。而write方法有一个重载版本，就是第三个参数是接收写掩模信号的。当下标为0的写掩模比特是true.B时，最低的那个字节会被写入，依次类推。下面是一个带写掩模的单端口RAM：

    // maskram.scala
    package test

    import chisel3._
    import chisel3.util._

    class MaskRAM extends Module {
      val io = IO(new Bundle {
        val addr = Input(UInt(10.W))
        val dataIn = Input(UInt(32.W))
        val en = Input(Bool())
        val we = Input(UInt(4.W))
        val dataOut = Output(UInt(32.W))
      })

      val dataIn_temp = Wire(Vec(4, UInt(8.W)))
      val dataOut_temp = Wire(Vec(4, UInt(8.W)))
      val mask = Wire(Vec(4, Bool()))

      val syncRAM = SyncReadMem(1024, Vec(4, UInt(8.W)))

      when(io.en) {
        syncRAM.write(io.addr, dataIn_temp, mask)
        dataOut_temp := syncRAM.read(io.addr)
      } .otherwise {
        dataOut_temp := DontCare
      }

      for(i <- 0 until 4) {
        dataIn_temp(i) := io.dataIn(8*i+7, 8*i)
        mask(i) := io.we(i).toBool
        io.dataOut := Cat(dataOut_temp(3), dataOut_temp(2), dataOut_temp(1), dataOut_temp(0))
      }
    }

读、写端口和写掩模可以不用定义成一个UInt，也可以是Vec[UInt]，这样定义只是为了让模块对外只有一个读端口、一个写端口和一个写掩模端口。注意，编译器会把Vec[T]的元素逐个展开，而不是合并成压缩数组的形式。也正是如此，上述代码对应的Verilog中，把RAM主体定义成了“reg [7:0] syncRAM_0 [0:1023]”、“reg [7:0] syncRAM_1 [0:1023]”、“reg [7:0] syncRAM_2 [0:1023]”和“reg [7:0] syncRAM_3 [0:1023]”，而不是一个“reg [31:0] syncRAM [0:1023]”。这样，Vivado综合出来的电路是四小块BRAM，而不是一大块BRAM。
五、从文件读取数据到RAM

在experimental包里有一个单例对象loadMemoryFromFile，它的apply方法可以在Chisel层面上从txt文件读取数据到RAM里。其定义如下所示：

    def apply[T <: Data](memory: MemBase[T], fileName: String, hexOrBinary: FileType = MemoryLoadFileType.Hex): Unit

第一个参数是MemBase[T]类型的，也就是Mem[T]和SyncReadMem[T]的超类，该参数接收一个自定义的RAM对象。第二个参数是文件的名字及路径，用字符串表示。第三个参数表示读取的方式为十六进制或二进制，默认是MemoryLoadFileType.Hex，也可以改成MemoryLoadFileType.Binary。注意，没有十进制和八进制。

该方法其实就是调用Verilog的系统函数“$readmemh”和“$readmemb”，所以要注意文件路径的书写和数据的格式都要按照Verilog的要求书写。最好把数据文件放在resources文件夹里。例如：

    // loadmem.scala
    package test

    import chisel3._
    import chisel3.util.experimental.loadMemoryFromFile

    class LoadMem extends Module {
      val io = IO(new Bundle {
        val address = Input(UInt(3.W))
        val value   = Output(UInt(8.W))
      })
      val memory = Mem(8, UInt(8.W))
      io.value := memory.read(io.address)
      loadMemoryFromFile(memory, "~/chisel-workspace/chisel-template/mem.txt")
    }

那么就会得到两个Verilog文件：

    // LoadMem.v
    module LoadMem(
      input        clock,
      input        reset,
      input  [2:0] io_address,
      output [7:0] io_value
    );
      reg [7:0] memory [0:7];
      wire [7:0] memory__T_data;
      wire [2:0] memory__T_addr;
      assign memory__T_addr = io_address;
      assign memory__T_data = memory[memory__T_addr];
      assign io_value = memory__T_data;
    endmodule

    // LoadMem.LoadMem.memory.v
    module BindsTo_0_LoadMem(
      input        clock,
      input        reset,
      input  [2:0] io_address,
      output [7:0] io_value
    );

    initial begin
      $readmemh("~/chisel-workspace/chisel-template/mem.txt", LoadMem.memory);
    end
    endmodule

在用Verilator仿真时，它会识别这个Chisel代码，从文件读取数据。
六、计数器

计数器也是一个常用的硬件电路。Chisel在util包里定义了一个自增计数器原语Counter，它的工厂方法接收两个参数：第一个参数是Bool类型的使能信号，为true.B时计数器从0开始每个时钟上升沿加1自增，为false.B时则计数器保持不变；第二个参数需要一个Int类型的具体正数，当计数到该值时归零。该方法返回一个二元组，其第一个元素是计数器的计数值，第二个元素是判断计数值是否等于期望值的结果。工厂方法的另一个重载版本没有使能信号。

有如下示例代码：

    // counter.scala
    package test

    import chisel3._
    import chisel3.util._

    class MyCounter extends Module {
      val io = IO(new Bundle {
        val en = Input(Bool())
        val out = Output(UInt(8.W))
        val valid = Output(Bool())
      })

      val (a, b) = Counter(io.en, 233)
      io.out := a
      io.valid := b
    }

它生成的主要Verilog代码为：

    // MyCounter.v
    module MyCounter(
      input        clock,
      input        reset,
      input        io_en,
      output [7:0] io_out,
      output       io_valid
    );
      reg [7:0] value;
      wire  _T;
      wire [7:0] _T_2;
      assign _T = value == 8'he8;
      assign _T_2 = value + 8'h1;
      assign io_out = value;
      assign io_valid = io_en & _T;

      always @(posedge clock) begin
        if (reset) begin
          value <= 8'h0;
        end else begin
          if (io_en) begin
            if (_T) begin
              value <= 8'h0;
            end else begin
              value <= _T_2;
            end
          end
        end
      end
    endmodule
————————————————
版权声明：本文为CSDN博主「_iChthyosaur」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_34291505/article/details/87862433


七、16位线性反馈移位寄存器

如果要产生伪随机数，可以使用util包里的16位线性反馈移位寄存器原语LFSR16，它接收一个Bool类型的使能信号，用于控制寄存器是否移位，缺省值为true.B。它返回一个UInt(16.W)类型的结果。例如：

    // lfsr.scala
    package test

    import chisel3._
    import chisel3.util._

    class LFSR extends Module {
      val io = IO(new Bundle {
        val en = Input(Bool())
        val out = Output(UInt(16.W))
      })

      io.out := LFSR16(io.en)
    }

它生成的主要Verilog代码为：

    // LFSR.v
    module LFSR(
      input         clock,
      input         reset,
      input         io_en,
      output [15:0] io_out
    );
      reg [15:0] _T;
      wire  _T_1;
      wire  _T_2;
      wire  _T_3;
      wire  _T_4;
      wire  _T_5;
      wire  _T_6;
      wire  _T_7;
      wire [14:0] _T_8;
      wire [15:0] _T_9;
      assign _T_1 = _T[0];
      assign _T_2 = _T[2];
      assign _T_3 = _T_1 ^ _T_2;
      assign _T_4 = _T[3];
      assign _T_5 = _T_3 ^ _T_4;
      assign _T_6 = _T[5];
      assign _T_7 = _T_5 ^ _T_6;
      assign _T_8 = _T[15:1];
      assign _T_9 = {_T_7,_T_8};
      assign io_out = _T;

      always @(posedge clock) begin
        if (reset) begin
          _T <= 16'h1;
        end else begin
          if (io_en) begin
            _T <= _T_9;
          end
        end
      end
    endmodule

八、状态机

状态机也是常用电路，但是Chisel没有直接构建状态机的原语。不过，util包里定义了一个Enum特质及其伴生对象。伴生对象里的apply方法定义如下：

    def apply(n: Int): List[UInt]

它会根据参数n返回对应元素数的List[UInt]，每个元素都是不同的，所以可以作为枚举值来使用。最好把枚举状态的变量名也组成一个列表，然后用列表的模式匹配来进行赋值。有了枚举值后，可以通过“switch…is…is”语句来使用。其中，switch里是相应的状态寄存器，而每个is分支的后面则是枚举值及相应的定义。例如检测持续时间超过两个时钟周期的高电平：

    // fsm.scala
    package test

    import chisel3._
    import chisel3.util._

    class DetectTwoOnes extends Module {
      val io = IO(new Bundle {
        val in = Input(Bool())
        val out = Output(Bool())
      })

      val sNone :: sOne1 :: sTwo1s :: Nil = Enum(3)
      val state = RegInit(sNone)

      io.out := (state === sTwo1s)

      switch (state) {
        is (sNone) {
          when (io.in) {
            state := sOne1
          }
        }
        is (sOne1) {
          when (io.in) {
            state := sTwo1s
          } .otherwise {
            state := sNone
          }
        }
        is (sTwo1s) {
          when (!io.in) {
            state := sNone
          }
        }
      }
    }

注意，枚举状态名的首字母要小写，这样Scala的编译器才能识别成变量模式匹配。它生成的Verilog为：

    // DetectTwoOnes.v
    module DetectTwoOnes(
      input   clock,
      input   reset,
      input   io_in,
      output  io_out
    );
      reg [1:0] state;
      wire  _T_1;
      wire  _T_2;
      wire  _T_3;
      wire  _T_4;
      assign _T_1 = 2'h0 == state;
      assign _T_2 = 2'h1 == state;
      assign _T_3 = 2'h2 == state;
      assign _T_4 = io_in == 1'h0;
      assign io_out = state == 2'h2;
      always @(posedge clock) begin
        if (reset) begin
          state <= 2'h0;
        end else begin
          if (_T_1) begin
            if (io_in) begin
              state <= 2'h1;
            end
          end else begin
            if (_T_2) begin
              if (io_in) begin
                state <= 2'h2;
              end else begin
                state <= 2'h0;
              end
            end else begin
              if (_T_3) begin
                if (_T_4) begin
                  state <= 2'h0;
                end
              end
            end
          end
        end
      end
    endmodule

 九、总结

本章介绍了Chisel内建的常用原语，还有更多原语可以使用，比如Bundle衍生的几种端口类，读者可以通过查询API或源码来进一步了解。
————————————————
版权声明：本文为CSDN博主「_iChthyosaur」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_34291505/article/details/87862433
 */
class chapter4_常用的硬件原语 {

}
