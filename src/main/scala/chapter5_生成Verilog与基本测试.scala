/*
经过前三章的内容，读者已经了解了如何使用Chisel构建一个基本的模块。本章的内容就是在此基础上，把一个Chisel模块编译成Verilog代码，并进一步使用Verilator做一些简单的测试。
一、生成Verilog

前面介绍Scala的内容里说过，Scala程序的入口是主函数。所以，生成Verilog的程序自然是在主函数里例化待编译的模块，然后运行这个主函数。例化待编译模块需要特殊的方法调用。chisel3包里有一个单例对象Driver，它包含一个方法execute，该方法接收两个参数，第一个参数是命令行传入的实参即字符串数组args，第二个是返回待编译模块的对象的无参函数。运行这个execute方法，就能得到Verilog代码。

假设在src/main/scala文件夹下有一个全加器的Chisel设计代码，如下所示：

    // fulladder.scala
    package test

    import chisel3._

    class FullAdder extends Module {
      val io = IO(new Bundle {
        val a = Input(UInt(1.W))
        val b = Input(UInt(1.W))
        val cin = Input(UInt(1.W))
        val s = Output(UInt(1.W))
        val cout = Output(UInt(1.W))
      })

      io.s := io.a ^ io.b ^ io.cin
      io.cout := (io.a & io.b) | ((io.a | io.b) & io.cin)
    }

接着，读者需要在src/test/scala文件夹下编写对应的主函数文件，如下所示：

    // fullAdderGen.scala
    package test

    object FullAdderGen extends App {
      chisel3.Driver.execute(args, () => new FullAdder)
    }

在这个主函数里，只有一个execute函数的调用，第一个参数固定是“args”，第二个参数则是无参的函数字面量“() => new FullAdder”。因为Chisel的模块本质上还是Scala的class，所以只需用new构造一个对象作为返回结果即可。主函数里可以包括多个execute函数，也可以包含其它代码。还有一点要注意的是，建议把设计文件和主函数放在一个包里，比如这里的“package test”，这样省去了编写路径的麻烦。

要运行这个主函数，需要在build.sbt文件所在的路径下打开终端，然后执行命令：

    esperanto@ubuntu:~/chisel-template$ sbt 'test:runMain test.FullAdderGen'

注意，sbt后面有空格，再后面的内容都是被单引号对或双引号对包起来。其中，test:runMain是让sbt执行主函数的命令，而test.FullAdderGen就是要执行的那个主函数。

*********************************************************edited on 11/08/2023
Above content are based on old version of Chisel. Under new Chisel, the code to generate verilog is:
import chisel3.stage.ChiselGeneratorAnnotation
(new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/stored_verilog_folder"),Seq(ChiselGeneratorAnnotation(()=>new FullAdder )))
*******************************************************************************




如果设计文件没有错误，那么最后就会看到“[success] Total time: 6 s, completed Feb 22, 2019 4:45:31 PM”这样的信息。此时，终端的路径下就会生成三个文件：FullAdder.anno.json、FullAdder.fir和FullAdder.v。

第一个文件用于记录传递给Firrtl编译器的Scala注解，读者可以不用关心。第二个后缀为“.fir”的文件就是对应的Firrtl代码，第三个自然是对应的Verilog文件。

首先查看最关心的Verilog文件，内容如下：

    // FullAdder.v
    module FullAdder(
      input   clock,
      input   reset,
      input   io_a,
      input   io_b,
      input   io_cin,
      output  io_s,
      output  io_cout
    );
      wire  _T; // @[fulladder.scala 14:16]
      wire  _T_2; // @[fulladder.scala 15:20]
      wire  _T_3; // @[fulladder.scala 15:37]
      wire  _T_4; // @[fulladder.scala 15:45]
      assign _T = io_a ^ io_b; // @[fulladder.scala 14:16]
      assign _T_2 = io_a & io_b; // @[fulladder.scala 15:20]
      assign _T_3 = io_a | io_b; // @[fulladder.scala 15:37]
      assign _T_4 = _T_3 & io_cin; // @[fulladder.scala 15:45]
      assign io_s = _T ^ io_cin; // @[fulladder.scala 14:8]
      assign io_cout = _T_2 | _T_4; // @[fulladder.scala 15:11]
    endmodule

可以看到，代码逻辑与想要表达的意思完全一致，而且对应的代码都用注释标明了来自于Chisel源文件的哪里。但由于这是通过语法分析的脚本代码得到的，所以看上去显得很笨拙、僵硬，生成了大量无用的中间变量声明。对于下游的综合器而言是一个负担，可能会影响综合器的优化。而且在进行仿真时，要理解这些中间变量也很麻烦。对后端人员来说，这也是让人头疼的问题。

接着再看一看Firrtl代码，内容如下：

    // FullAdder.fir
    ;buildInfoPackage: chisel3, version: 3.2-SNAPSHOT, scalaVersion: 2.12.6, sbtVersion: 1.1.1
    circuit FullAdder :
      module FullAdder :
        input clock : Clock
        input reset : UInt<1>
        output io : {flip a : UInt<1>, flip b : UInt<1>, flip cin : UInt<1>, s : UInt<1>, cout : UInt<1>}

        node _T = xor(io.a, io.b) @[fulladder.scala 14:16]
        node _T_1 = xor(_T, io.cin) @[fulladder.scala 14:23]
        io.s <= _T_1 @[fulladder.scala 14:8]
        node _T_2 = and(io.a, io.b) @[fulladder.scala 15:20]
        node _T_3 = or(io.a, io.b) @[fulladder.scala 15:37]
        node _T_4 = and(_T_3, io.cin) @[fulladder.scala 15:45]
        node _T_5 = or(_T_2, _T_4) @[fulladder.scala 15:28]
        io.cout <= _T_5 @[fulladder.scala 15:11]

可以看到，Firrtl代码与它生成的Verilog代码非常接近。这种代码风格虽然不方便人工阅读，但是适合语法分析脚本使用。
二、在命令里增加参数
   Ⅰ、给Firrtl传递参数

在运行主函数时，可以在刚才的命令后面继续增加可选的参数。例如，增加参数“--help”查看帮助菜单，运行命令：

    esperanto@ubuntu:~/chisel-template$ sbt 'test:runMain test.FullAdderGen --help'

可以得到如下帮助信息：

    common options
      -tn, --top-name <top-level-circuit-name>
                               This options defines the top level circuit, defaults to dut when possible
      -td, --target-dir <target-directory>
                               This options defines a work directory for intermediate files, default is .
      -ll, --log-level <Error|Warn|Info|Debug|Trace>
                               This options defines a work directory for intermediate files, default is .
      -cll, --class-log-level <FullClassName:[Error|Warn|Info|Debug|Trace]>[,...]
                               This options defines a work directory for intermediate files, default is .
      -ltf, --log-to-file      default logs to stdout, this flags writes to topName.log or firrtl.log if no topName
      -lcn, --log-class-names  shows class names and log level in logging output, useful for target --class-log-level
      --help                   prints this usage text
      <arg>...                 optional unbounded args
    chisel3 options
      -chnrf, --no-run-firrtl  Stop after chisel emits chirrtl file
    firrtl options
      -i, --input-file <firrtl-source>
                               use this to override the default input file name , default is empty
      -o, --output-file <output>
                               use this to override the default output file name, default is empty
      -faf, --annotation-file <input-anno-file>
                               Used to specify annotation files (can appear multiple times)
      -foaf, --output-annotation-file <output-anno-file>
                               use this to set the annotation output file
      -X, --compiler <high|middle|low|verilog|sverilog>
                               compiler to use, default is verilog
     --info-mode <ignore|use|gen|append>
                               specifies the source info handling, default is append
      -fct, --custom-transforms <package>.<class>
                               runs these custom transforms during compilation.
      -fil, --inline <circuit>[.<module>[.<instance>]][,..],
                               Inline one or more module (comma separated, no spaces) module looks like "MyModule" or "MyModule.myinstance
      -firw, --infer-rw        Enable readwrite port inference for the target circuit
      -frsq, --repl-seq-mem -c:<circuit>:-i:<filename>:-o:<filename>
                               Replace sequential memories with blackboxes + configuration file
      -clks, --list-clocks -c:<circuit>:-m:<module>:-o:<filename>
                               List which signal drives each clock of every descendent of specified module
      -fsm, --split-modules    Emit each module to its own file in the target directory.
      --no-check-comb-loops    Do NOT check for combinational loops (not recommended)
      --no-dce                 Do NOT run dead code elimination

例如，最常用的是参数“-td”，可以在后面指定一个文件夹，这样之前生成的三个文件就在该文件夹里，而不是在当前路径下。其格式如下：

    esperanto@ubuntu:~/chisel-template$ sbt 'test:runMain test.FullAdderGen -td ./generated/fulladder'

   Ⅱ、给主函数传递参数

Scala的类可以接收参数，自然Chisel的模块也可以接收参数。假设要构建一个n位的加法器，具体位宽不确定，根据需要而定。那么，就可以把端口位宽参数化，例化时传入想要的参数即可。例如：
*/

    import chisel3._

    class Adder(n: Int) extends Module {
      val io = IO(new Bundle {
        val a = Input(UInt(n.W))
        val b = Input(UInt(n.W))
        val s = Output(UInt(n.W))
        val cout = Output(UInt(1.W))
      })

      io.s := (io.a +& io.b)(n-1, 0)
      io.cout := (io.a +& io.b)(n)
    }

    /*
    // adderGen.scala
    package test

    object AdderGen extends App {
      chisel3.Driver.execute(args, () => new Adder(args(0).toInt))
    }

在这里，模块Adder的主构造方法接收一个Int类型的参数n，然后用n去定义端口位宽。主函数在例化这个模块时，就要给出相应的参数。前面的帮助菜单里显示，在运行sbt命令时，可以传入若干个独立的参数。和运行Scala的主函数一样，这些命令行的参数也可以由字符串数组args通过下标来索引。从要运行的主函数后面开始，后面的内容都是按空格划分、从下标0开始的args的元素。比如例子中的主函数期望第一个参数即args(0)是一个数字字符串，这样就能通过方法toInt转换成Adder所需的参数。

执行如下命令：

    esperanto@ubuntu:~/chisel-template$  sbt 'test:runMain test.AdderGen 8 -td ./generated/adder'

可以在相应的文件夹下得到如下Verilog代码，其中位宽的确是8位的：

    // Adder.v
    module Adder(
      input        clock,
      input        reset,
      input  [7:0] io_a,
      input  [7:0] io_b,
      output [7:0] io_s,
      output       io_cout
    );
      wire [8:0] _T;
      assign _T = io_a + io_b;
      assign io_s = _T[7:0];
      assign io_cout = _T[8];
    endmodule

三、编写简单的测试

Chisel的测试有两种，第一种是利用Scala的测试来验证Chisel级别的代码逻辑有没有错误。因为这部分内容比较复杂，而且笔者目前也没有深入学习有关Scala测试的内容，所以这部分内容可有读者自行选择研究。第二种是利用Chisel库里的peek和poke函数，给模块的端口加激励、查看信号值，并交由下游的Verilator来仿真、产生波形。这种方式比较简单，类似于Verilog的testbench，适合小型电路的验证。对于超大型的系统级电路，最好还是生成Verilog，交由成熟的EDA工具，用UVM进行验证。

要编写一个简单的testbench，首先也是定义一个类，这个类的主构造方法接收一个参数，参数类型就是待测模块的类名。因为模块也是一个类，从Scala的角度来看，一个类就是定义了一种类型。其次，这个类继承自PeekPokeTester类，并且把接收的待测模块也传递给此超类。最后，测试类内部有四种方法可用：①“poke(端口，激励值)”方法给相应的端口添加想要的激励值，激励值是Int类型的；②“peek(端口)”方法返回相应的端口的当前值；③“expect(端口，期望值)”方法会对第一个参数(端口)使用peek方法，然后与Int类型的期望值进行对比，如果两者不相等则出错；④“step(n)”方法则让仿真前进n个时钟周期。

因为测试模块只用于仿真，无需转成Verilog，所以类似for、do…while、to、until、map等Scala高级语法都可以使用，帮助测试代码更加简洁有效。

如下所示是一个对前一例中的8位加法器的testbench：

    // addertest.scala
    package test*/

    import scala.util._
    import chisel3.iotesters._

    class AdderTest(c: Adder) extends PeekPokeTester(c) {
      val randNum = new Random
      for(i <- 0 until 10) {
        val a = randNum.nextInt(256)
        val b = randNum.nextInt(256)
        poke(c.io.a, a)
        poke(c.io.b, b)
        step(1)
        expect(c.io.s, (a + b) & 0xff)
        expect(c.io.cout, ((a + b) & 0x100) >> 8)
        println(s"Input a $a")
        println(s"Input b $b")
        println(s"Output cout ${c.io.cout}")
        println(s"Output s ${c.io.s}")
      }
    }

