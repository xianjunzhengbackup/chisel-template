/*
在数字电路中免不了用到多时钟域设计，尤其是设计异步FIFO这样的同步元件。在Verilog里，多时钟域的设计很简单，只需声明多个时钟端口，然后不同的always语句块根据需要选择不同的时钟作为敏感变量即可。在Chisel里，则相对复杂一些，因为这与Scala的变量作用域相关，而且时序元件在编译时都是自动地隐式跟随当前时钟域。本章将介绍多时钟域设计的语法，这其实很简单。
一、没有隐式端口的模块

继承自Module的模块类会获得隐式的全局时钟与同步复位信号，即使在设计中用不上它们也没关系。如果读者确实不喜欢这两个隐式端口，则可以选择继承自RawModule，这样在转换成Verilog时就没有隐式端口。它是单例对象chisel3.experimental里定义的类型，也就是UserModule类的别名。

这样的模块一般用于纯组合逻辑。在类内顶层不能出现使用时钟的相关操作，比如定义寄存器，否则会报错没有隐式端口。例如：

    // module.scala
    package test

    import chisel3._
    import chisel3.experimental._

    class MyModule extends RawModule {
      val io = IO(new Bundle {
        val a = Input(UInt(4.W))
        val b = Input(UInt(4.W))
        val c = Output(UInt(4.W))
      })

      io.c := io.a & io.b
    }

    object ModuleGen extends App {
      chisel3.Driver.execute(args, () => new MyModule)
    }

它生成的Verilog代码为：

    // MyModule.v
    module MyModule(
      input  [3:0] io_a,
      input  [3:0] io_b,
      output [3:0] io_c
    );
      assign io_c = io_a & io_b; // @[module.scala 13:8]
    endmodule

RawModule也可以包含时序逻辑，但要使用多时钟域语法。
二、定义一个时钟域和复位域

chisel3.core包里有一个单例对象withClockAndReset，其apply方法定义如下：

    def apply[T](clock: Clock, reset: Reset)(block: ⇒ T): T

该方法的作用就是创建一个新的时钟和复位域，作用范围仅限于它的传名参数的内部。新的时钟和复位信号就是第一个参数列表的两个参数。注意，在编写代码时不能写成“import chisel3.core._”，这会扰乱“import chisel3._”的导入内容。正确做法是用“import chisel3.experimental._”导入experimental对象，它里面用同名字段引用了单例对象chisel3.core.withClockAndReset，这样就不需要再导入core包。例如：

    class MultiClockModule extends Module {
       val io = IO(new Bundle {
           val clockB = Input(Clock())
           val resetB = Input(Bool())
           val stuff = Input(Bool())
       })
       // 这个寄存器跟随当前模块的隐式全局时钟clock
       val regClock1 = RegNext(io.stuff)

       withClockAndReset(io.clockB, io.resetB) {
           // 在该花括号内，所有时序元件都跟随时钟io.clockB
           // 所有寄存器的复位信号都是io.resetB

           // 这个寄存器跟随io.clockB
           val regClockB = RegNext(io.stuff)
           // 还可以例化其它模块
           val m = Module(new ChildModule)
        }

       // 这个寄存器跟随当前模块的隐式全局时钟clock
       val regClock2 = RegNext(io.stuff)
    }

因为第二个参数列表只有一个传名参数，所以可以把圆括号写成花括号，这样还有自动的分号推断。再加上传名参数的特性，尽管需要一个无参函数，但是可以省略书写“() =>”。所以，

    withClockAndReset(io.clockB, io.resetB) {
        sentence1
        sentence2
        ...
        sentenceN
    }

实际上相当于：

    withClockAndReset(io.clockB, io.resetB)( () => (sentence1; sentence2; ...; sentenceN) )

这结合了Scala的柯里化、传名参数和单参数列表的语法特性，让DSL语言的自定义方法看上去就跟内建的while、for、if等结构一样自然，所以Scala很适合构建DSL语言。

读者再仔细看一看apply方法的定义，它的第二个参数是一个函数，同时该函数的返回结果也是整个apply方法的返回结果。也就是说，独立时钟域的定义里，最后一个表达式的结果会被当作函数的返回结果。可以用一个变量来引用这个返回结果，这样在独立时钟域的定义外也能使用。例如引用最后返回的模块：

    class MultiClockModule extends Module {
       val io = IO(new Bundle {
           val clockB = Input(Clock())
           val resetB = Input(Bool())
           val stuff = Input(Bool())
       })

       val clockB_child = withClockAndReset(io.clockB, io.resetB) {
           Module(new ChildModule)
        }

       clockB_child.io.in := io.stuff
    }

如果传名参数全都是定义，最后没有表达式用于返回，那么apply的返回结果类型自然就是Unit。此时，外部不能访问独立时钟域里的任何内容。例如把上个例子改成如下代码：

    class MultiClockModule extends Module {
       val io = IO(new Bundle {
           val clockB = Input(Clock())
           val resetB = Input(Bool())
           val stuff = Input(Bool())
       })

       val clockB_child = withClockAndReset(io.clockB, io.resetB) {
           val m = Module(new ChildModule)
        }

       clockB_child.m.io.in := io.stuff
    }

现在，被例化的模块不是作为返回结果，而是变成了变量m的引用对象，故而传名参数是只有定义、没有有用的返回值的空函数。如果编译这个模块，就会得到“没有相关成员”的错误信息：

    [error] /home/esperanto/chisel-template/src/main/scala/module.scala:42:16: value m is not a member of Unit
    [error]   clockB_child.m.io.in := io.stuff
    [error]                ^

如果独立时钟域有多个变量要与外部交互，则应该在模块内部的顶层定义全局的线网，让所有时钟域都能访问。

除了单例对象withClockAndReset，还有单例对象withClock和withReset，分别用于构建只有独立时钟和只有独立复位信号的作用域，三者的语法是一样的。
三、使用时钟负沿和低有效的复位信号

默认情况下，声明的时序元件都是以时钟的正沿和高有效的复位信号作为敏感变量，但是在多时钟域的语法里，可以改变其行为。复位信号比较简单，只需要加上取反符号或逻辑非符号。时钟信号稍微麻烦一些，需要先用asUInt方法把Clock类型转换成UInt类型，再用toBool转换成Bool类型，此时可以加上取反符号或逻辑非符号，最后再用asClock变回Clock类型。例如：

    // negclkrst.scala
    package test

    import chisel3._
    import chisel3.experimental._

    class NegativeClkRst extends RawModule {
      val io = IO(new Bundle {
        val in = Input(UInt(4.W))
        val myClk = Input(Clock())
        val myRst = Input(Bool())
        val out = Output(UInt(4.W))
      })

      withClockAndReset((~io.myClk.asUInt.toBool).asClock, ~io.myRst) {
        val temp = RegInit(0.U(4.W))
        temp := io.in
        io.out := temp
      }
    }

    object NegClkRstGen extends App {
      chisel3.Driver.execute(args, () => new NegativeClkRst)
    }

它生成的Verilog主要是：

    // NegativeClkRst.v
    module NegativeClkRst(
      input  [3:0] io_in,
      input        io_myClk,
      input        io_myRst,
      output [3:0] io_out
    );
      wire  _T; // @[negclkrst.scala 14:32]
      wire  _T_2; // @[negclkrst.scala 14:22]
      wire  _T_3; // @[negclkrst.scala 14:47]
      wire  _T_4; // @[negclkrst.scala 14:56]
      reg [3:0] _T_5; // @[negclkrst.scala 15:23]
      assign _T = $unsigned(io_myClk); // @[negclkrst.scala 14:32]
      assign _T_2 = ~ _T; // @[negclkrst.scala 14:22]
      assign _T_3 = _T_2; // @[negclkrst.scala 14:47]
      assign _T_4 = ~ io_myRst; // @[negclkrst.scala 14:56]
      assign io_out = _T_5; // @[negclkrst.scala 17:12]

      always @(posedge _T_3) begin
        if (_T_4) begin
          _T_5 <= 4'h0;
        end else begin
          _T_5 <= io_in;
        end
      end
    endmodule

四、示例：异步FIFO

在跨时钟域设计中，经常需要使用异步FIFO来同步不同时钟域的数据传输。下面是笔者自己编写的一个异步FIFO例子，数据位宽和深度都是参数化的，读、写地址指针的交互采用格雷码和两级寄存器采样，以便改善亚稳态。通过在Vivado 2018.3里综合后，可以得到以BRAM为存储器的FIFO。

    // FIFO.scala
    package fifo

    import chisel3._
    import chisel3.util._
    import chisel3.experimental._

    class FIFO(width: Int, depth: Int) extends RawModule {
      val io = IO(new Bundle {
        // write-domain
        val dataIn = Input(UInt(width.W))
        val writeEn = Input(Bool())
        val writeClk = Input(Clock())
        val full = Output(Bool())
        // read-domain
        val dataOut = Output(UInt(width.W))
        val readEn = Input(Bool())
        val readClk = Input(Clock())
        val empty = Output(Bool())
        // reset
        val systemRst = Input(Bool())
      })

      val ram = SyncReadMem(1 << depth, UInt(width.W))   // 2^depth
      val writeToReadPtr = Wire(UInt((depth + 1).W))  // to read clock domain
      val readToWritePtr = Wire(UInt((depth + 1).W))  // to write clock domain

      // write clock domain
      withClockAndReset(io.writeClk, io.systemRst) {
        val binaryWritePtr = RegInit(0.U((depth + 1).W))
        val binaryWritePtrNext = Wire(UInt((depth + 1).W))
        val grayWritePtr = RegInit(0.U((depth + 1).W))
        val grayWritePtrNext = Wire(UInt((depth + 1).W))
        val isFull = RegInit(false.B)
        val fullValue = Wire(Bool())
        val grayReadPtrDelay0 = RegNext(readToWritePtr)
        val grayReadPtrDelay1 = RegNext(grayReadPtrDelay0)

        binaryWritePtrNext := binaryWritePtr + (io.writeEn && !isFull).asUInt
        binaryWritePtr := binaryWritePtrNext
        grayWritePtrNext := (binaryWritePtrNext >> 1) ^ binaryWritePtrNext
        grayWritePtr := grayWritePtrNext
        writeToReadPtr := grayWritePtr
        fullValue := (grayWritePtrNext === Cat(~grayReadPtrDelay1(depth, depth - 1), grayReadPtrDelay1(depth - 2, 0)))
        isFull := fullValue

        when(io.writeEn && !isFull) {
          ram.write(binaryWritePtr(depth - 1, 0), io.dataIn)
        }

        io.full := isFull
      }
      // read clock domain
      withClockAndReset(io.readClk, io.systemRst) {
        val binaryReadPtr = RegInit(0.U((depth + 1).W))
        val binaryReadPtrNext = Wire(UInt((depth + 1).W))
        val grayReadPtr = RegInit(0.U((depth + 1).W))
        val grayReadPtrNext = Wire(UInt((depth + 1).W))
        val isEmpty = RegInit(true.B)
        val emptyValue = Wire(Bool())
        val grayWritePtrDelay0 = RegNext(writeToReadPtr)
        val grayWritePtrDelay1 = RegNext(grayWritePtrDelay0)

        binaryReadPtrNext := binaryReadPtr + (io.readEn && !isEmpty).asUInt
        binaryReadPtr := binaryReadPtrNext
        grayReadPtrNext := (binaryReadPtrNext >> 1) ^ binaryReadPtrNext
        grayReadPtr := grayReadPtrNext
        readToWritePtr := grayReadPtr
        emptyValue := (grayReadPtrNext === grayWritePtrDelay1)
        isEmpty := emptyValue

        io.dataOut := ram.read(binaryReadPtr(depth - 1, 0), io.readEn && !isEmpty)
        io.empty := isEmpty
      }
    }

    object FIFOGen extends App {
      chisel3.Driver.execute(args, () => new FIFO(args(0).toInt, args(1).toInt))
    }

五、总结

本章介绍了如何用Chisel设计多时钟域电路，重点是学会apply方法的使用，以及对第二个参数列表的理解。要注意独立时钟域里只有最后的表达式能被作为返回值给变量引用，并被外部访问，其它的定义都是对外不可见的
————————————————
版权声明：本文为CSDN博主「_iChthyosaur」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_34291505/article/details/87901659
 */
class chapter7_多时钟域设计 {

}
