/*
函数是编程语言的常用语法，即使是Verilog这样的硬件描述语言，也会用函数来构建组合逻辑。对于Chisel这样的高级语言，函数的使用更加方便，还能节省不少代码量。不管是用户自己写的函数、Chisel语言库里的函数还是Scala标准库里的函数，都能帮助用户节省构建电路的时间。
一、用函数抽象组合逻辑

与Verilog一样，对于频繁使用的组合逻辑电路，可以定义成Scala的函数形式，然后通过函数调用的方式来使用它。这些函数既可以定义在某个单例对象里，供多个模块重复使用，也可以直接定义在电路模块里。例如：

    // function.scala
    import chisel3._

    class UseFunc extends Module {
      val io = IO(new Bundle {
        val in = Input(UInt(4.W))
        val out1 = Output(Bool())
        val out2 = Output(Bool())
      })

      def clb(a: UInt, b: UInt, c: UInt, d: UInt): UInt =
        (a & b) | (~c & d)

      io.out1 := clb(io.in(0), io.in(1), io.in(2), io.in(3))
      io.out2 := clb(io.in(0), io.in(2), io.in(3), io.in(1))
    }

二、用工厂方法简化模块的例化

在Scala里，往往在类的伴生对象里定义一个工厂方法，来简化类的实例化。同样，Chisel的模块也是Scala的类，也可以在其伴生对象里定义工厂方法来简化例化、连线模块。例如用双输入多路选择器构建四输入多路选择器：

    // mux4.scala
    import chisel3._

    class Mux2 extends Module {
      val io = IO(new Bundle {
        val sel = Input(UInt(1.W))
        val in0 = Input(UInt(1.W))
        val in1 = Input(UInt(1.W))
        val out = Output(UInt(1.W))
      })

      io.out := (io.sel & io.in1) | (~io.sel & io.in0)
    }

    object Mux2 {
      def apply(sel: UInt, in0: UInt, in1: UInt) = {
        val m = Module(new Mux2)
        m.io.in0 := in0
        m.io.in1 := in1
        m.io.sel := sel
        m.io.out
      }
    }

    class Mux4 extends Module {
      val io = IO(new Bundle {
        val sel = Input(UInt(2.W))
        val in0 = Input(UInt(1.W))
        val in1 = Input(UInt(1.W))
        val in2 = Input(UInt(1.W))
        val in3 = Input(UInt(1.W))
        val out = Output(UInt(1.W))
      })

      io.out := Mux2(io.sel(1),
                     Mux2(io.sel(0), io.in0, io.in1),
                     Mux2(io.sel(0), io.in2, io.in3))
    }

三、用Scala的函数简化代码

Scala的函数也能在Chisel里使用，只要能通过Firrtl编译器的检查。比如在生成长的序列上，利用Scala的函数就能减少大量的代码。假设要构建一个n−2n
译码器，在Verilog里需要写2n

条case语句，当n很大时就会使代码显得冗长而枯燥。利用Scala的for、yield组合可以产生相应的判断条件与输出结果的序列，再用zip函数将两个序列组成一个对偶序列，再把对偶序列作为MuxCase的参数，就能用几行代码构造出任意位数的译码器。例如：

    // decoder.scala
    package decoder

    import chisel3._
    import chisel3.util._
    import chisel3.experimental._

    class Decoder(n: Int) extends RawModule {
      val io = IO(new Bundle {
        val sel = Input(UInt(n.W))
        val out = Output(UInt((1 << n).W))
      })

      val x = for(i <- 0 until (1 << n)) yield io.sel === i.U
      val y = for(i <- 0 until (1 << n)) yield 1.U << i
      io.out := MuxCase(0.U, x zip y)
    }

    object DecoderGen extends App {
      chisel3.Driver.execute(args, () => new Decoder(args(0).toInt))
    }

只需要输入参数n，就能立即生成对应的n位译码器。
四、Chisel的打印函数

Chisel提供了一个“ printf ”函数来打印信息，用于电路调试。它有Scala和C两种风格。当用Verilator生成波形时，每个时钟周期都会在屏幕上显示一次。如果在when语句块里，只有条件成立时才运行。隐式的全局复位信号也不会触发。

printf函数只能在Chisel的模块里使用，并且会转换成Verilog的系统函数“$fwrite”，包含在宏定义块“ `ifndef SYNTHESIS......`endif ”里。通过Verilog的宏定义，可以取消这部分不可综合的代码。因为后导入的chisel3包覆盖了Scala的标准包，所以Scala里的printf函数要写成“Predef.printf”的完整路径形式。
   Ⅰ、Scala风格

该风格类似于Scala的字符串插值器。Chisel自定义了一个p插值器，该插值器可以对字符串内的一些自定义表达式进行求值、Chiel类型转化成字符串类型等。

①简单格式

    val myUInt = 33.U
    // 显示Chisel自定义的类型的数据
    printf(p"myUInt = $myUInt") // myUInt = 33
    // 显示成十六进制
    printf(p"myUInt = 0x${Hexadecimal(myUInt)}") // myUInt = 0x21
    // 显示成二进制
    printf(p"myUInt = ${Binary(myUInt)}") // myUInt = 100001
    // 显示成字符(ASCⅡ码)
    printf(p"myUInt = ${Character(myUInt)}") // myUInt = !

②聚合数据类型

    val myVec = Vec(5.U, 10.U, 13.U)
    printf(p"myVec = $myVec") // myVec = Vec(5, 10, 13)

    val myBundle = Wire(new Bundle {
        val foo = UInt()
        val bar = UInt()
    })
    myBundle.foo := 3.U
    myBundle.bar := 11.U
    printf(p"myBundle = $myBundle") // myBundle = Bundle(a -> 3, b -> 11)

③自定义打印信息

对于自定义的Bundle类型，可以重写toPrintable方法来定制打印内容。当自定义的Bundle配合其他硬件类型例如Wire构成具体的硬件，并且被赋值后，可以用p插值器来求值该硬件，此时就会调用重写的toPrintable方法。例如：

    class Message extends Bundle {
      val valid = Bool()
      val addr = UInt(32.W)
      val length = UInt(4.W)
      val data = UInt(64.W)
      override def toPrintable: Printable = {
          val char = Mux(valid, 'v'.U, '-'.U)
          p"Message:\n" +
          p"  valid  : ${Character(char)}\n" +
          p"  addr   : 0x${Hexadecimal(addr)}\n" +
          p"  length : $length\n" +
          p"  data   : 0x${Hexadecimal(data)}\n"
      }
    }

    val myMessage = Wire(new Message)
    myMessage.valid := true.B
    myMessage.addr := "h1234".U
    myMessage.length := 10.U
    myMessage.data := "hdeadbeef".U

    printf(p"$myMessage")

注意，重写的toPrintable方法的返回类型固定是Printable，这是因为p插值器的返回类型就是Printable，并且Printable类里定义了一个方法“+”用于将多个字符串拼接起来。在最后一个语句里，p插值器会求值myMessage，这就会调用Message类的toPrintable方法。因此，最终的打印信息如下：

    Message:
         valid  : v
         addr   : 0x00001234
         length : 10
         data   : 0x00000000deadbeef

   Ⅱ、C风格

Chisel的printf也支持C的部分格式控制符和转义字符。如下所示：
格式控制符	含义
%d	十进制数
%x	十六进制数
%b	二进制数
%c	8位ASCⅡ字符
%%	百分号
%n	一个信号的名字
%N	聚合类里一个叶子信号的名字
转义字符	含义
\n	换行
\t	制表符
\"	双引号
\'	单引号
\\	斜杠

    val myUInt = 32.U
    printf("myUInt = %d", myUInt) // myUInt = 32

五、Chisel的对数函数

在二进制运算里，求以2为底的对数也是常用的运算。

chisel3.util包里有一个单例对象Log2，它的一个apply方法接收一个Bits类型的参数，计算并返回该参数值以2为底的幂次。返回类型是UInt类型，并且是向下截断的。另一个apply的重载版本可以接受第二个Int类型的参数，用于指定返回结果的位宽。例如：

    Log2(8.U)  // 等于3.U

    Log2(13.U)  // 等于3.U(向下截断)

    Log2(myUIntWire)  // 动态求值

chisel3.util包里还有四个单例对象：log2Ceil、log2Floor、log2Up和log2Down，它们的apply方法的参数都是Int和BigInt类型，返回结果都是Int类型。log2Ceil是把结果向上舍入，log2Floor则向下舍入。log2Up和log2Down不仅分别把结果向上、向下舍入，而且结果最小为1。

单例对象isPow2的apply方法接收Int和BigInt类型的参数，判断该整数是不是2的n次幂，返回Boolean类型的结果。
六、与硬件相关的函数
   Ⅰ、位旋转

chisel3.util包里还有一些常用的操作硬件的函数，比如单例对象Reverse的apply方法可以把一个UInt类型的对象进行旋转，返回一个对应的UInt值。在转换成Verilog时，都是通过拼接完成的组合逻辑。例如：

    Reverse("b1101".U)  // 等于"b1011".U

    Reverse("b1101".U(8.W))  // 等于"b10110000".U

    Reverse(myUIntWire)  // 动态旋转

   Ⅱ、位拼接

单例对象Cat有两个apply方法，分别接收一个Bits类型的序列和Bits类型的重复参数，将它们拼接成一个UInt数。前面的参数在高位。例如：

    Cat("b101".U, "b11".U)  // 等于"b10111".U

    Cat(myUIntWire0, myUIntWire1)  // 动态拼接

    Cat(Seq("b101".U, "b11".U))  // 等于"b10111".U

    Cat(mySeqOfBits)  // 动态拼接

   Ⅲ、1计数器

单例对象PopCount有两个apply方法，分别接收一个Bits类型的参数和Bool类型的序列，计算参数里“1”或“true.B”的个数，返回对应的UInt值。例如：

    PopCount(Seq(true.B, false.B, true.B, true.B))  // 等于3.U

    PopCount(Seq(false.B, false.B, true.B, false.B))  // 等于1.U

    PopCount("b1011".U)  // 等于3.U

    PopCount("b0010".U)  // 等于1.U

    PopCount(myUIntWire)  // 动态计数

   Ⅳ、独热码转换器

单例对象OHToUInt的apply方法可以接收一个Bits类型或Bool序列类型的独热码参数，计算独热码里的“1”在第几位(从0开始)，返回对应的UInt值。如果不是独热码，则行为不确定。例如：

    OHToUInt("b1000".U)  // 等于3.U

    OHToUInt("b1000_0000".U)  // 等于7.U

还有一个行为相反的单例对象UIntToOH，它的apply方法是根据输入的UInt类型参数，返回对应位置的独热码，独热码也是UInt类型。例如：

    UIntToOH(3.U)  // 等于"b1000".U

    UIntToOH(7.U)  // 等于"b1000_0000".U

   Ⅴ、无关位

Verilog里可以用问号表示无关位，那么用case语句进行比较时就不会关心这些位。Chisel里有对应的BitPat类，可以指定无关位。在其伴生对象里，一个apply方法可以接收一个字符串来构造BitPat对象，字符串里用问号表示无关位。例如：

    "b10101".U === BitPat("b101??") // 等于true.B

    "b10111".U === BitPat("b101??") // 等于true.B

    "b10001".U === BitPat("b101??") // 等于false.B

另一个apply方法则用UInt类型的参数来构造BitPat对象，UInt参数必须是字面量。这允许把UInt类型用在期望BitPat的地方，当用BitPat定义接口又并非所有情况要用到无关位时，该方法就很有用。

另外，bitPatToUInt方法可以把一个BitPat对象转换成UInt对象，但是BitPat对象不能包含无关位。

dontCare方法接收一个Int类型的参数，构造等值位宽的全部无关位。例如：

    val myDontCare = BitPat.dontCare(4)  // 等于BitPat("b????")

   Ⅵ、查找表

BitPat通常配合两种查找表使用。一种是单例对象Lookup，其apply方法定义为：

    def apply[T <: Bits](addr: UInt, default: T, mapping: Seq[(BitPat, T)]): T

参数addr会与每个BitPat进行比较，如果相等，就返回对应的值，否则就返回default。

第二种是单例对象ListLookup，它的apply方法与上面的类似，区别在于返回结果是一个T类型的列表：

    defapply[T <: Data](addr: UInt, default: List[T], mapping: Array[(BitPat, List[T])]): List[T]

这两种查找表的常用场景是构造CPU的控制器，因为CPU指令里有很多无关位，所以根据输入的指令(即addr)与预先定义好的带无关位的指令进行匹配，就能得到相应的控制信号。
七、总结

在编写代码时，虽然是构造硬件，但是语言特性和编译器允许读者灵活使用高级函数。要做到熟能生巧，就应该多阅读、多练习
————————————————
版权声明：本文为CSDN博主「_iChthyosaur」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_34291505/article/details/87905379
 */
class chapter8_函数的应用 {

}
