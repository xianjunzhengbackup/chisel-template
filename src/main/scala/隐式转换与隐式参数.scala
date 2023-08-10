object 隐式转换与隐式参数 extends App{
  /*
  考虑如下场景：假设编写了一个向量类MyVector，并且包含了一些向量的基本操作。因为向量可以与标量做数乘运算，所以需要一个计算数乘的方法“ * ”，它应该接收一个类型为基本值类的参数。在向量对象myVec调用该方法时，可以写成诸如“myVec * 2”的形式。在数学上，反过来写“2 * myVec”也是可行的，但是在程序里却行不通。因为操作符的左边是调用对象，反过来写就表示Int对象“2”是方法的调用者，但是Int类里并没有这种方法。

  为了解决上述问题，所有的oop语言都会有相应的策略，比如笔者熟悉的C++是通过友元的方式来解决。Scala则是采取名为“隐式转换”的策略，也就是把本来属于Int类的对象“2”转换类型，变成MyVector类的对象，这样它就能使用数乘方法。隐式转换属于隐式定义的一种，隐式定义就是那些程序员事先写好的定义，然后允许编译器隐式地插入这些定义来解决类型错误。因为这部分定义通常对使用者不可见，并且由编译器自动调用，故而得名“隐式定义”。
  一、隐式定义的规则

  Scala对隐式定义有如下约束规则：

  ①标记规则。只有用关键字“implicit”标记的定义才能被编译器隐式使用，任何函数、变量或单例对象都可以被标记。其中，标记为隐式的变量和单例对象常用作隐式参数，隐式的函数常用于隐式转换。比如，代码“x + y”因为调用对象x的类型错误而不能通过编译，那么编译器会尝试把代码改成“convert(x) + y”，其中convert是某种可用的隐式转换。如果convert能将x改成某种支持“+”方法的对象，那么这段代码就可能通过类型检查。

  ②作用域规则。Scala编译器只会考虑在当前作用域内的隐式定义，否则，所有隐式定义都是全局可见的将会使得程序异常复杂甚至出错。隐式定义在当前作用域必须是“单个标识符”，即编译器不会展开成“A.convert(x) + y”的形式。如果想用A.convert，那么必须先用“import A.convert”导入才行，然后被展开成“convert(x) + y”的形式。单个标识符规则有一个例外，就是编译器会在与隐式转换相关的源类型和目标类型的伴生对象里查找隐式定义。因此，常在伴生对象中定义隐式转换，而不用在需要时显式导入。

  ③每次一个规则。编译器只会插入一个隐式定义，不会出现“convert1(convert2(x)) + y”这种嵌套的形式，但是可以让隐式定义包含隐式参数来绕开这个限制。

  ④显式优先原则。如果显式定义能通过类型检查，就不必进行隐式转换。因此，总是可以把隐式定义变成显式的，这样代码变长但是歧义变少。用显式还是隐式，需要取舍。

  此外，隐式转换可以用任意合法的标识符来命名。有了名字后，一是可以显式地把隐式转换函数写出来，二是明确地导入具体的隐式转换而不是导入所有的隐式定义。

  Scala只会在三个地方使用隐式定义：转换到一个预期的类型，转换某个选择接收端(即调用方法或字段的对象)，隐式参数。
  二、隐式地转换到期望类型

  Scala的编译器对于类型检查比较严格，比如把一个浮点数赋值给整数变量，通常情况下人们可能希望通过截断小数部分来完成赋值，但是Scala在默认情况下是不允许这种丢失精度的转换的，这会造成类型匹配错误。例如：

      scala> val i: Int = 1.5
      <console>:11: error: type mismatch;
       found   : Double(1.5)
       required: Int
             val i: Int = 1.5
                          ^

  但是用户可能并不关心精度问题，确实需要这样一种赋值操作，那么就可以通过定义一个隐式转换来完成。例如：

      scala> import scala.language.implicitConversions
      import scala.language.implicitConversions

      scala> implicit def doubleToInt(x: Double) = x.toInt
      doubleToInt: (x: Double)Int

      scala> val i: Int = 1.5
      i: Int = 1

  此时再进行之前的赋值，就会正确地截断小数部分。当然，隐式转换也可以显式地调用：

      scala> val i: Int = doubleToInt(2.33)
      i: Int = 2

  第七章讲解类继承时，最后提到了Scala的全局类层次，其中就有七种基本值类的转换，比如Int可以赋值给Double。这其实也是隐式转换在起作用，只是这个隐式转换定义在scala包里的单例对象Predef里。因为所有的Scala文件都会被编译器隐式地在开头按顺序插入“import java.lang._”、“import scala._”、“import Predef._”三条语句，所以标准库里的隐式转换会以不被察觉的方式工作。
  三、隐式地转换接收端

  接收端就是指调用方法或字段的那个对象，也就是调用对象在非法的情况下，被隐式转换变成了合法的对象，这是隐式转换最常用的地方。例如：

      scala> class MyInt(val i: Int)
      defined class MyInt

      scala> 1.i
      <console>:12: error: value i is not a member of Int
             1.i
               ^

      scala> implicit def intToMy(x: Int) = new MyInt(x)
      intToMy: (x: Int)MyInt

      scala> 1.i
      res0: Int = 1

  在上个例子中，标准值类Int是没有叫“i”的字段的，在定义隐式转换前，“1.i”是非法的。有了隐式转换后，把一个Int对象作为参数构造了一个新的MyInt对象，而MyInt对象就有字段i。所以“1.i”被编译器隐式地展开成了“intToMy(1).i”。这就使得已有类型可以通过“自然”的方式与新类型进行互动。

  此外，隐式转换的这个作用还经常被用于模拟新的语法，尤其是在构建DSL语言时用到。因为DSL语言含有大量的自定义类型，这些自定义类型可能要频繁地与已有类型交互，有了隐式转换之后就能让代码的语法更加自然。比如Chisel就是这样的DSL语言，如果读者仔细研究Chisel的源码，就会发现大量的隐式定义。

  前面说过，映射的键-值对语法“键 -> 值”其实是一个对偶“(键, 值)”。这并不是什么高深的技巧，就是隐式转换在起作用。Scala仍然是在Predef这个单例对象里定义了一个箭头关联类ArrowAssoc，该类有一个方法“->”，接收一个任意类型的参数，把调用对象和参数构成一个二元组来返回。同时，单例对象里还有一个隐式转换any2ArrowAssoc，该转换也接收一个任意类型的参数，用这个参数构造一个ArrowAssoc类的实例对象。所以，“键 -> 值”会被编译器隐式地展开成“any2ArrowAssoc(键).->(值)”。因此，严格来讲没有“键 -> 值”这个语法，只不过是用隐式转换模拟出来的罢了。
  四、隐式类

  隐式类是一个以关键字“implicit”开头的类，用于简化富包装类的编写。它不能是样例类，并且主构造方法有且仅有一个参数。此外，隐式类只能位于某个单例对象、类或特质里，不能单独出现在顶层。隐式类的特点就是让编译器在相同层次下自动生成一个与类名相同的隐式转换，该转换接收一个与隐式类的主构造方法相同的参数，并用这个参数构造一个隐式类的实例对象来返回。例如：

      // test.scala
      case class Rectangle(width: Int, height: Int)

      object Rec {
        implicit class RectangleMaker(width: Int) {
          def x(height: Int) = Rectangle(width, height)
        }
        // 自动生成的
        // implicit def RectangleMaker(width: Int) = new RectangleMaker(width)
      }

  将该文件编译后，就可以在解释器里用“import Rec._”或“import Rec.RectangleMaker”来引入这个隐式转换，然后用“1 x 10”这样的语句来构造一个长方形。实际上，Int类并不存在方法“x”，但是隐式转换把Int对象转换成一个RectangleMaker类的对象，转换后的对象有一个构造Rectangle的方法“x”。例如：

      scala> 1 x 10
      <console>:12: error: value x is not a member of Int
             1 x 10
               ^

      scala> import Rec.RectangleMaker
      import Rec.RectangleMaker

      scala> 1 x 10
      res0: Rectangle = Rectangle(1,10)

  隐式类需要单参数主构造方法的原因很简单，因为用于转换的调用对象只有一个，并且自动生成的隐式转换不会去调用辅助构造方法。隐式类不能出现在顶层是因为自动生成的隐式转换与隐式类在同一级，如果不用导入就能直接使用，那么顶层大量的隐式类就会使得代码变得复杂且容易出错。
  五、隐式参数

  函数最后一个参数列表可以用关键字“implicit”声明为隐式的，这样整个参数列表的参数都是隐式参数。注意，是整个参数列表，即使括号里有多个参数，也只需要开头写一个“implicit”。而且每个参数都是隐式的，不存在部分隐式部分显式。

  当调用函数时，若缺省了隐式参数列表，则编译器会尝试插入相应的隐式定义。当然，也可以显式给出参数，但是要么全部缺省，要么全部显式给出，不能只写一部分。

  要让编译器隐式插入参数，就必须事先定义好符合预期类型的隐式变量(val和var可以混用，关键在于类型)、隐式单例对象或隐式函数(别忘了函数也能作为函数的参数进行传递)，这些隐式定义也必须用“implicit”修饰。隐式变量、单例对象、函数在当前作用域的引用也必须满足“单标识符”原则，即不同层次之间需要用“import”来解决。

  隐式参数的类型应该是“稀有”或“特定”的，类型名称最好能表明该参数的作用。如果直接使用Int、Boolean、String等常用类型，容易引发混乱。例如：

      // test.scala
      class PreferredPrompt(val preference: String)
      class PreferredDrink(val preference: String)

      object Greeter {
        def greet(name: String)(implicit prompt: PreferredPrompt,
            drink: PreferredDrink) = {
          println("Welcome, " + name + ". The system is ready.")
          print("But while you work, ")
          println("why not enjoy a cup of " + drink.preference + "?")
          println(prompt.preference)
        }
      }

      object JoesPrefs {
        implicit val prompt = new PreferredPrompt("Yes, master> ")
        implicit val drink = new PreferredDrink("tea")
      }

      scala> Greeter.greet("Joe")
      <console>:12: error: could not find implicit value for parameter prompt: PreferredPrompt
             Greeter.greet("Joe")
                          ^

      scala> import JoesPrefs._
      import JoesPrefs._

      scala> Greeter.greet("Joe")
      Welcome, Joe. The system is ready.
      But while you work, why not enjoy a cup of tea?
      Yes, master>

      scala> Greeter.greet("Joe")(prompt, drink)
      Welcome, Joe. The system is ready.
      But while you work, why not enjoy a cup of tea?
      Yes, master>

      scala> Greeter.greet("Joe")(prompt)
      <console>:15: error: not enough arguments for method greet: (implicit prompt: PreferredPrompt, implicit drink: PreferredDrink)Unit.
      Unspecified value parameter drink.
             Greeter.greet("Joe")(prompt)

  六、含有隐式参数的主构造方法

  不仅是普通的函数可以有隐式参数，类的主构造方法也可以包含隐式参数，辅助构造方法是不允许出现隐式参数的。但有一个问题需要注意，假设类A仅有一个参数列表，并且该列表是隐式的，那么A的实际定义形式是“A()(implicit 参数)”，也就是比字面上的代码多了一个空括号。不管是用new实例化类A，还是被其它类继承，若调用主构造方法时显式给出隐式参数，就必须写出这个空括号。若隐式参数由编译器自动插入，则空括号可有可无。例如：

      scala> class A(implicit val x: Int)
      defined class A

      scala> val a = new A(1)
      <console>:12: error: no arguments allowed for nullary constructor A: ()(implicit x: Int)A
             val a = new A(1)
                           ^

      scala> val a = new A()(1)
      a: A = A@7cf8f45a

      scala> implicit val ORZ = 233
      ORZ: Int = 233

      scala> val b = new A
      b: A = A@7d977a20

      scala> b.x
      res0: Int = 233

      scala> val c = new A()
      c: A = A@de0c402

      scala> c.x
      res1: Int = 233

      scala> val d = new A { val y = x }
      d: A{val y: Int} = $anon$1@5c5c7cc4

      scala> d.x
      res2: Int = 233

      scala> import scala.language.reflectiveCalls
      import scala.language.reflectiveCalls

      scala> d.y
      res3: Int = 233

  如果类A有多个参数列表，且最后一个是隐式的参数列表，则主构造方法没有额外的空括号。
  七、上下文界定

  排序是一个常用的操作，Scala提供了一个特质Ordering[T]，方便用户定义特定的排序行为。该特质有一个抽象方法compare，接收两个T类型的参数，然后返回一个Int类型的结果。如果第一个参数“大于”第二个参数，则应该返回正数，反之应该返回负数，相等则返回0。这里的“大于”、“小于”和“等于”是可以自定义的，完全取决于compare的具体定义，并不一定就是常规的逻辑，比如可以和正常逻辑相反。此外，该特质还有方法gt、gteq、lt和lteq，用于表示大于、大于等于、小于和小于等于，分别根据compare的结果来返回相应的布尔值。换句话说，如果一个对象里混入了Ordering[T]特质，并实现了自己需要的compare方法，就能省略定义很多其它相关的方法。

  假设现在需要编写一个方法寻找“最大”的列表元素，并且具体行为会根据某个隐式Ordering[T]对象发生改变，那么可能定义如下：

      def maxList[T](elements: List[T])(implicit ordering: Ordering[T]): T =
          elements match {
             case List() => throw new IllegalArgumentException("empty list!")
             case List(x) => x
             case x :: rest =>
                 val maxRest = maxList(rest)(ordering)  // 参数ordering被显式传递
                 if (ordering.gt(x, maxRest)) x   // 参数ordering被显式使用
                 else maxRest
      }

  在这里，读者只需关心两行带注释的代码。注意，函数maxList的第二个参数列表是隐式的，这就会让编译器在缺省给出时，自动在当前作用域下寻找一个Ordering[T]类型的对象。在第一行注释处，函数内部进行了自我调用，并且第二个参数仅仅只是传递了ordering，此时就可以利用隐式参数的特性，不必显式给出第二个参数的传递。

  隐式导入的Predef对象里定义了下面这样一个函数：

      def implicitly[T](implicit t: T) = t

  想要使用这个函数，可以只写成“implicitly[T]”的形式。只需要指明T是什么具体类型，在缺省参数的情况下，编译器会在当前作用域下自动寻找一个T类型的隐式对象传递给参数t，然后把这个对象返回。例如，implicitly[ORZ]就会把当前作用域下的隐式ORZ对象返回。既然函数maxList的第二个参数是编译器隐式插入的，那么第二行注释处也就没必要显式写出ordering，而可以改成“implicitly[Ordering[T]]”。

  所以，一个更精简的maxList如下所示：

      def maxList[T](elements: List[T])(implicit ordering: Ordering[T]): T =
          elements match {
             case List() => throw new IllegalArgumentException("empty list!")
             case List(x) => x
             case x :: rest =>
                 val maxRest = maxList(rest)
                 if (implicitly[Ordering[T]].gt(x, maxRest)) x
                 else maxRest
      }

   现在，函数maxList的定义里已经完全不需要显式写出隐式参数的名字了，所以隐式参数可以改成任意名字，而函数体仍然保持不变。由于这个模式很常用，所以Scala允许省掉这个参数列表并改用上下文界定。形如“[T : Ordering]”的函数的类型参数就是一个上下文界定，它有两层含义：①和正常情况一样，先在函数中引入一个类型参数T。②为函数添加一个类型为Ordering[T]的隐式参数。例如：

      def maxList[T : Ordering](elements: List[T]): T =
          elements match {
             case List() => throw new IllegalArgumentException("empty list!")
             case List(x) => x
             case x :: rest =>
                 val maxRest = maxList(rest)
                 if (implicitly[Ordering[T]].gt(x, maxRest)) x
                 else maxRest
      }

  上下文界定与前面讲的上界和下界很像，但[T <: Ordering[T]]表明T是Ordering[T]的子类型并且不会引入隐式参数，[T : Ordering]则并没有标定类型T的范围，而是说类型T与某种形式的排序相关，并且会引入隐式参数。

  上下文界定是一种很灵活的语法，配合像Ordering[T]这样的特质以及隐式参数，可以实现各种功能而不需要改变定义的T类型。
  八、多个匹配的隐式定义

  当多个隐式定义都符合条件时，编译器会发出定义模棱两可错误。但是如果其中一个比别的更加具体，那么编译器会自动选择定义更具体的隐式定义，且不会发出错误。所谓“具体”，只要满足两个条件之一便可：①更具体的定义，其类型是更模糊的定义的子类型。如果是隐式转换，比较的是参数类型，不是返回结果的类型。②子类中的隐式定义比超类中的隐式定义更具体。

  定义模棱两可：

      scala> class A(implicit val x: Int)
      defined class A

      scala> implicit val z = 10
      z: Int = 10

      scala> implicit val zz = 100
      zz: Int = 100

      scala> val a = new A()
      <console>:14: error: ambiguous implicit values:
       both value z of type => Int
       and value zz of type => Int
       match expected type Int
             val a = new A()
                     ^

   条件①：

      scala> class A(implicit val x: Int)
      defined class A

      scala> implicit val z = 10
      z: Int = 10

      scala> implicit val zz: Any = 100
      zz: Any = 100

      scala> val a = new A()
      a: A = A@fee881

      scala> a.x
      res0: Int = 10

  条件②：

      scala> class A(implicit val x: Int)
      defined class A

      scala> class Sup {
               |    implicit val z = 10
               |  }
      defined class Sup

      scala> class Sub extends Sup {
               |    implicit val zz = 100
               |  }
      defined class Sub

      scala> val a = new Sup
      a: Sup = Sup@789dd6bf

      scala> val b = new Sub
      b: Sub = Sub@772cf46b

      scala> import a._
      import a._

      scala> import b._
      import b._

      scala> val c = new A()
      c: A = A@352bea0e

      scala> c.x
      res0: Int = 100

  九、总结

  隐式定义是一个很常用的Scala高级语法，尤其是在阅读、理解Chisel这样的DSL语言时，就不得不彻底搞明白自定义的隐式定义是如何工作的。即使是编写实际的硬件电路，像RocketChip的快速裁剪、配置功能，就是通过模式匹配加上隐式参数实现的。配置机制会在后续章节讲解。对于想掌握Chisel高级功能的读者，本章是学习的
  ————————————————
  版权声明：本文为CSDN博主「_iChthyosaur」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
  原文链接：https://blog.csdn.net/qq_34291505/article/details/87285366
   */

}
