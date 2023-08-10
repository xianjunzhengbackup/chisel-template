object 类继承 extends App{
  /*
  一、Scala的类继承

  在面向对象编程里，为了节省代码量，也为了反映实际各种类之间的联系，通常采取两种策略：包含和继承。包含代表了一种has-a的关系，也就是一个类包括了另一个类的实例。例如，午餐的菜单含有水果，那么就可以先编写一个水果类，然后再编写一个午餐类，并在午餐类里包含水果类的对象，但这两者没有必然联系。继承代表了一种is-a的关系，也就是从一个宽泛的类可以派生出更加具体的类。例如，编写的水果类包含了一些常见水果的公有属性，然后要编写一个更具体的苹果类。考虑到现实世界中，苹果就是(is-a，更准确来说应该是is-a-kind-of)一种特殊的水果，那么苹果类完全可以把水果类里定义的属性都继承过来，而且这两者有必然联系。

  本章介绍的内容就是关于类继承的Scala语法，以及一些特性。

  通过在类的参数列表后面加上关键字“extends”和被继承类的类名，就完成了一个继承的过程。被继承的类称为“超类”或者“父类”，而派生出来的类称为“子类”。如果继承层次较深，最顶层的类通常也叫“基类”。继承关系只有“超类”和“子类”的概念，即超类的超类也叫超类，子类的子类还叫子类。例如：

      scala> class A {
               |    val a = "Class A"
               |  }
      defined class A

      scala> class B extends A {
               |    val b = "Class B inherits from A"
               |  }
      defined class B

      scala> val x = new B
      x: B = B@5922cff3

      scala> x.a
      res0: String = Class A

      scala> x.b
      res1: String = Class B inherits from A

  以上代码纯粹是为了演示Scala的语法，没有什么实际意义。
   二、调用超类的构造方法

  大多数类都有参数列表，用于接收参数，传递给构造方法并初始化字段。像前面的例子比较特殊，类A没有参数。假如类A有参数，那么类B该怎么处理呢？在构造某个类的对象时，如果这个类继承自另外一个类，那么应该先构造超类对象的组件，再来构造子类的其他组件。也就是说，类B需要调用类A的构造方法。子类调用超类的构造方法的语法是：

      class 子类(子类对外接收的参数) extends 超类(子类给超类的参数)

  像上个例子中，其实是类A的构造方法没有参数，所以“extends A”也就不需要参数。第五章说过，Scala只允许主构造方法调用超类的构造方法，而这种写法就是子类的主构造方法在调用超类的构造方法。例如：

      scala> class A(val a: Int)
      defined class A

      scala> class B(giveA: Int, val b: Int) extends A(giveA)
      defined class B

      scala> val x = new B(10, 20)
      x: B = B@5f81507a

      scala> x.a
      res0: Int = 10

      scala> x.b
      res1: Int = 20

  三、重写超类的成员
     Ⅰ、不被继承的成员

  通常，超类的成员都会被子类继承，除了两种成员：一是超类中用“private”修饰的私有成员，二是被子类重写的成员。私有成员无需过多解释。重写的意思是，超类中的某个属性，在子类中可能并不一定符合，而是需要一个新的符合子类行为的版本。例如，几乎所有的金属在室温下都是固态，唯独汞是液态，所以金属类的室温状态可以定义为固态，而子类汞则应该把这个属性重写为液态。 重写超类的成员时，应该在定义的开头加上关键字“override”。例如：

      scala> class Metal {
               |    val state = "solid"
               |  }
      defined class Metal

      scala> class Mercury extends Metal {
               |    override val state = "liquid"
               |  }
      defined class Mercury

      scala> val mer = new Mercury
      mer: Mercury = Mercury@64f34c91

      scala> mer.state
      res0: String = liquid

  重写时，关键字“override”是必须具备的，这是为了防止意外的重写。比如，由于拼写错误使得字段名相同，但是因为少了override而使得编译器报错；或者，写了override来重写某个方法，但是参数列表意外写错，也会使得编译器报错。更重要的是，改善了“脆弱基类”的问题。比方说，因为版本更新而给类库增加新的类或成员时，会增加破坏客户代码的风险。因为客户代码可能已有同名的定义了，但是因为双方缺乏信息交流而出错。这时，因为override的缺失，编译器会找到相关错误，尽管不能彻底解决这个问题。
     Ⅱ、不可重写的成员

  如果超类成员在开头用关键字“final”修饰，那么子类就只能继承，而不能重写。

  “final”也可以用于修饰class，那么这个类就禁止被其他类继承。
     Ⅲ、无参方法与字段

  Scala的无参方法在调用时，可以省略空括号。鉴于此，对用户代码而言，如果看不到类库的具体实现，那么调用无参方法和调用同名的字段则没有什么不同，甚至无法区分其具体实现到底是方法还是字段。如果把类库里的无参方法改成字段，或是把字段改成无参方法，那么客户代码不用更改也能运行。为了方便在这两种定义之间进行切换，Scala允许超类的无参方法被子类重写为字段，但是字段不能反过来被重写为无参方法，而且方法的返回类型必须和字段的类型一致。例如：

      scala> class A {
               |    def justA() = "A"
               |  }
      defined class A

      scala> class B extends A {
               |    override val justA = "B"
               |  }
      defined class B

      scala> class C extends A {
               |    override val justA = 1
               |  }
      <console>:13: error: overriding method justA in class A of type ()String;
       value justA has incompatible type
               override val justA = 1
                            ^

      scala> class D {
               |    val d = 10
               |  }
      defined class D

      scala> class E extends D {
               |    override def d() = 100
               |  }
      <console>:13: error: overriding value d in class D of type Int;
       method d needs to be a stable, immutable value
               override def d() = 100
                            ^

   字段与方法的区别在于：字段一旦被初始化之后，就会被保存在内存中，以后每次调用都只需直接读取内存即可；方法不会占用内存空间，但是每次调用都需要执行一遍程序段，速度比字段要慢。因此，到底定义成无参方法还是字段，就是在速度和内存之间折衷。

  字段能重写无参方法的原理是Scala只有两种命名空间：①值——字段、方法、包、单例对象；②类型——类、特质。因为字段和方法同处一个命名空间，所以字段可以重写无参方法。这也告诉我们，同处一个命名空间的定义类型，在同一个作用域内不能以相同的名字同时出现。例如，同一个类里不能同时出现同名的字段、无参方法和单例对象：

      scala> class A {
               |    val a = 10
               |    object a
               |  }
      <console>:13: error: a is already defined as value a
               object a
                      ^

  四、子类型多态与动态绑定

  类型为超类的变量可以指向子类的对象，这一现象被称为子类型多态，也是面向对象的多态之一。但是对于方法而言，尽管变量的类型是超类，方法的版本却是“动态绑定”的。也就是说，调用的方法要运行哪个版本，是由变量指向的对象来决定的。例如：

      scala> class A {
               |    def display() = "I'm A."
               |  }
      defined class A

      scala> class B extends A {
               |    override def display() = "I'm B."
               |  }
      defined class B

      scala> val x: A = new B
      x: A = B@6c5abd8f

      scala> x.display
      res0: String = I'm B.

  五、抽象类

  如果类里包含了没有具体定义的成员——没有初始化的字段或没有函数体的方法，那么这个类就是抽象类，必须用关键字“abstract”修饰。相应的成员称为抽象成员，不需要“abstract”的修饰。因为存在抽象成员，所以这个类不可能构造出具体的对象，因为有无法初始化抽象字段或者无法执行抽象方法，所以抽象类不能通过“new”来构造实例对象。

  抽象类缺失的抽象成员的定义，可以由抽象类的子类来补充。也就是说，抽象类“声明”了抽象成员，却没有立即“定义”它。如果子类补齐了抽象成员的相关定义，就称子类“实现”了超类的抽象成员。相对的，我们称超类的成员是“抽象”的，而子类的成员是“具体”的。子类实现超类的抽象成员时，关键字“override”可写可不写。例如：

      scala> abstract class A {
               |    val a: Int
               |  }
      defined class A

      scala> val x = new A
      <console>:12: error: class A is abstract; cannot be instantiated
             val x = new A
                     ^

      scala> class B(val b: Int) extends A {
               |    val a = b * 2
               |  }
      defined class B

      scala> val y = new B(1)
      y: B = B@7fe87c0e

      scala> y.a
      res0: Int = 2

      scala> y.b
      res1: Int = 1

  抽象类常用于定义基类，因为基类会派生出很多不同的子类，这些子类往往具有行为不同的同名成员，所以基类只需要声明有哪些公共成员，让子类去实现它们各自期望的版本。
  六、关于多重继承

   Scala没有多重继承，也就是说，在“extends”后面只能有一个类，这与大多数oop语言不同。多重继承其实是一个很让人头疼的问题，使用起来很复杂，也很容易出错。在笔者学习C++的时候，看到了C++为了使用多重继承而不得不做出的大量语法规则修改，和单个继承混在一起时常把人搞晕。Scala舍弃多重继承的做法，对于程序员而言是莫大的帮助，不用在编写代码时考虑冗长的代码设计。尤其是对超类方法的调用，当存在多个超类时，为了避免歧义而不得不仔细设计方法的行为。

  虽然多重继承不好用，但是它实现的功能在某些时候又不可或缺。为此，Scala专门设计了“特质”来实现相同的功能，并且特质的规则更简单、更明了。特质将在后一章介绍。
  七、Scala类的层次结构

  Scala所有的类——不管是标准库里已有的类还是自定义的类，都不是毫无关联的，而是存在层次关系。这种关系如下图所示，其中实线箭头表示属于指向的类的子类，虚线箭头表示可以隐式转换成指向的类：
  Scala类的层次结构

  最顶部的类是抽象类Any，它是所有类的超类。Any类定义了几个成员方法，如下表所示：
  Any类的成员方法 方法定义	属性	说明
  def getClass(): Class[_]	抽象	返回运行时对象所属的类的表示
  final def !=(arg0: Any): Boolean	具体	比较两个对象的自然相等性是否不相等
  final def ==(arg0: Any): Boolean	具体	比较两个对象的自然相等性是否相等
  def equals(arg0: Any): Boolean	具体	比较两个对象的自然相等性，被!=和==调用
  final def ##(): Int	具体	计算对象的哈希值，等同于hashCode，但是自然相等性相等的两个对象会得到相同的哈希值，并且不能计算null对象
  def hashCode(): Int	具体	计算对象的哈希值
  final def asInstanceOf[T]: T	具体	把对象强制转换为T类型
  final def isInstanceOf[T]: Boolean	具体	判断对象是否属于T类型，或T的子类
  def toString(): String	具体	返回一个字符串来表示对象

  也就是说，任何类都有这几个方法。注意，不能出现同名的方法，若确实需要自定义版本，则记得带上“override”。

  再往下一层，Any类有两个子类：AnyVal和AnyRef。也就是说，所有类被分成两大部分：值类和引用类。值类也就是前面讲过的对应Java的九种基本类型，并且其中七个存在一定的隐式转换，例如Byte可以扩展成Short等等。隐式转换是Scala的一个语法，用于对象在两个类之间进行类型转换，后面章节会讲到。除了标准库里已有的隐式转换，也可以自定义隐式转换。

  除了这九个值类，也可以自定义值类，即定义时显式地继承自AnyVal类。如果没有显式地继承自AnyVal类，则都认为是AnyRef类的子类，也就是说一般自定义的类都属于引用类。大部分标准库里的类都是引用类，比如常见的字符串类String，还有后续会讲解的列表类、映射类、集合类等等。Java的类都属于引用类，因为Java的基本类型都在值类里面。

  前面讲过引用相等性，很显然只有引用类才有引用相等性。事实上，比较引用相等性的两个方法——eq和ne，都定义在AnyRef类里。值类AnyVal是没有这两个方法的，也不需要。

  在层次结构的底部有两个底类型——Null类和Nothing类。其中Null类是所有引用类的子类，表示空引用，即指向JVM里的空内存，这与Java的null概念是一样的。但是Null并不兼容值类，所以Scala还有一个类——Nothing，它是所有值类和引用类的子类，甚至还是Null类的子类。因此Nothing不仅表示空引用，还表示空值。Scala里有一个可选值语法，也就是把各种类型打包成一个特殊的可选值。为了表示“空”、“没有”这个特殊的概念，以及兼容各种自定义、非自定义的值和引用类，这个特殊的可选值其实就是把Nothing类进行打包。

  除了自定义的普通类属于引用类，后一章讲解的特质，也是属于引用类的范畴。
  八、总结

  本章介绍了类继承的语法，其内容不多，也简单易懂。这一章真正的难点是阅读大型系统软件时，遇到的纷繁复杂的类层次，要梳理这些类的继承关系往往费时费力。还有自己编写代码时，如何设计类的结构，让系统稳定、简单、逻辑清晰，也不是一件容易事。

  在编写Chisel时，类继承主要用于编写接口，因为接口可以扩展，但是实际的硬件电路并没有很强烈的继承关
  ————————————————
  版权声明：本文为CSDN博主「_iChthyosaur」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
  原文链接：https://blog.csdn.net/qq_34291505/article/details/86766873
   */

}
