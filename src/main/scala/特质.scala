object 特质 extends App{
  /*
  一、什么是特质

  因为Scala没有多重继承，为了提高代码复用率，故而创造了新的编程概念——特质。

  特质是用关键字“trait”为开头来定义的，它与单例对象很像，两者都不能有入参。但是，单例对象天生就是具体的，特质天生就是抽象的，不过不需要用“abstract”来说明。所以，特质可以包含抽象成员，而单例对象却不行。另外，两者都不能用new来实例化，因为特质是抽象的，而单例对象已经是具体的对象。类、单例对象和特质三者一样，内部可以包含字段和方法，甚至包含其他类、单例对象、特质的定义。

  特质可以被其它类、单例对象和特质“混入”。这里使用术语“混入”而不是“继承”，是因为特质在超类方法调用上采用线性化机制，与多重继承有很大的区别。其它方面，“混入”和“继承”其实是一样的。例如，某个类混入一个特质后，就包含了特质的所有公有成员，而且也可以用“override”来重写特质的成员。

  Scala只允许继承自一个类，但是对特质的混入数量却没有限制，故而可用于替代多重继承语法。要混入一个特质，可以使用关键字“extends”。但如果“extends”已经被占用了，比如已经拿去继承一个类或混入一个特质，那么后续则通过关键字“with”来混入其他特质。例如：

      scala> class A {
               |    val a = "Class A"
               |  }
      defined class A

      scala> trait B {
               |    val b = "Trait B"
               |  }
      defined trait B

      scala> trait C {
               |    def c = "Trait C"
               |  }
      defined trait C

      scala> object D extends A with B with C
      defined object D

      scala> D.a
      res0: String = Class A

      scala> D.b
      res1: String = Trait B

      scala> D.c
      res2: String = Trait C

  特质也定义了一个类型，而且类型为该特质的变量，可以指向混入该特质的对象。例如：

      scala> trait A
      defined trait A

      scala> class B extends A
      defined class B

      scala> val x: A = new B
      x: A = B@7cc1f72c

  二、特质的层次

  特质也可以继承自其他类，或混入任意个特质，这样该特质就是关键字“extends”引入的那个类/特质的子特质。如果没有继承和混入，那么这个特质就是AnyRef类的子特质。前面讲过AnyRef类是所有非值类和特质的超类。当某个类、单例对象或特质用关键字“extends”混入一个特质时，会隐式继承自这个特质的超类。也就是说，类/单例对象/特质的超类，都是由“extends”引入的类或特质决定的。

  特质对混入有一个限制条件：那就是要混入该特质的类/单例对象/特质，它的超类必须是待混入特质的超类，或者是待混入特质的超类的子类。因为特质是多重继承的替代品，那就有“继承”的意思。既然是继承，混入特质的类/单例对象/特质的层次，就必须比待混入特质的层次要低。例如：

      scala> class A
      defined class A

      scala> class B extends A
      defined class B

      scala> class C
      defined class C

      scala> trait D extends A
      defined trait D

      scala> trait E extends B
      defined trait E

      scala> class Test1 extends D
      defined class Test1

      scala> class Test2 extends A with D
      defined class Test2

      scala> class Test3 extends B with D
      defined class Test3

      scala> class Test4 extends C with D
      <console>:13: error: illegal inheritance; superclass C
       is not a subclass of the superclass A
       of the mixin trait D
             class Test4 extends C with D
                                        ^

      scala> class Test5 extends A with E
      <console>:13: error: illegal inheritance; superclass A
       is not a subclass of the superclass B
       of the mixin trait E
             class Test5 extends A with E

  上例中，类Test1直接混入特质D，这样隐式继承自D的超类——类A，所以合法。类Test2和Test3分别继承自类A和A的子类，所以也允许混入特质D。类Test4的超类是C，而C与A没有任何关系，所以非法。类Test5的超类是A，特质E的超类是B，尽管类A是类B的超类，这也仍然是非法的。从提示的错误信息也可以看出，混入特质的类/单例对象/特质，其超类必须是待混入特质的超类或超类的子类。
   三、混入特质的简便方法

  如果想快速构造一个混入某些特质的实例，可以使用如下语法：

      new Trait1 with Trait2 ... { definition }

  这其实是定义了一个匿名类，这个匿名类混入了这些特质，并且花括号内是该匿名类的定义。然后使用new构造了这个匿名类的一个对象，其等效的代码就是：

      class AnonymousClass extends Trait1 with Trait2 ... { definition }

      new AnonymousClass

  例如：

      scala> trait T {
               |    val tt = "T__T"
               |  }
      defined trait T

      scala> trait X {
               |    val xx = "X__X"
               |  }
      defined trait X

      scala> val a = new T with X
      a: T with X = $anon$1@4c1fed69

      scala> a.tt
      res0: String = T__T

      scala> a.xx
      res1: String = X__X

  除此之外，还可以在最前面加上一个想要继承的超类：

      new SuperClass with Trait1 with Trait2 ... { definition }

  四、特质的线性化叠加计算

  多重继承一个很明显的问题是，当子类调用超类的方法时，若多个超类都有该方法的不同实现，那么需要附加额外的语法来确定具体调用哪个版本。Scala的特质则是采取一种线性化的规则来调用特质中的方法，这与大多数语言不一样。在特质里，“super”调用是动态绑定的。也就是说，按特质本身的定义，无法确定super调用的具体行为；直到特质混入某个类或别的特质，有了具体的超类方法，才能确定super的行为。这是实现线性化的基础。

  想要通过混入特质来实现某个方法的线性叠加，那么要注意以下要点：①需要在特质里定义同名同参的方法，并加关键字组合“abstract override”，注意这不是重写，而是告诉编译器该方法用于线性叠加。这个关键字组合只能用在特质里，不允许用在其他地方。②这个关键字组合也意味着该特质必须混入某个拥有该方法具体定义的类中，也就是这个类定义了该方法的最终行为。③需要混入特质进行线性化计算的类，在定义时不能立即混入特质。这样做会让编译器认为这个类是在重写末尾那个特质的方法，而且当类的上一层超类是抽象类时还会报错。应该先定义这个类的子类来混入特质，然后构造子类的对象。或者直接用第三点讲的“new SuperClass with Trait1 with Trait2 ...”来快速构造一个子类对象。④特质对该方法的定义必须出现“super.方法名(参数)”。⑤方法的执行顺序遵循线性化计算公式，起点是公式里从左往右数的第一个特质，外部传入的参数也是由起点接收；起点的“super.方法名(参数)”将会调用起点右边第一个特质的同名方法，并把起点的计算结果作为参数传递过去；依此类推，最后结果会回到最左边的类本身。可以理解为特质是按一定顺序对入参进行各种变换，最后把变换后的入参交给类来计算。⑥要回到类本身，说明这个类直接或间接重写或实现了基类的方法。并且定义中如果也出现了“super.方法名(参数)”，那么会调用它的上一层超类的实现版本。或者这个类没有重写，那就一定要有继承自超类的实现。

  线性化计算公式：①最左边是类本身。②在类的右边写下定义时最后混入的那个特质，并接着往右按继承顺序写下该特质的所有超类和超特质。③继续往右写下倒数第二个混入的特质，以及其超类和超特质，直到写完所有特质。④所有重复项只保留最右边那个，并在最右边加上AnyRef和Any。

  为了具体说明，以如下代码为例：

      // test.scala
      abstract class A {
        def m(s: String): String
      }
      class X extends A {
        def m(s: String) = "X -> " + s
      }
      trait B extends A {
        abstract override def m(s: String) = super.m("B -> " + s)
      }
      trait C extends A {
        abstract override def m(s: String) = super.m("C -> " + s)
      }
      trait D extends A {
        abstract override def m(s: String) = super.m("D -> " + s)
      }
      trait E extends C {
        abstract override def m(s: String) = super.m("E -> " + s)
      }
      trait F extends C {
        abstract override def m(s: String) = super.m("F -> " + s)
      }
      class G extends X {
        override def m(s: String) = "G -> " + s
      }
      val x = new G with D with E with F with B
      println(x.m("End"))

  首先，需要混入特质进行线性化计算的类G在定义时没有立即混入特质，即只有“class G extends X”，而是通过“new G with D with E with F with B”来构造G的匿名子类的对象。其次，注意基类A是一个抽象类，类X实现了抽象方法m，类G重写了X的m，其余特质也用“abstract override”重写了m，这保证了m最终会回到类G。最后，基类A的m的返回类型“String”的声明是必须的，因为抽象方法无法推断返回类型，不声明就默认是Unit。

  根据线性化计算公式可得(蓝色表示起点，红色表示重复，类X不参与计算)：

      ① G

      ② G→B→A

      ③ G→B→A→F→C→A

      ④ G→B→A→F→C→A→E→C→A

      ⑤ G→B→A→F→C→A→E→C→A→D→A

      ⑥ G→B→F→E→C→D→A

      ⑦ G→B→F→E→C→D→A→AnyRef→Any

  起点是B，传入参数“End”会得到“B -> End”；然后B的super.m调用F的m，并传入计算得到的“B -> End”，那么F会得到“F -> B -> End”，再继续向右调用；最后A的m是抽象的，无操作可执行，转而回到G的m，所以最后传给G的参数实际是“D -> C -> E -> F -> B -> End”，得到的结果也就是“G -> D -> C -> E -> F -> B -> End”。

  通过实际运行可得：

      PS E:\Microsoft VS\Scala> scala test.scala
      G -> D -> C -> E -> F -> B -> End

  如果G的m也有super或没有重写，那么会调用X的m，最后的结果是最左边多个X：

      // test.scala
      ...
      class G extends X {
        override def m(s: String) = super.m("G -> " + s)
      }
      ...

      PS E:\Microsoft VS\Scala> scala test.scala
      X -> G -> D -> C -> E -> F -> B -> End

  如果立即混入特质，则相当于普通的方法重写：

      // test.scala
      ...
      class G extends X with D with E with F with B {
        override def m(s: String) = "G -> " + s
      }
      val x = new G
      ...

      PS E:\Microsoft VS\Scala> scala test.scala
      G -> End

  如果上一层超类是抽象类，立即混入会引发错误：

      // test.scala
      ...
      class G extends A with D with E with F with B {
        override def m(s: String) = "G -> " + s
      }
      val x = new G
      ...

      PS E:\Microsoft VS\Scala> scala test.scala
      E:\Microsoft VS\Scala\Chapter 12\.\traittest.scala:23: error: overriding method m in trait B of type (s: String)String;
       method m needs `abstract override' modifiers
        override def m(s: String) = "G -> " + s
                     ^
      one error found

  五、总结

  特质用于代码重用，这与抽象基类的作用相似。不过，特质常用于混入在不相关的类中，而抽象基类则用于构成有继承层次的一系列相关类。在Chisel中，特质常用于硬件电路模块的公有属性的提取，在需要这些属性的电路中混入相应的特质，在不需要的时候删去，就能快速地修改电路
  ————————————————
  版权声明：本文为CSDN博主「_iChthyosaur」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
  原文链接：https://blog.csdn.net/qq_34291505/article/details/86773401
   */

}
