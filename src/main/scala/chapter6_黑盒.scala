/*
因为Chisel的功能相对Verilog来说还不完善，所以设计人员在当前版本下无法实现的功能，就需要用Verilog来实现。在这种情况下，可以使用Chisel的BlackBox功能，它的作用就是向Chisel代码提供了用Verilog设计的电路的接口，使得Chisel层面的代码可以通过模块的端口来进行交互。
一、例化黑盒

如果读者尝试在Chisel的模块里例化另一个模块，然后生成Verilog代码，就会发现端口名字里多了“io_”这样的字眼。很显然，这是因为Chisel要求模块的端口都是由字段“io”来引用的，语法分析脚本在生成Verilog代码时会保留这个端口名前缀。

假设有一个外部的Verilog模块，它的端口列表声明如下：

    module Dut ( input [31: 0] a, input clk, input reset, output [3: 0] b );

按照Verilog的语法，它的例化代码应该是这样的：

    Dut u0 ( .a(u0_a), .clk(u0_clk), .reset(u0_reset), .b(u0_b) );

其中，例化时的名字和连接的线网名是可以任意的，但是模块名“Dut”和端口名“.a”、“.clk”、“.reset”、 “.b”是固定的。

倘若把这个Verilog模块声明成普通的Chisel模块，然后直接例化使用，那么例化的Verilog代码就会变成：

    Dut u0 ( .io_a(io_u0_a), .io_clk(io_u0_clk), .io_reset(io_u0_reset), .io_b(io_u0_b) );

也就是说，本来应该是“.a”，变成了“.io_a”。当然，这样做首先在Chisel层面上就不会成功，因为Chisel的编译器不允许模块内部连线为空，不能只有端口声明而没有内部连线的模块。

如果定义Dut类时，不是继承自Module，而是继承自BlackBox，则允许只有端口定义，也只需要端口定义。此外，在别的模块里例化黑盒时，编译器不会给黑盒的端口名加上“io_”，连接的线网名变成引用黑盒的变量名与黑盒端口名的组合。例如：

    // blackbox.scala
    package test

    import chisel3._

    class Dut extends BlackBox {
      val io = IO(new Bundle {
        val a = Input(UInt(32.W))
        val clk = Input(Clock())
        val reset = Input(Bool())
        val b = Output(UInt(4.W))
      })
    }

    class UseDut extends Module {
      val io = IO(new Bundle {
        val toDut_a = Input(UInt(32.W))
        val toDut_b = Output(UInt(4.W))
      })

      val u0 = Module(new Dut)

      u0.io.a := io.toDut_a
      u0.io.clk := clock
      u0.io.reset := reset
      io.toDut_b := u0.io.b
    }

    object UseDutTest extends App {
      chisel3.Driver.execute(args, () => new UseDut)
    }

它对应生成的Verilog代码为：

    // UseDut.v
    module UseDut(
      input         clock,
      input         reset,
      input  [31:0] io_toDut_a,
      output [3:0]  io_toDut_b
    );
      wire [31:0] u0_a; // @[blackbox.scala 20:18]
      wire  u0_clk; // @[blackbox.scala 20:18]
      wire  u0_reset; // @[blackbox.scala 20:18]
      wire [3:0] u0_b; // @[blackbox.scala 20:18]
      Dut u0 ( // @[blackbox.scala 20:18]
        .a(u0_a),
        .clk(u0_clk),
        .reset(u0_reset),
        .b(u0_b)
      );
      assign io_toDut_b = u0_b; // @[blackbox.scala 25:14]
      assign u0_a = io_toDut_a; // @[blackbox.scala 22:11]
      assign u0_clk = clock; // @[blackbox.scala 23:13]
      assign u0_reset = reset; // @[blackbox.scala 24:15]
    endmodule

可以看到，例化黑盒生成的Verilog代码，完全符合Verilog例化模块的语法规则。通过黑盒导入Verilog模块的端口列表给Chisel模块使用，然后把Chisel代码转换成Verilog，把它与导入的Verilog一同传递给EDA工具使用。

BlackBox的构造方法可以接收一个Map[String, Param]类型的参数，这会使得例化外部的Verilog模块时具有配置模块的“#(参数配置)”。映射的键固定是字符串类型，它对应Verilog里声明的参数名；映射的值对应传入的配置参数，可以是字符串，也可以是整数和浮点数。虽然值的类型是Param，这是一个Chisel的印章类，但是单例对象chisel3.experimental里定义了相应的隐式转换，可以把BigInt、Int、Long、Double和String转换成对应的Param类型。例如把上例修改成：

    ...
    import chisel3.experimental._

    class Dut extends BlackBox(Map("DATA_WIDTH" -> 32,
                                   "MODE" -> "Sequential",
                                   "RESET" -> "Asynchronous")) {
      val io = IO(new Bundle {
        val a = Input(UInt(32.W))
        val clk = Input(Clock())
        val reset = Input(Bool())
        val b = Output(UInt(4.W))
      })
    }
    ...

对应的Verilog就变成了：

    ...
      Dut #(.DATA_WIDTH(32), .MODE("Sequential"), .RESET("Asynchronous")) u0 ( // @[blackbox.scala 23:18]
        .a(u0_a),
        .clk(u0_clk),
        .reset(u0_reset),
        .b(u0_b)
      );
    ...

通过这种方式，借助Verilog把Chisel的功能暂时补齐了。比如UCB发布的Rocket-Chip，就是用黑盒导入异步寄存器，供内部代码使用。
二、复制Verilog文件

chisel3.util包里有一个特质HasBlackBoxResource，如果在黑盒类里混入这个特质，并且在src/main/resources文件夹里有对应的Verilog源文件，那么在Chisel转换成Verilog时，就会把Verilog文件一起复制到目标文件夹。例如：

    ...
    import chisel3.util._

    class Dut extends BlackBox with HasBlackBoxResource {
      val io = IO(new Bundle {
        val a = Input(UInt(32.W))
        val clk = Input(Clock())
        val reset = Input(Bool())
        val b = Output(UInt(4.W))
      })

      setResource("/dut.v")
    }
    ...

注意，相比一般的黑盒，除了端口列表的声明，还多了一个特质里的setResource方法的调用。方法的入参是Verilog文件的相对地址，即相对src/main/resources的地址。
三、内联Verilog文件

chisel3.util包里还有有一个特质HasBlackBoxInline，混入该特质的黑盒类可以把Verilog代码直接内嵌进去。内嵌的方式是调用特质里的方法“setInline(blackBoxName: String, blackBoxInline: String)”，类似于setResource的用法。这样，目标文件夹里就会生成一个单独的Verilog文件，复制内嵌的代码。该方法适合小型Verilog设计。例如：

    ...
    import chisel3.util._

    class Dut extends BlackBox with HasBlackBoxInline {
      val io = IO(new Bundle {
        val a = Input(UInt(32.W))
        val clk = Input(Clock())
        val reset = Input(Bool())
        val b = Output(UInt(4.W))
      })

      setInline("dut.v",
                """
                |module dut(input [31:0] a,
                |           input clk,
                |           input reset,
                |           output [3:0] b);
                |
                |  reg [3:0] b_temp;
                |
                |  always @ (posedge clk, negedge reset)
                |    if(!reset)
                |      b_temp <= 'b0;
                |    else if(a == 'b0)
                |      b_temp <= b_temp + 1'b1
                |
                |  assign b = b_temp;
                |endmodule
                """.stripMargin)
    }
    ...

字符串中的“ | ”表示文件的边界，比如Scala的解释器在换行后的开头就是一根竖线，方法stripMargin用于消除竖线左侧的空格。

调用这个黑盒的模块在转换成Verilog后，目标文件夹里会生成一个“dut.v”文件，内容就是内嵌的Verilog代码。
四、inout端口

Chisel目前只支持在黑盒中引入Verilog的inout端口。Bundle中使用 “Analog(位宽)”声明Analog类型的端口，经过编译后变成Verilog的inout端口。模块里的端口可以声明成Analog类型，但只能用于与黑盒连接，不能在Chisel代码中进行读写。因为是双向端口，所以不需要用Input或Output指明方向，但是可以用Flipped来翻转，也就不会影响整个Bundle的翻转。使用前，要先用“chisel3.experimental._”进行导入。

例如：

    // inout.scala
    package test

    import chisel3._
    import chisel3.util._
    import chisel3.experimental._

    class InoutIO extends Bundle {
      val a = Analog(16.W)
      val b = Input(UInt(16.W))
      val sel = Input(Bool())
      val c = Output(UInt(16.W))
    }

    class InoutPort extends BlackBox with HasBlackBoxInline {
      val io = IO(new InoutIO)

      setInline("InoutPort.v",
        """
        |module InoutPort( inout [15:0] a,
        |                  input [15:0] b,
        |                  input        sel,
        |                  output [15:0] c);
        |  assign a = sel ? 'bz : b;
        |  assign c = sel ? a : 'bz;
        |endmodule
        """.stripMargin)
    }

    class MakeInout extends Module {
      val io = IO(new InoutIO)

      val m = Module(new InoutPort)

      m.io <> io
    }

    object InoutGen extends App {
      chisel3.Driver.execute(args, () => new MakeInout)
    }

对应的Verilog为：

    // MakeInout.v
    module MakeInout(
      input         clock,
      input         reset,
      inout  [15:0] io_a,
      input  [15:0] io_b,
      input         io_sel,
      output [15:0] io_c
    );
      wire [15:0] m_b; // @[inout.scala 32:17]
      wire  m_sel; // @[inout.scala 32:17]
      wire [15:0] m_c; // @[inout.scala 32:17]
      InoutPort m ( // @[inout.scala 32:17]
        .a(io_a),
        .b(m_b),
        .sel(m_sel),
        .c(m_c)
      );
      assign io_c = m_c; // @[inout.scala 34:8]
      assign m_b = io_b; // @[inout.scala 34:8]
      assign m_sel = io_sel; // @[inout.scala 34:8]
    endmodule

五、总结

本章介绍了三种黑盒的用法，其目的在于通过外部的Verilog文件来补充Chisel还没有的功能。除此之外，由于还没有EDA工具直接支持Chisel，比如在开发FPGA项目时，要例化Xilinx或Altera的IP，就需要用到黑盒。
————————————————
版权声明：本文为CSDN博主「_iChthyosaur」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_34291505/article/details/87894928
 */
class chapter6_黑盒 {

}