/*其中，第一个包scala.util里包含了Scala生成伪随机数的类Random，第二个包chisel3.iotesters包含了测试类PeekPokeTester。
四、运行测试

要运行测试，自然也是通过主函数，但是这次是使用iotesters包里的execute方法。该方法与前面生成Verilog的方法类似，仅仅是多了一个参数列表，多出的第二个参数列表接收一个返回测试类的对象的函数：
*/
    // addertest.scala
    object AdderTestGen extends App {
      chisel3.iotesters.Driver.execute(args, () => new Adder(8))(c => new AdderTest(c))
    }

/*运行如下命令：

    esperanto@ubuntu:~/chisel-template$  sbt 'test:runMain test.AdderTestGen -td ./generated/addertest --backend-name verilator'

执行成功后，就能在相应文件夹里看到一个新生成的文件夹，里面是仿真生成的文件。其中，“Adder.vcd”文件就是波形文件，使用GTKWave软件打开就能查看，将相应的端口拖拽到右侧就能显示波形。

如果只想在终端查看仿真运行的信息，则执行命令：

    esperanto@ubuntu:~/chisel-template$  sbt 'test:runMain test.AdderTestGen -td ./generated/addertest --is-verbose'

那么终端就会显示如下信息：

    [info] [0.002] SEED 1550906002475
    [info] [0.005]   POKE io_a <- 184
    [info] [0.006]   POKE io_b <- 142
    [info] [0.006] STEP 0 -> 1
    [info] [0.007] EXPECT AT 1   io_s got 70 expected 70 PASS
    [info] [0.008] EXPECT AT 1   io_cout got 1 expected 1 PASS
    [info] [0.008]   POKE io_a <- 114
    [info] [0.009]   POKE io_b <- 231
    [info] [0.009] STEP 1 -> 2
    [info] [0.009] EXPECT AT 2   io_s got 89 expected 89 PASS
    [info] [0.009] EXPECT AT 2   io_cout got 1 expected 1 PASS
    [info] [0.010]   POKE io_a <- 183
    [info] [0.010]   POKE io_b <- 168
    [info] [0.010] STEP 2 -> 3
    [info] [0.011] EXPECT AT 3   io_s got 95 expected 95 PASS
    [info] [0.011] EXPECT AT 3   io_cout got 1 expected 1 PASS
    [info] [0.012]   POKE io_a <- 223
    [info] [0.012]   POKE io_b <- 106
    [info] [0.012] STEP 3 -> 4
    [info] [0.012] EXPECT AT 4   io_s got 73 expected 73 PASS
    [info] [0.013] EXPECT AT 4   io_cout got 1 expected 1 PASS
    [info] [0.013]   POKE io_a <- 12
    [info] [0.013]   POKE io_b <- 182
    [info] [0.013] STEP 4 -> 5
    [info] [0.014] EXPECT AT 5   io_s got 194 expected 194 PASS
    [info] [0.014] EXPECT AT 5   io_cout got 0 expected 0 PASS
    [info] [0.014]   POKE io_a <- 52
    [info] [0.014]   POKE io_b <- 41
    [info] [0.015] STEP 5 -> 6
    [info] [0.015] EXPECT AT 6   io_s got 93 expected 93 PASS
    [info] [0.016] EXPECT AT 6   io_cout got 0 expected 0 PASS
    [info] [0.016]   POKE io_a <- 187
    [info] [0.017]   POKE io_b <- 60
    [info] [0.017] STEP 6 -> 7
    [info] [0.017] EXPECT AT 7   io_s got 247 expected 247 PASS
    [info] [0.018] EXPECT AT 7   io_cout got 0 expected 0 PASS
    [info] [0.018]   POKE io_a <- 218
    [info] [0.019]   POKE io_b <- 203
    [info] [0.019] STEP 7 -> 8
    [info] [0.019] EXPECT AT 8   io_s got 165 expected 165 PASS
    [info] [0.020] EXPECT AT 8   io_cout got 1 expected 1 PASS
    [info] [0.020]   POKE io_a <- 123
    [info] [0.021]   POKE io_b <- 115
    [info] [0.021] STEP 8 -> 9
    [info] [0.021] EXPECT AT 9   io_s got 238 expected 238 PASS
    [info] [0.022] EXPECT AT 9   io_cout got 0 expected 0 PASS
    [info] [0.022]   POKE io_a <- 17
    [info] [0.022]   POKE io_b <- 197
    [info] [0.023] STEP 9 -> 10
    [info] [0.023] EXPECT AT 10   io_s got 214 expected 214 PASS
    [info] [0.024] EXPECT AT 10   io_cout got 0 expected 0 PASS
    test Adder Success: 20 tests passed in 15 cycles in 0.047415 seconds 316.36 Hz
    [info] [0.025] RAN 10 CYCLES PASSED
    [success] Total time: 7 s, completed Feb 23, 2019 3:13:26 PM

五、总结

本章介绍了从Chisel转换成Verilog、测试设计的基本方法。因为Chisel还在更新中，这些方法也是从Chisel2里保留下来的。将来也许会有更便捷的方式，读者可以留意。
————————————————
版权声明：本文为CSDN博主「_iChthyosaur」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_34291505/article/details/87880730
 */
class chapter5_生成Verilog与基本测试 {

}
