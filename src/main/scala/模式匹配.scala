object 模式匹配 extends App{
  /*
  前一章提到过，Scala的内建控制结构里有一个match表达式，用于模式匹配或偏函数。模式匹配是Scala中一个强大的高级功能，并且在Chisel中被用于硬件的参数化配置，可以快速地裁剪、配置不同规模的硬件电路。所以，尽管模式匹配不是很容易就能掌握并熟练运用，但是学会它将会对软、硬件编程都大有帮助。
  一、样例类与样例对象

  定义类时，若在最前面加上关键字“case”，那么这个类就被称为样例类。Scala的编译器会自动对样例类添加一些语法便利：①添加一个与类同名的工厂方法。也就是说，可以通过“类名(参数)”来构造对象，而不需要“new 类名(参数)”，使得代码看起来更加自然。②参数列表的每个参数都隐式地获得了一个val前缀。也就是说，类内部会自动添加与参数同名的公有字段。③会自动以“自然”的方式实现toString、hashCode和equals方法。④添加一个copy方法，用于构造与旧对象只有某些字段不同的新对象，只需通过传入具名参数和缺省参数实现。比如objectA.copy(arg0 = 10)会创建一个只有arg0为10、其余成员与objectA完全一样的新对象。

  一个样例类定义如下：

      scala> case class Students(name: String, score: Int)
      defined class Students

      scala> val stu1 = Students("Alice", 100)
      stu1: Students = Students(Alice,100)

      scala> stu1.name
      res0: String = Alice

      scala> stu1.score
      res1: Int = 100

      scala> val stu2 = stu1.copy()
      stu2: Students = Students(Alice,100)

      scala> stu2 == stu1
      res2: Boolean = true

      scala> val stu3 = stu1.copy(name = "Bob")
      stu3: Students = Students(Bob,100)

      scala> stu3 == stu1
      res3: Boolean = false

  样例类最大的好处是支持模式匹配。相关内容会在本章接下来的内容中介绍。

  样例对象与样例类很像，也是定义单例对象时在最前面加上关键字“case”。尽管样例对象和普通的单例对象一样，没有参数和构造方法，也是一个具体的实例，但是样例对象的实际形式更接近样例类。前面说的样例类的特性，样例对象也具备，例如可用于模式匹配。从编译后的结果来比较，样例对象与一个无参、无构造方法的样例类是一样的。
  二、模式匹配

  模式匹配的语法如下：

      选择器 match { 可选分支 }

  其中，选择器就是待匹配的对象，花括号里是一系列以关键字“case”开头的“可选分支”。每个可选分支都包括一个模式以及一个或多个表达式，如果模式匹配成功，就执行相应的表达式，最后返回结果。可选分支定义如下：

      case 模式 => 表达式

  match表达式与Java的switch语法很像，但模式匹配功能更多。两者有三个主要区别：①match是一个表达式，它可以返回一个值。②可选分支存在优先级，其匹配顺序也就是代码编写时的顺序，并且只有第一个匹配成功的模式会被选中，然后对它的表达式求值并返回。如果表达式有多个，则按顺序执行直到下个case语句为止，并不会贯穿执行到末尾的case语句，所以多个表达式也可以不用花括号包起来。③要确保至少有一个模式匹配成功，否则会抛出MatchError异常。
  三、模式的种类

  模式匹配之所以强大，原因之一就是支持多种多样的模式。
     Ⅰ、通配模式

  通配模式用下划线“_”表示，它会匹配任何对象，通常放在末尾用于缺省、捕获所有可选路径，相当于switch的default。如果某个模式需要忽略局部特性，也可以用下划线代替。例如：

      scala> def test(x: Any) = x match {
               |     case List(1, 2, _) => true
               |     case _ => false
               |  }
      test: (x: Any)Boolean

      scala> test(List(1, 2, 3))
      res0: Boolean = true

      scala> test(List(1, 2, 10))
      res1: Boolean = true

      scala> test(List(1, 2))
      res2: Boolean = false

  上述例子中，第一个case就是用下划线忽略了模式的局部特性：表明只有含有三个元素，且前两个为1和2、第三个元素任意的列表才能匹配该模式。不符合第一个case的对象，都会被通配模式捕获。

  越具体的模式，可匹配的范围就越小；反之，越模糊的模式，覆盖的范围越大。具体的模式，应该定义在模糊的模式前面，否则如果具体模式的作用范围是模糊模式的子集，那写在后面的具体模式就永远不会被执行。像通配模式这种全覆盖的模式，一定要写在最后。
     Ⅱ、常量模式

  常量模式，顾名思义，就是用一个常量作为模式，使得只能匹配常量自己。任何字面量都可以作为常量模式，任何val类型的变量或单例对象(样例对象也是一样的)也可以作为常量模式。例如，Nil这个单例对象能且仅能匹配空列表：

      scala> def test2(x: Any) = x match {
               |     case 5 => "five"
               |     case true => "truth"
               |     case "hello" => "hi!"
               |     case Nil => "the empty list"
               |     case _ => "something else"
               |  }
      test2: (x: Any)String

      scala> test2(List())
      res0: String = the empty list

      scala> test2(5)
      res1: String = five

      scala> test2(true)
      res2: String = truth

      scala> test2("hello")
      res3: String = hi!

      scala> test2(233)
      res4: String = something else

     Ⅲ、变量模式

  变量模式就是一个变量名，它可以匹配任何对象，这一点与通配模式一样。但是，变量模式还会把该变量名与匹配成功的输入对象绑定，在表达式中可以通过这个变量名来进一步操作输入对象。变量模式还可以放在最后面代替通配模式。例如：

      scala> def test3(x: Any) = x match {
               |     case 0 => "Zero!"
               |     case somethingElse => "Not Zero: " + somethingElse
               |  }
      test3: (x: Any)String

      scala> test3(0)
      res0: String = Zero!

      scala> test3(List(0))
      res1: String = Not Zero: List(0)

  与通配模式一样，变量模式的后面不能添加别的模式，否则编译器会警告无法到达变量模式后面的代码。例如：

      scala> def test3(x: Any) = x match {
               |     case somethingElse => "Not Zero: " + somethingElse
               |     case 0 => "Zero!"
               |  }
      <console>:12: warning: patterns after a variable pattern cannot match (SLS 8.1.1)
               case somethingElse => "Not Zero: " + somethingElse
                    ^
      <console>:13: warning: unreachable code due to variable pattern 'somethingElse' on line 12
               case 0 => "Zero!"
                         ^
      <console>:13: warning: unreachable code
               case 0 => "Zero!"
                         ^
      test3: (x: Any)String

  有时候，常量模式看上去也是一个变量名，比如“Nil”就是引用空列表这个常量模式。Scala有一个简单的词法区分规则：以小写字母开头的简单名称会被当做变量模式，其他引用都是常量模式。即使以小写字母开头的简单名称是某个常量的别名，也会被当成变量模式。如果想绕开这个规则，有两种方法：①如果常量是某个对象的字段，可以加上限定词如this.a或object.a等来表示这是一个常量。②用反引号` `把名称包起来，编译器就会把它解读成常量，这也是绕开关键字与自定义标识符冲突的方法。例如：

      scala> val somethingElse = 1
      somethingElse: Int = 1

      scala> def test4(x: Any) = x match {
               |     case `somethingElse` => "A constant!"
               |     case 0 => "Zero!"
               |     case _ => "Something else!"
               |  }
      test4: (x: Any)String

      scala> test4(somethingElse)
      res0: String = A constant!

      Ⅳ、构造方法模式

  构造方法模式也就是把样例类的构造方法作为模式，其形式为“名称(模式)”。假设这里的“名称”指定的是一个样例类的名字，那么该模式将首先检查待匹配的对象是不是以这个名称命名的样例类的实例，然后再检查待匹配的对象的构造方法参数是不是匹配括号里的“模式”。Scala的模式支持深度匹配，也就是说，括号里的模式可以是任何一种模式，包括构造方法模式。嵌套的构造方法模式会进一步展开匹配。例如：

      scala> case class A(x: Int)
      defined class A

      scala> case class B(x: String, y: Int, z: A)
      defined class B

      scala> def test5(x: Any) = x match {
               |     case B("abc", e, A(10)) => e + 1
               |     case _ =>
               |  }
      test5: (x: Any)AnyVal

  其中，“abc”是常量模式，只能匹配字符串“abc”；e是变量模式，绑定B的第二个构造参数，然后在表达式里加1并返回；A(10)是构造方法模式，B的第三个参数必须是以10为参数构造的A的对象。例如：

      scala> val a = B("abc", 1, A(10))
      a: B = B(abc,1,A(10))

      scala> val b = B("abc", 1, A(1))
      b: B = B(abc,1,A(1))

      scala> test5(a)
      res0: AnyVal = 2

      scala> test5(b)
      res1: AnyVal = ()

     Ⅴ、序列模式

  序列类型也可以用于模式匹配，比如List或Array。下划线“_”或变量模式可以指出不关心的元素。把“_*”放在最后可以匹配任意元素个数。例如：

      scala> def test6(x: Any) = x match {
               |     case Array(1, _*) => "OK!"
               |     case _ => "Oops!"
               |  }
      test6: (x: Any)String

      scala> test6(Array(1, 2, 3))
      res0: String = OK!

      scala> test6(1)
      res1: String = Oops!

     Ⅵ、元组模式

  元组也可以用于模式匹配，在圆括号里可以包含任意模式。形如(a, b, c)的模式可以匹配任意的三元组，注意里面是三个变量模式，不是三个字母常量。例如：

      scala> def test7(x: Any) = x match {
               |     case (1, e, "OK") => "OK, e = " + e
               |     case _ => "Oops!"
               |  }
      test7: (x: Any)String

      scala> test7(1, 10, "OK")
      res0: String = OK, e = 10

     Ⅶ、带类型的模式

  模式定义时，也可以声明具体的数据类型。用带类型的模式可以代替类型测试和类型转换。例如：

      scala> def test8(x: Any) = x match {
               |     case s: String => s.length
               |     case m: Map[_, _] => m.size
               |     case _ => -1
               |  }
      test8: (x: Any)Int

  其中，带类型的变量模式“s: String”将匹配每个非空的String实例，而“m: Map[_, _]”将匹配任意映射实例。注意，入参x的类型是Any，而s的类型是String，所以表达式里可以写s.length而不能写x.length，因为Any类没有叫length的成员。m.size同理。

  在带类型的模式中，虽然可以像上个例子那样指明对象类型为笼统的映射“Map[_, _]”，但是无法更进一步指明映射的键-值分别是什么类型。前面曾说过，这是因为Scala采用了擦除式的泛型，即运行时并不会保留类型参数的信息，所以程序在运行时无法判断某个映射的键-值具体是哪两种类型。唯一例外的是数组，因为数组的元素类型跟数组保存在一起。
     Ⅷ、变量绑定

  除了变量模式可以使用变量外，还可以对任何其他模式添加变量，构成变量绑定模式。其形式为“变量名 @ 模式”。变量绑定模式执行模式匹配的规则与原本模式一样，但是在匹配成功后会把输入对象的相应部分与添加的变量进行绑定，通过该变量就能在表达式中进行额外的操作。例如下面为一个常量模式绑定了变量e：

      scala> def test9(x: Any) = x match {
               |     case (1, 2, e @ 3) => e
               |     case _ => 0
               |  }
      test9: (x: Any)Int

      scala> test9(1, 2, 3)
      res0: Int = 3

  四、模式守卫

  模式守卫出现在模式之后，是一条用if开头的语句。模式守卫可以是任意的布尔表达式，通常会引用到模式中的变量。如果存在模式守卫，那么必须模式守卫返回true，模式匹配才算成功。

  Scala要求模式都是线性的，即一个模式内的两个变量不能同名。如果想指定模式的两个部分要相同，不是定义两个同名的变量，而是通过模式守卫来解决。例如：

      case i: Int if i > 0 => ???                   // 只匹配正整数

      case s: String if s(0) == 'a' => ???   // 只匹配以字母'a'开头的字符串

      case (x, y) if x == y => ???               // 只匹配两个元素相等的二元组

  五、密封类

  如果在“class”前面加上关键字“sealed”，那么这个类就称为密封类。密封类只能在同一个文件中定义子类，不能在文件之外被别的类继承。这有助于编译器检查模式匹配的完整性，因为这样确保了不会有新的模式随意出现，而只需要关心本文件内已有的样例类。所以，要使用模式匹配，最好把最顶层的基类做成密封类。

  对继承自密封类的样例类做匹配，编译器会用警告信息标示出缺失的组合。如果确实不需要覆盖所有组合，又不想用通配模式来避免编译器发出警告，可以在选择器后面添加“@unchecked”注解，这样编译器对后续模式分支的覆盖完整性检查就会被压制。例如：

       scala> sealed abstract class Expr
      defined class Expr

      scala> case class Var(name: String) extends Expr
      defined class Var

      scala> case class Number(num: Double) extends Expr
      defined class Number

      scala> case class UnOp(operator: String, arg: Expr) extends Expr
      defined class UnOp

      scala> case class BinOp(operator: String, left: Expr, right: Expr) extends Expr
      defined class BinOp

      scala> def describe(e: Expr): String = e match {
               |     case Number(_) => "a number"
               |     case Var(_) => "a variable"
               |  }
      <console>:16: warning: match may not be exhaustive.
      It would fail on the following inputs: BinOp(_, _, _), UnOp(_, _)
             def describe(e: Expr): String = e match {
                                             ^
      describe: (e: Expr)String

      scala> def describe(e: Expr): String = e match {
               |     case Number(_) => "a number"
               |     case Var(_) => "a variable"
               |     case _ => throw new RuntimeException  // Should not happen
               |  }
      describe: (e: Expr)String

      scala> def describe(e: Expr): String = (e: @unchecked) match {
               |     case Number(_) => "a number"
               |     case Var(_) => "a variable"
               |  }
      describe: (e: Expr)String

  有关注解的内容，本教程不会讲解。需要深入了解的读者，请自行查阅资料。Chisel源码使用了注解。
  六、可选值

  从上面很多例子中，我们发现两个问题：一是每条case分支可能返回不同类型的值，导致函数的返回值或变量的类型不好确定，该如何把它们统一起来？二是通配模式下，常常不需要返回一个值，但什么都不写又不太好。要解决这两个问题，Scala提供了一个新的语法——可选值。

  可选值就是类型为Option[T]的一个值。其中，Option是标准库里的一个密封抽象类。T可以是任意的类型，例如标准类型或自定义的类。并且T是协变的，简单来说，就是如果类型T是类型U的超类，那么Option[T]也是Option[U]的超类。

  Option类有一个子类：Some类。通过“Some(x)”可以构造一个Some的对象，其中参数x是一个具体的值。根据x的类型，可选值的类型会发生改变。例如，Some(10)的类型是Option[Int]，Some("10")的类型是Option[String]。由于Some对象需要一个具体的参数值，所以这部分可选值用于表示“有值”。

  Option类还有一个子对象：None。它的类型是Option[Nothing]，是所有Option[T]类型的子类，代表“无值”。也就是说，Option类型代表要么是一个具体的值，要么无值。Some(x)常作为case语句的返回值，而None常作为通配模式的返回值。需要注意的是，Option[T]和T是两个完全没有关系的类型，赋值时不要混淆。

  如果没有可选值语法，要表示“无值”可能会选用null，这就必须对变量进行判空操作。在Java里，判空是一个运行时的动作，如果忘记判空，编译时并不会报错，但是在运行时可能会抛出空指针异常，进而引发严重的错误。有了可选值之后，首先从字面上提醒读者这是一个可选值，存在无值和有值两种情况；其次，最重要的是，由于Option[T]类型与T类型不一样，赋值时就可能需要先做相应的类型转换。类型转换最常见的方式就是模式匹配，在这期间可以把无值None过滤掉。如果不进行类型转换，编译器就会抛出类型错误，这样在编译期就进行判空处理进而防止运行时出现更严重的问题。

  可选值提供了一个方法isDefined，如果调用对象是None，则返回false，而Some对象都会返回true。还有一个方法get，用于把Some(x)中的x返回，如果调用对象是None则报错。
  七、模式匹配的另类用法

  对于提取器(这里不用关心提取器是什么)，可以通过“val/var 对象名(模式) = 值”的方式来使用模式匹配，常常用于定义变量。这里的“对象名”是指提取器，即某个单例对象，列表、数组、映射、元组等常用集合的伴生对象都是提取器。例如：

      scala> val Array(x, y, _*) = Array(-1, 1, 233)
      x: Int = -1
      y: Int = 1

      scala> val a :: 10 :: _ = List(999, 10)
      a: Int = 999

      scala> val capitals = Map("China" -> "Beijing", "America" -> "Washington", "Britain" -> "London")
      capitals: scala.collection.immutable.Map[String,String] = Map(China -> Beijing, America -> Washington, Britain -> London)

      scala> for((country, city) <- capitals)
               |    println("The capital of " + country + " is " + city)
      The capital of China is Beijing
      The capital of America is Washington
      The capital of Britain is London

  八、偏函数

  前面说过，在Scala里，万物皆对象。函数是一等值，与整数、浮点数、字符串等等相同，所以函数也是一种对象。既然函数也是一个对象，那么必然属于某一种类型。为了标记函数的类型，Scala提供了一系列特质：Function0、Function1、Function2……Function22来表示参数为0、1、2……22个的函数。与元组很像，因此函数的参数最多只能有22个。当然也可以自定义含有更多参数的FunctionX，但是Scala标准库没有提供，也没有必要。

  除此之外，还有一个特殊的函数特质：偏函数PartialFunction。偏函数的作用在于划分一个输入参数的可行域，在可行域内对入参执行一种操作，在可行域之外对入参执行其他操作。偏函数有两个抽象方法需要实现：apply和isDefinedAt。其中，isDefinedAt用于判断入参是否在可行域内，是的话就返回true，否则返回false；apply是偏函数的函数体，用于对入参执行操作。使用偏函数之前，应该先用isDefinedAt判断入参是否合法，否则可能会出现异常。

  定义偏函数的一种简便方法就是使用case语句组。广义上讲，case语句就是一个偏函数，所以才可以用于模式匹配。一个case语句就是函数的一个入口，多个case语句就有多个入口，每个case语句又可以有自己的参数列表和函数体。例如：

      val isInt1: PartialFunction[Any, String] = {
        case x: Int => x + " is a Int."
      }
      // 相当于
      val isInt2 = new PartialFunction[Any, String] {
        def apply(x: Any) = x.asInstanceOf[Int] + " is a Int."
        def isDefinedAt(x: Any) = x.isInstanceOf[Int]
      }

  注意apply方法可以隐式调用。x.isInstanceOf[T]判断x是不是T类型(及其超类)的对象，是的话就返回true。x.asInstanceOf[T]则把x转换成T类型的对象，如果不能转换则会报错。

  偏函数PartialFunction[Any, Any]是Function1[Any, Any]的子特质，因为case语句只有一个参数。[Any, Any]中的第一个Any是输入参数的类型，第二个Any是返回结果的类型。如果确实需要输入多个参数，则可以用元组、列表或数组等把多个参数变成一个集合。

  在用case语句定义偏函数时，前述的各种模式类型、模式守卫都可以使用。最后的通配模式可有可无，但是没有时，要保证运行不会出错。

  上述代码运行如下：

      scala> isInt1(1)
      res0: String = 1 is a Int.

      scala> isInt2(1)
      res1: String = 1 is a Int.

      scala> isInt1.isDefinedAt('1')
      res2: Boolean = false

      scala> isInt2.isDefinedAt('1')
      res3: Boolean = false

      scala> isInt1('1')
      scala.MatchError: 1 (of class java.lang.Character)
        at scala.PartialFunction$ $anon$1.apply(PartialFunction.scala:255)
        at scala.PartialFunction$ $anon$1.apply(PartialFunction.scala:253)
        at $anonfun$1.applyOrElse(<console>:12)
        at scala.runtime.AbstractPartialFunction.apply(AbstractPartialFunction.scala:34)
        ... 28 elided

      scala> isInt2('1')
      java.lang.ClassCastException: java.lang.Character cannot be cast to java.lang.Integer
        at scala.runtime.BoxesRunTime.unboxToInt(BoxesRunTime.java:101)
        at $anon$1.apply(<console>:13)
        at $anon$1.apply(<console>:12)
        ... 28 elided

  九、总结

  本章介绍了功能强大的模式匹配，尽管概念比较容易理解，但是要熟练运用则比较难。最后讲解的偏函数，在Chisel里也会用到。在实际编写硬件时，模式匹配是用
  ————————————————
  版权声明：本文为CSDN博主「_iChthyosaur」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
  原文链接：https://blog.csdn.net/qq_34291505/article/details/87023284
   */

}
