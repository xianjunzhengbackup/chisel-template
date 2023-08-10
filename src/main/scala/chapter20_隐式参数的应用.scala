/*
用Chisel编写的CPU，比如Rocket-Chip、RISCV-Mini等，都有一个特点，就是可以用一个配置文件来裁剪电路。这利用了Scala的模式匹配、样例类、偏函数、可选值、隐式定义等语法。本章内容就是来为读者详细解释它的工作机制。
一、相关定义

要理解隐式参数是如何配置电路的，应该先了解与配置相关的定义。在阅读代码之前，为了能快速读懂、深入理解，读者最好复习一下模式匹配和隐式定义两章的内容。

下面是来自于开源处理器RISCV-Mini的代码：

    // Config.scala
    // See LICENSE.SiFive for license details.

    package freechips.rocketchip.config

    abstract class Field[T] private (val default: Option[T])
    {
      def this() = this(None)
      def this(default: T) = this(Some(default))
    }

    abstract class View {
      final def apply[T](pname: Field[T]): T = apply(pname, this)
      final def apply[T](pname: Field[T], site: View): T = {
        val out = find(pname, site)
        require (out.isDefined, s"Key ${pname} is not defined in Parameters")
        out.get
      }

      final def lift[T](pname: Field[T]): Option[T] = lift(pname, this)
      final def lift[T](pname: Field[T], site: View): Option[T] = find(pname, site).map(_.asInstanceOf[T])

      protected[config] def find[T](pname: Field[T], site: View): Option[T]
    }

    abstract class Parameters extends View {
      final def ++ (x: Parameters): Parameters =
        new ChainParameters(this, x)

      final def alter(f: (View, View, View) => PartialFunction[Any,Any]): Parameters =
        Parameters(f) ++ this

      final def alterPartial(f: PartialFunction[Any,Any]): Parameters =
        Parameters((_,_,_) => f) ++ this

      final def alterMap(m: Map[Any,Any]): Parameters =
        new MapParameters(m) ++ this

      protected[config] def chain[T](site: View, tail: View, pname: Field[T]): Option[T]
      protected[config] def find[T](pname: Field[T], site: View) = chain(site, new TerminalView, pname)
    }

    object Parameters {
      def empty: Parameters = new EmptyParameters
      def apply(f: (View, View, View) => PartialFunction[Any,Any]): Parameters = new PartialParameters(f)
    }

    class Config(p: Parameters) extends Parameters {
      def this(f: (View, View, View) => PartialFunction[Any,Any]) = this(Parameters(f))

      protected[config] def chain[T](site: View, tail: View, pname: Field[T]) = p.chain(site, tail, pname)
      override def toString = this.getClass.getSimpleName
      def toInstance = this
    }

    // Internal implementation:

    private class TerminalView extends View {
      def find[T](pname: Field[T], site: View): Option[T] = pname.default
    }

    private class ChainView(head: Parameters, tail: View) extends View {
      def find[T](pname: Field[T], site: View) = head.chain(site, tail, pname)
    }

    private class ChainParameters(x: Parameters, y: Parameters) extends Parameters {
      def chain[T](site: View, tail: View, pname: Field[T]) = x.chain(site, new ChainView(y, tail), pname)
    }

    private class EmptyParameters extends Parameters {
      def chain[T](site: View, tail: View, pname: Field[T]) = tail.find(pname, site)
    }

    private class PartialParameters(f: (View, View, View) => PartialFunction[Any,Any]) extends Parameters {
      protected[config] def chain[T](site: View, tail: View, pname: Field[T]) = {
        val g = f(site, this, tail)
        if (g.isDefinedAt(pname)) Some(g.apply(pname).asInstanceOf[T]) else tail.find(pname, site)
      }
    }

    private class MapParameters(map: Map[Any, Any]) extends Parameters {
      protected[config] def chain[T](site: View, tail: View, pname: Field[T]) = {
        val g = map.get(pname)
        if (g.isDefined) Some(g.get.asInstanceOf[T]) else tail.find(pname, site)
      }
    }

二、Field[T]类
位置：6-10行

抽象类Field[T]是一个类型构造器，它需要根据类型参数T来生成不同的类型。而T取决于传入的参数——可选值default：Option[T]的类型。例如，如果传入一个Some(10)，那么所有的T都可以确定为Int。

Field[T]只有一个公有val字段，即主构造方法的参数default：Option[T]。此外，主构造方法是私有的，外部只能访问两个公有的辅助构造方法“def this()”和“def this(default: T)”。第一个辅助构造方法不接收参数，所以会构造一个可选值字段是None的对象；第二个辅助构造方法接受一个T类型的参数，然后把参数打包成可选值Some(default): Option[T]，并把它赋给对象的可选值字段。

事实上，Field[T]是抽象的，我们并不能通过“new Field(参数)”来构造一个对象，所以它只能用于继承给子类、子对象或子特质。之所以定义抽象类Field[T]，是为了后面构造出它的样例子对象，并把这些样例对象用于偏函数。例如，构造一个“case object isInt extends Field[Int]”，然后把样例对象isInt用于偏函数“case isInt => …”。

为什么要把isInt构造成Field[Int]类型，而不是直接的Int类型呢？首先，我们想要偏函数的参数是一个常量，这样才能构成常量模式的模式匹配，一个常量模式控制一条配置选项。所以，要么定义一个样例对象，要么定义一个普通的Int对象比如1。这里我们选择定义样例对象，因为不仅会有Int类型，还可能有其他的自定义类型，它们可能是抽象的，无法直接创建实例对象。而且，用一个普通的Int对象来做模式匹配，会显得不那么独一无二。为了方便统一，全部构造成Field[T]类型的样例对象。例如，“case object isA extends Field[A]”、“case object isB extends Field[B]”等等。

其次，为什么要引入Field[Int]而不是“case object isInt extends Int”呢？因为Scala的基本类型Int、Float、Double、Boolean等都是final修饰的抽象类，不能被继承。
三、View类
位置：12-24行

我们只需要关心抽象类View的两个apply方法。其中第一个apply方法只是调用了第二个apply方法，重点在第二个apply方法。第二个apply方法调用了View的find方法，而find方法是抽象的，目前只知道它的返回结果是一个可选值。View的子类应该实现这个find方法，并且find方法会影响apply方法。如果不同的子类实现了不同行为的find方法，那么apply方法可能也会有不同的行为。

我们可以大致推测一下，参数pname的类型是Field[T]，那么很有可能是一个样例对象。而find方法应该就是在参数site里面找到是否包含pname，如果包含就返回一个可选值，否则就返回None。根据require函数可以印证这一点：如果site里面没有pname，那么结果out就是None，out.isDefined就是false，require函数产生异常，并输出字符串“Key ${pname} is not defined in Parameters”，即找不到pname；反之，out.isDefined就是true，require函数通过，不会输出字符串，并执行后面的out.get，即把可选值解开并返回。
四、Parameters类及伴生对象
位置：26-46行

抽象类Parameters是View的子类，它的确实现了find方法，但是又引入了抽象的chain方法，所以我们只需要关心Parameters的子类是如何实现chain方法的。另外四个方法不是重点，但是大致可以推测出来是在把两个Parameters类的对象拼接起来。

此外，出现了新的类TerminalView(位置58-60行)。TerminalView类也是View的子类，它也实现了find方法，只不过是直接返回pname的可选值字段。可以做如下推测：Parameters类的find方法给chain方法传递了三个参数——site、一个TerminalView实例对象和pname，它既可以在site里寻找是否包含pname，也可以用TerminalView的find方法直接返回pname。

Parameters类的伴生对象里定义了一个apply工厂方法，该方法构造了一个PartialParameters对象(位置74-79行)。

首先，PartialParameters类是Parameters的子类，所以工厂方法的返回类型可以是Parameters但实际返回结果是一个子类对象。

其次，工厂方法的入参f是一个理解难点。f的类型是一个函数，这个函数有三个View类型的入参，然后返回一个偏函数，即f是一个返回偏函数的函数。根据偏函数的介绍内容，我们可以推测出f返回的偏函数应该是一系列的case语句，用于模式匹配。

接着，前面说过，我们只需要关心Parameters的子类是如何实现chain方法的，而子类PartialParameters则实现了chain方法的一个版本。这个chain方法首先把PartialParameters的构造参数f返回的偏函数用g来引用，也就是说，g现在就是那个偏函数。至于f的三个入参site、this和tail则不是重点。然后，g.isDefinedAt(pname)表示在偏函数的可行域里寻找是否包含pname，如果有的话，则执行相应的case语句；否则，就用参数tail的find方法。结合代码定义，参数tail其实就是TerminalView的实例对象，它的find方法就是直接返回pname的可选值字段。这与推测内容相吻合。
五、Config类
位置：48-54行

首先，Config类也是Parameters的子类。它可以通过主构造方法接收一个Parameters类型的实例对象来构造一个Config类型的实例对象，或者通过辅助构造方法接收一个函数f来间接构造一个Config类型的实例对象。观察这个辅助构造方法，它其实先调用了Parameters的工厂方法，也就是利用函数f先构造了一个PartialParameters类型的对象(是Parameters的子类型)，再用这个PartialParameters类型的对象去运行主构造方法。

其次，我们仍然需要知道chain方法是如何实现的。这里，Config的chain方法是由构造时的参数p: Parameters决定的。如果一个Config的对象是用辅助构造方法和函数f构造的，那么参数p就是一个PartialParameters的对象，构造出来的Config对象的chain方法实际上运行的是PartialParameters的chain方法。
六、MiniConfig类

前面讲解的内容相当于类库里预先定义好的内容。要配置自定义的电路，还需要一个自定义的类。比如，处理器RISCV-Mini就定义了下面的MiniConfig类：

    // See LICENSE for license details.

    package mini

    import chisel3.Module
    import freechips.rocketchip.config.{Parameters, Config}
    import junctions._

    class MiniConfig extends Config((site, here, up) => {
        // Core
        case XLEN => 32
        case Trace => true
        case BuildALU    => (p: Parameters) => Module(new ALUArea()(p))
        case BuildImmGen => (p: Parameters) => Module(new ImmGenWire()(p))
        case BuildBrCond => (p: Parameters) => Module(new BrCondArea()(p))
        // Cache
        case NWays => 1 // TODO: set-associative
        case NSets => 256
        case CacheBlockBytes => 4 * (here(XLEN) >> 3) // 4 x 32 bits = 16B
        // NastiIO
        case NastiKey => new NastiParameters(
          idBits   = 5,
          dataBits = 64,
          addrBits = here(XLEN))
      }
    )

MiniConfig类是Config的子类，其实它没有添加任何定义，只是给超类Config传递了所需要的构造参数。第五点讲了，Config有两种构造方法，这里是用了给定函数f的方法。那么函数f是什么呢？函数f的类型是“(View, View, View) => PartialFunction[Any,Any]”，这里给出的三个View类型入参是site、here和up。我们目前只知道site、here和up是View类型的对象，具体是什么，还无法确定，也无需关心。重点在于返回的偏函数是什么。偏函数是用花括号包起来的9个case语句，这呼应了我们前面讲过的用case语句组构造偏函数。我们可以推测case后面的XLEN、Trace等，就是一系列的Filed[T]类型的样例对象，也就是第二点推测的。

那么如何利用MiniConfig类呢？我们可以推测这个类包含了riscv-mini核全部的配置信息，然后看看处理器RISCV-Mini的顶层文件是如何描述的：

    val params = (new MiniConfig).toInstance
    val chirrtl = firrtl.Parser.parse(chisel3.Driver.emit(() => new Tile(params)))

这里，也就是直接构造了一个MiniConfig的实例，并把它传递给了需要它的顶层模块Tile。
七、MiniConfig的运行原理

我们来看Tile模块的定义：

    class Tile(tileParams: Parameters) extends Module with TileBase {
      implicit val p = tileParams
      val io     = IO(new TileIO)
      val core   = Module(new Core)
      val icache = Module(new Cache)
      val dcache = Module(new Cache)
      val arb    = Module(new MemArbiter)

      io.host <> core.io.host
      core.io.icache <> icache.io.cpu
      core.io.dcache <> dcache.io.cpu
      arb.io.icache <> icache.io.nasti
      arb.io.dcache <> dcache.io.nasti
      io.nasti <> arb.io.nasti
    }

首先，Tile模块需要一个Parameters类型的参数，我们给了一个MiniConfig的实例，而MiniConfig继承自Config，Config继承自Parameters，所以这是合法的。

然后，Tile模块把入参赋给了隐式变量p。参考隐式定义的内容，这个隐式变量会被编译器传递给当前层次所有未显式给出的隐式参数。查看其他代码的定义，也就是后面实例化的TileIO、Core、Cache和MemArbiter需要隐式参数。由于没有显式给出隐式参数，那么它们都会接收这个隐式变量p，即MiniConfig实例。

以Core模块为例：

    class Core(implicit val p: Parameters) extends Module with CoreParams {
      val io = IO(new CoreIO)
      val dpath = Module(new Datapath)
      val ctrl  = Module(new Control)

      io.host <> dpath.io.host
      dpath.io.icache <> io.icache
      dpath.io.dcache <> io.dcache
      dpath.io.ctrl <> ctrl.io
    }

可以看到，Core模块确实需要接收一个隐式的Parameters类型的参数。

再来看Core混入的特质CoreParams：

     abstract trait CoreParams {
         implicit val p: Parameters
         val xlen = p(XLEN)
    }

这个特质有未实现的抽象成员，即隐式参数p。抽象成员需要子类给出具体的实现，这里也就是Core模块接收的MiniConfig实例。

那么“val xlen = p(XLEN)”意味着什么呢？我们知道，p是一个MiniConfig的实例对象，它继承了超类View的apply方法。查看apply的定义，也就是调用了：

    final def apply[T](pname: Field[T]): T = apply(pname, this)

和

    final def apply[T](pname: Field[T], site: View): T = {
      val out = find(pname, site)
      require (out.isDefined, s"Key ${pname} is not defined in Parameters")
      out.get
    }

而XLEN被定义为：

    case object XLEN extends Field[Int]

前面推测了XLEN是Field[T]类型的样例对象。现在看到定义，确实如此。

即“val xlen = p(XLEN)”相当于“val xlen = p.apply(XLEN, p)”。这里的this也就是把对象p自己传入。紧接着，apply方法需要调用find方法，即“val out = find(XLEN, p)”。而MiniConfig继承了Parameters的find和chain方法，也就是：

    protected[config] def chain[T](site: View, tail: View, pname: Field[T]): Option[T]
    protected[config] def find[T](pname: Field[T], site: View) = chain(site, new TerminalView, pname)

而chain方法继承自Config类：

    protected[config] def chain[T](site: View, tail: View, pname: Field[T]) = p.chain(site, tail, pname)

注意这里的p是用MiniConfig传递给超类的函数f构造的PartialParameters对象，不是MiniConfig对象自己。即：“val out = (new PartialParameters((site, here, up) => {…})).chain(p, new TerminalView, XLEN)”。

再来看PartialParameters类的chain方法的具体行为：

    protected[config] def chain[T](site: View, tail: View, pname: Field[T]) = {
       val g = f(site, this, tail)
       if (g.isDefinedAt(pname)) Some(g.apply(pname).asInstanceOf[T]) else tail.find(pname, site)
    }

注意，这里的f就是PartialParameters的构造参数，也就是MiniConfig传递给超类Config的函数：

    (site, here, up) => {
        // Core
        case XLEN => 32
        case Trace => true
        case BuildALU    => (p: Parameters) => Module(new ALUArea()(p))
        case BuildImmGen => (p: Parameters) => Module(new ImmGenWire()(p))
        case BuildBrCond => (p: Parameters) => Module(new BrCondArea()(p))
        // Cache
        case NWays => 1 // TODO: set-associative
        case NSets => 256
        case CacheBlockBytes => 4 * (here(XLEN) >> 3) // 4 x 32 bits = 16B
        // NastiIO
        case NastiKey => new NastiParameters(
            idBits   = 5,
            dataBits = 64,
            addrBits = here(XLEN))
    }

至此，我们就可以确定site = p(MiniConfig对象自己)，here = new PartialParameters((site, here, up) => {…})(注意这里的this应该是chain的调用对象)，up = new TerminalView。

而g就是由花括号里的9个case语句组成的偏函数。那么g.isDefinedAt(XLEN)就是true，最终chain返回的结果就是“Some(g.apply(XLEN).asInstanceOf[Int])”即可选值Some(32)，注意XLEN是Field[Int]类型的，确定了T是Int。

得到了“val out = Some(32)”后，apply方法的require就能通过，同时返回结果“out.get”即32。最终，“val xlen = p(XLEN)”相当于“val xlen = 32”。也就是说，在混入特质CoreParams的地方，如果有一个隐式Parameters变量是MiniConfig的对象，就会得到一个名为“xlen”的val字段，它的值是32。

关于“here(XLEN)”，因为here已经确定是由f构成的PartialParameters对象，那么套用前述过程，其实也是返回32。

假设偏函数的可行域内没有XLEN，那么chain就会执行“(new TerminalView).find(XLEN, p)”，也就是返回XLEN.default。因为XLEN在定义时没给超类Filed[Int]传递参数，所以会调用Filed[T]的第一个辅助构造函数：

    def this() = this(None)

导致XLEN.default = None。这使得“val out = None”，apply方法的require产生异常报错，并打印信息“Key XLEN is not defined in Parameters”。注意字符串插值会把${pname}求值成XLEN。

再来看Core模块里的CoreIO：

    abstract class CoreBundle(implicit val p: Parameters) extends Bundle with CoreParams

    class HostIO(implicit p: Parameters) extends CoreBundle()(p) {
      val fromhost = Flipped(Valid(UInt(xlen.W)))
      val tohost   = Output(UInt(xlen.W))
    }

    class CoreIO(implicit p: Parameters) extends CoreBundle()(p) {
      val host = new HostIO
      val icache = Flipped((new CacheIO))
      val dcache = Flipped((new CacheIO))
    }

抽象类CoreBundle混入了特质CoreParams，并接收HostIO传来的隐式参数——MiniConfig的对象(HostIO来自于CoreIO ，CoreIO来自于Core，Core来自于Tile)，所以HostIO有了字段“val xlen = 32”，它定义的端口位宽也就是32位的了。

对于偏函数其他的case语句，原理一样：

    case object Trace extends Field[Boolean]
    case object BuildALU extends Field[Parameters => ALU]
    case object BuildImmGen extends Field[Parameters => ImmGen]
    case object BuildBrCond extends Field[Parameters => BrCond]
    case object NWays extends Field[Int]
    case object NSets extends Field[Int]
    case object CacheBlockBytes extends Field[Int]
    case object NastiKey extends Field[NastiParameters]

    case class NastiParameters(dataBits: Int, addrBits: Int, idBits: Int)

    if (p(Trace)) {
        printf("PC: %x, INST: %x, REG[%d] <- %x\n", ew_pc, ew_inst,
          Mux(regFile.io.wen, wb_rd_addr, 0.U),
          Mux(regFile.io.wen, regFile.io.wdata, 0.U))
      }

    val alu     = p(BuildALU)(p)
    val immGen  = p(BuildImmGen)(p)
    val brCond  = p(BuildBrCond)(p)

    val nWays  = p(NWays) // Not used...
    val nSets  = p(NSets)
    val bBytes = p(CacheBlockBytes)

    val nastiExternal = p(NastiKey)
    val nastiXDataBits = nastiExternal.dataBits
    val nastiWStrobeBits = nastiXDataBits / 8
    val nastiXAddrBits = nastiExternal.addrBits
    val nastiWIdBits = nastiExternal.idBits
    val nastiRIdBits = nastiExternal.idBits
    ......

八、总结：如何自定义参数

首先要导入第一点给出的文件，其次是像定义MiniConfig那样定义自己的参数类，然后实例化参数类，并用隐式参数传递给相应的模块。模块在定义时，记得要留好隐式参数列表。

如果当前作用域有隐式的参数类对象，那么用“val xxx = p(XXX)”参数化的字段就能根据隐式对象求得具体的值。改变隐式对象的内容，就能动态地定义像位宽这样的关键字段。这样裁剪设计时，只需要修改自定义参数类的偏函数，而不需要每个地方都去更改。
九、后记

Chisel系列的博客暂时更新完毕，如若后续有大版本发布，语言改动较大，再来及时更新
————————————————
版权声明：本文为CSDN博主「_iChthyosaur」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_34291505/article/details/87923459
 */
class chapter20_隐式参数的应用 {

}
