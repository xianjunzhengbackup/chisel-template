object 搭建开发环境 extends App {
  /*
  用于编写Chisel的Scala内容已经全部讲完了，下面就可以正式进入Chisel的学习之旅了。有兴趣的读者也可以自行深入研究Scala的其它方面，不管是日后学习、工作，或是研究Chisel发布的新版本，都会有不少的帮助。

  在学习Chisel之前，自然是要先讲解如何搭建开发环境。因为目前还没有Windows系统的开发环境，所以读者最好有一个Linux系统的虚拟机，或者Mac OS的电脑。在这里，笔者以使用广泛的Ubuntu 16.04作为开发平台进行讲解。
  一、Chisel的安装步骤

  首先自然是要保证已经安装好了Scala。对于如何安装Scala，这里就不再赘述，可以参考第二章。接下来，执行以下安装步骤：

  ①安装Sbt。以下所有安装都只需要默认版本，通过命令安装即可。如果需要特定的版本，读者可以自行下载安装包安装。打开终端，执行命令：

      esperanto@ubuntu:~$ sudo apt-get install sbt

  等待安装完成后，可以用命令查看sbt的版本：

      esperanto@ubuntu:~$ sbt sbtVersion
      [info] Loading project definition from /home/esperanto/project
      [info] Set current project to esperanto (in build file:/home/esperanto/)
      [info] 1.2.6

  ②安装Git，系统可能已经自带了。执行命令：

      esperanto@ubuntu:~$ sudo apt-get install git

      esperanto@ubuntu:~$ git --version
      git version 2.7.4

  ③安装Verilator。执行命令：

      esperanto@ubuntu:~$ sudo apt-get install verilator

      esperanto@ubuntu:~$ verilator -version
      Verilator 3.904 2017-05-30 rev verilator_3_904

  ④从GitHub上克隆一个chisel-template文件夹。在想要安装chisel的目录下执行命令：

      esperanto@ubuntu:~$ git clone https://github.com/freechipsproject/chisel-template

  这个文件夹就是一个工程文件，它已经自带了Chisel 3.1.3。如果读者不想使用新版本的Chisel，那么在这个工程文件下编写代码也已经足够了。如果想用更新的版本，则继续下面的步骤。

  ⑤安装Firrtl。在想要安装chisel的目录下执行命令：

      esperanto@ubuntu:~$ git clone https://github.com/freechipsproject/firrtl.git && cd firrtl

  克隆完成后，cd命令会把终端路径切换到firrtl文件夹下，在该路径下执行编译命令：

      esperanto@ubuntu:~/firrtl$ sbt compile

  编译完成后，执行测试命令：

      esperanto@ubuntu:~/firrtl$ sbt test

  测试通过后，执行汇编命令：

      esperanto@ubuntu:~/firrtl$ sbt assembly

  汇编完成后，推送到本地缓存：

      esperanto@ubuntu:~/firrtl$ sbt publishLocal

  测试步骤容易出错，多半是虚拟机的网络不好导致克隆下来的文件有缺失。如果上述步骤都正确完成了，则可以查看firrtl的版本：

      esperanto@ubuntu:~/firrtl$ cd ~/.ivy2/local/edu.berkeley.cs/ && ls
      chisel3_2.12  firrtl_2.12

  ⑥安装chisel3，步骤与firrtl类似。在想要安装chisel的目录下执行以下命令：

      esperanto@ubuntu:~$ git clone https://github.com/freechipsproject/chisel3.git && cd chisel3

      esperanto@ubuntu:~/chisel3$ sbt compile

      esperanto@ubuntu:~/chisel3$ sbt test

      esperanto@ubuntu:~/chisel3$ sbt publishLocal

      esperanto@ubuntu:~/chisel3$ cd ~/.ivy2/local/edu.berkeley.cs/ && ls

  如果所有命令都成功，就能看见chisel3的缓存。

  ⑦仍然把第④步克隆的chisel-template文件夹作为工程文件，但是里面的build.sbt文件改成以下内容：

      // build.sbt
      def scalacOptionsVersion(scalaVersion: String): Seq[String] = {
        Seq() ++ {
          // If we're building with Scala > 2.11, enable the compile option
          //  switch to support our anonymous Bundle definitions:
          //  https://github.com/scala/bug/issues/10047
          CrossVersion.partialVersion(scalaVersion) match {
            case Some((2, scalaMajor: Long)) if scalaMajor < 12 => Seq()
            case _ => Seq("-Xsource:2.11")
          }
        }
      }

      def javacOptionsVersion(scalaVersion: String): Seq[String] = {
        Seq() ++ {
          // Scala 2.12 requires Java 8. We continue to generate
          //  Java 7 compatible code for Scala 2.11
          //  for compatibility with old clients.
          CrossVersion.partialVersion(scalaVersion) match {
            case Some((2, scalaMajor: Long)) if scalaMajor < 12 =>
              Seq("-source", "1.7", "-target", "1.7")
            case _ =>
              Seq("-source", "1.8", "-target", "1.8")
          }
        }
      }

      name := "MyChisel"
      version := "3.2-SNAPSHOT"
      scalaVersion := "2.12.6"
      crossScalaVersions := Seq("2.11.12", "2.12.4")

      resolvers += "My Maven" at "https://raw.githubusercontent.com/sequencer/m2_repository/master"
      // bug fix from https://github.com/freechipsproject/chisel3/wiki/release-notes-17-09-14
      scalacOptions ++= Seq("-Xsource:2.11")

      libraryDependencies += "edu.berkeley.cs" %% "chisel3" % "3.2-SNAPSHOT"
      libraryDependencies += "edu.berkeley.cs" %% "chisel-iotesters" % "1.2.+"
      libraryDependencies += "edu.berkeley.cs" %% "chisel-dot-visualizer" % "0.1-SNAPSHOT"
      libraryDependencies += "edu.berkeley.cs" %% "rocketchip" % "1.2"

      scalacOptions ++= scalacOptionsVersion(scalaVersion.value)
      javacOptions ++= javacOptionsVersion(scalaVersion.value)

   二、Chisel的使用方法

  克隆的chisel-template文件夹可以修改成想要的名字。该文件夹下的src文件夹用于存放工程的源代码。src文件夹下又有main和test两个文件夹，其中main用于存放Chisel的设计部分，test用于存放对应的测试文件和生成电路的主函数。main文件夹下又有resources和scala两个文件夹，其中scala文件夹里可以创建自定义的工程文件进行编写，也可以继续创建多个文件夹来按模块存储不同功能的设计文件，而resources文件夹用于存放与Chisel互动的Verilog等外部文件。test文件下只有一个scala文件夹，在scala文件夹里创建自定义的测试文件和主函数文件。

  在编写代码时，可用的编辑器可以选择自带的gedit。笔者习惯使用Visual Studio Code，因为可以一边写代码一边使用集成终端，而且应用商店里可以下载到Chisel语法的扩展应用。

   也可以使用IDE工具IntelliJ IDEA。首先需要安装好Scala插件，然后在开始界面选择导入工程，并把chisel-template指定为工程文件夹，在下一个页面选择“Import project from external model”并从列表里选择Sbt为外部模型，最后确定即可。
  三、编写一个简单的电路

  在chisel-template/src/main/scala文件夹里创建一个文件，命名为AND.scala，输入以下内容并保存：

      // AND.scala
      package test

      import chisel3._
      import chisel3.experimental._

      class AND extends RawModule {
        val io = IO(new Bundle {
          val a = Input(UInt(1.W))
          val b = Input(UInt(1.W))
          val c = Output(UInt(1.W))
        })

        io.c := io.a & io.b
      }

  在chisel-template/src/test/scala文件夹里创建一个文件，命名为ANDtest.scala，输入以下内容并保存：

      // ANDtest.scala
      package test

      import chisel3._

      object testMain extends App {
        Driver.execute(args, () => new AND)
      }

  在chisel-template文件夹下(与文件build.sbt同一路径)打开终端，执行命令：

      esperanto@ubuntu:~/chisel-template$ sbt "test:runMain test.testMain --target-dir generated/and"

  当最后输出success时，就会在当前路径生成一个generated文件夹，里面有一个and文件夹。and文件夹里包含了三个最终输出的文件，打开其中的AND.v文件，可以看到一个与门的Verilog代码：

      module AND(
           input   io_a,
           input   io_b,
           output  io_c
      );
           assign io_c = io_a & io_b;
      endmodule

  对于小规模电路，可以直接用Chisel写testbench文件，然后联合Verilator生成C++文件来仿真，输出波形图。该方法会在后续章节介绍。对于大规模电路，Verilator仿真很吃力，建议还是用生成的Verilog文件在专业EDA工具里仿真。当前Chisel不支持UVM，也没有工具支持Chisel，所以尽量用别的工具做测试。
  四、总结

  本章介绍了Chisel开发环境的搭建，搭建完毕后就可以用Chisel代码生成电路了。后续章节将逐步讲解Chisel的语法，由于内容较为分散，不能很快就完成模块级的讲解，所以前面的内容无法及时运行验证，读者只需要理解文中提供的示例即可。
  ————————————————
  版权声明：本文为CSDN博主「_iChthyosaur」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
  原文链接：https://blog.csdn.net/qq_34291505/article/details/87365907
   */

}
