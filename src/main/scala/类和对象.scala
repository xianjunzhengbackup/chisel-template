object 类和对象 extends App{
  /*
  一、类

  前面两章介绍了Scala的变量和函数，那么就可以开始学习Scala里关于面向对象的内容。

  在Scala里，类是用关键字“class”开头的代码定义。它是对象的蓝图，一旦定义完成，就可以通过“new 类名”的方式来构造一个对象。而这个对象的类型，就是这个类。换句话说，一个类就是一个类型，不同的类就是不同的类型。在后续的章节中，会讲到类的继承关系，以及超类、子类和子类型多态的概念。

  在类里可以定义val或var类型的变量，它们被称为“字段”；还可以定义“def”函数，它们被称为“方法”；字段和方法统称“成员”。字段通常用于保存对象的状态或数据，而方法则用于承担对象的计算任务。字段也叫“实例变量”，因为每个被构造出来的对象都有其自己的字段。在运行时，操作系统会为每个对象分配一定的内存空间，用于保存对象的字段。方法则不同，对所有对象来说，方法都是一样的程序段，因此不需要为某个对象单独保存其方法。而且，方法的代码只有在被调用时才会被执行，如果一个对象在生命周期内都没有调用某些方法，那么完全没必要浪费内存为某个对象去保存这些无用的代码。

  外部想要访问对象的成员时，可以使用句点符号“ . ”，通过“对象.成员”的形式来访问。此外，用new构造出来的对象可以赋给变量，让变量名成为该对象的一个指代名称。需要注意的是，val类型的变量只能与初始化时的对象绑定，不能再被赋予新的对象。一旦对象与变量绑定了，便可以通过“变量名.成员”的方式来多次访问对象的成员。例如：

      scala> class Students {
               |    var name = "None"
               |    def register(n: String) = name = n
               |  }
      defined class Students

      scala> val stu = new Students
      stu: Students = Students@1a2e563e

      scala> stu.name
      res0: String = None

      scala> stu.register("Bob")

      scala> stu.name
      res2: String = Bob

      scala> stu = new Students
      <console>:13: error: reassignment to val
             stu = new Students
                 ^

  与Java和C++等语言不同的是，Scala的类成员默认都是公有的，即可以通过“对象.成员”的方式来访问对象的成员，而且没有“public”这个关键字。如果不想某个成员被外部访问，则可以在前面加上关键字“private”来修饰，这样该成员只能被类内部的其他成员访问，外部只能通过其他公有成员来间接访问。例如：

      scala> class Students {
               |    private var name = "None"
               |    def register(n: String) = name = n
               |    def display() = println(name)
               |  }
      defined class Students

      scala> val stu = new Students
      stu: Students = Students@75063bd0

      scala> stu.register("Bob")

      scala> stu.name
      <console>:13: error: variable name in class Students cannot be accessed in Students
             stu.name
                 ^

      scala> stu.display
      Bob

  二、类的构造方法
     Ⅰ、主构造方法

  在C++、Java、Python等oop语言里，类通常需要定义一个额外的构造方法。这样，要构造一个类的对象，除了需要关键字new，还需要调用构造方法。事实上，这个过程中有一些代码是完全重复的。Scala则不需要显式定义构造方法 ，而是把类内部非字段、非方法的代码都当作“主构造方法”。而且，类名后面可以定义若干个参数列表，用于接收参数，这些参数将在构造对象时用于初始化字段并传递给主构造方法使用。Scala的这种独特语法减少了一些代码量。例如：

      scala> class Students(n: String) {
               |    val name = n
               |    println("A student named " + n + " has been registered.")
               |  }
      defined class Students

      scala> val stu = new Students("Tom")
      A student named Tom has been registered.
      stu: Students = Students@5464eb28

  在这个例子中，Students类接收一个String参数n，并用n来初始化字段name。这样做，就无需像之前那样把name定义成var类型，而是使用函数式风格的val类型，而且不再需要一个register方法在构造对象时来更新name的数据。

  函数println既不是字段，也不是方法定义，所以被当成是主构造函数的一部分。在构造对象时，主构造函数被执行，因此在解释器里打印了相关信息。
     Ⅱ、辅助构造方法

  除了主构造方法，还可以定义若干个辅助构造方法。辅助构造方法都是以“def this(......)”来开头的，而且第一步行为必须是调用该类的另一个构造方法，即第一条语句必须是“this(......)”——要么是主构造方法，要么是之前的另一个辅助构造方法。这种规则的结果就是任何构造方法最终都会调用该类的主构造方法，使得主构造方法成为类的单一入口。例如：

      scala> class Students(n: String) {
               |    val name = n
               |    def this() = this("None")
               |    println("A student named " + n + " has been registered.")
               |  }
      defined class Students

      scala> val stu = new Students
      A student named None has been registered.
      stu: Students = Students@74309cd5

  在这个例子中，定义了一个辅助构造方法，该方法是无参的，其行为也仅是给主构造方法传递一个字符串“None”。在后面创建对象时，缺省了参数，这样与主构造方法的参数列表是不匹配的，但是与辅助构造方法匹配，所以stu指向的对象是用辅助构造方法构造的。

  在Java里，辅助构造方法可以调用超类的构造方法，而Scala加强了限制，只允许主构造方法调用超类的构造方法(详情见后续章节)。这种限制源于Scala为了代码简洁性与简单性做出的折衷处理。
     Ⅲ、析构函数

  因为Scala没有指针，同时使用了Java的垃圾回收器，所以不需要像C++那样定义析构函数。
     Ⅳ、私有主构造方法

  如果在类名与类的参数列表之间加上关键字“private”，那么主构造方法就是私有的，只能被内部定义访问，外部代码构造对象时就不能通过主构造方法进行，而必须使用其他公有的辅助构造方法或工厂方法(专门用于构造对象的方法)。例如：

      scala> class Students private (n: String, m: Int) {
               |    val name = n
               |    val score = m
               |    def this(n: String) = this(n, 100)
               |    println(n + "'s score is " + m)
               |  }
      defined class Students

      scala> val stu = new Students("Bill", 90)
      <console>:12: error: too many arguments (2) for constructor Students: (n: String)Students
             val stu = new Students("Bill", 90)
                                            ^

      scala> val stu = new Students("Bill")
      Bill's score is 100
      stu: Students = Students@7509b8e7

  三、重写toString方法

  细心的读者会发现，在前面构造一个Students类的对象时，Scala解释器打印了一串晦涩的信息“Students@7509b8e7”。这其实来自于Students类的toString方法，这个方法返回一个字符串，并在构造完一个对象时被自动调用，返回结果交给解释器打印。该方法是所有Scala类隐式继承来的，如果不重写这个方法，就会用默认继承的版本。默认的toString方法来自于java.lang.Object类，其行为只是简单地打印类名、一个“@”符号和一个十六进制数。如果想让解释器输出更多有用的信息，则可以自定义toString方法。不过，这个方法是继承来的，要重写它必须在前面加上关键字“override”(后续章节会讲到override的作用)。例如：

      scala> class Students(n: String) {
               |    val name = n
               |    override def toString = "A student named " + n + "."
               |  }
      defined class Students

      scala> val stu = new Students("Nancy")
      stu: Students = A student named Nancy.

  四、方法重载

  熟悉oop语言的读者一定对方法重载的概念不陌生。如果在类里定义了多个同名的方法，但是每个方法的参数(主要是参数类型)不一样，那么就称这个方法有多个不同的版本。这就叫方法重载，它是面向对象里多态属性的一种表现。这些方法虽然同名，但是它们是不同的，因为函数真正的特征标是它的参数，而不是函数名或返回类型。注意重载与前面的重写的区别，重载是一个类里有多个不同版本的同名方法，重写是子类覆盖定义了超类的某个方法。
  五、类参数

   从前面的例子可以发现，很多时候类的参数仅仅是直接赋给某些字段。Scala为了进一步简化代码，允许在类参数前加上val或var来修饰，这样就会在类的内部会生成一个与参数同名的公有字段。构造对象时，这些参数会直接复制给同名字段。除此之外，还可以加上关键字private、protected或override来表明字段的权限(关于权限修饰见后续章节)。如果参数没有任何关键字，那它就仅仅是“参数”，不是类的成员，只能用来初始化字段或给方法使用。外部不能访问这样的参数，内部也不能修改它。例如：

      scala> class Students(val name: String, var score: Int) {
               |    def exam(s: Int) = score = s
               |    override def toString = name + "'s score is " + score + "."
               |  }
      defined class Students

      scala> val stu = new Students("Tim", 90)
      stu: Students = Tim's score is 90.

      scala> stu.exam(100)

      scala> stu.score
      res0: Int = 100

  六、单例对象与伴生对象

  在Scala里，除了用new可以构造一个对象，也可以用“object”开头定义一个对象。它类似于类的定义，只不过不能像类那样有参数，也没有构造方法。因此，不能用new来实例化一个object的定义，因为它已经是一个对象了。这种对象和用new实例化出来的对象没有什么区别，只不过new实例的对象是以类为蓝本构建的，并且数量没限制，而object定义的对象只能有这一个，故而得名“单例对象”。

  如果某个单例对象和某个类同名，那么单例对象称为这个类的“伴生对象”，同样，类称为这个单例对象的“伴生类”。伴生类和伴生对象必须在同一个文件里，而且两者可以互访对方所有成员。在C++、Java等oop语言里，类内部可以定义静态变量。这些静态变量不属于任何一个用new实例化的对象，而是它们的公有部分。Scala追求纯粹的面向对象属性，即所有的事物都是类或对象，但是静态变量这种不属于类也不属于对象的事物显然违背了Scala的理念。所以，Scala的做法是把类内所有的静态变量从类里移除，转而集中定义在伴生对象里，让静态变量属于伴生对象这个独一无二的对象。

  既然单例对象和new实例的对象一样，那么类内可以定义的代码，单例对象同样可以拥有。例如，单例对象里面可以定义字段和方法。Scala允许在类里定义别的类和单例对象，所以单例对象也可以包含别的类和单例对象的定义。因此，单例对象除了用作伴生对象，通常也可以用于打包某方面功能的函数系列成为一个工具集，或者包含主函数成为程序的入口。

  “object”后面定义的单例对象名可以认为是这个单例对象的名称标签，因此可以通过句点符号访问单例对象的成员——“单例对象名.成员”，也可以赋给一个变量——“val 变量 = 单例对象名”，就像用new实例的对象那样。例如：

      scala> class A { val a = 10 }
      defined class A

      scala> val x = new A
      x: A = A@7e5831c4

      scala> x.a
      res0: Int = 10

      scala> (new A).a
      res1: Int = 10

      scala> object B { val b = "a singleton object" }
      defined object B

      scala> B.b
      res2: String = a singleton object

      scala> val y = B
      y: B.type = B$@4489b853

      scala> y.b
      res3: String = a singleton object

  前面说过，定义一个类，就是定义了一种类型。从抽象层面讲，定义单例对象却并没有定义一种类型。实际上每个单例对象有自己独特的类型，即object.type。可以认为新类型出现了，只不过这个类型并不能用来归类某个对象集合，等同于没有定义新类型。即使是伴生对象也没有定义类型，而是由伴生类定义了同名的类型。后续章节将讲到，单例对象可以继承自超类或混入特质，这样它就能出现在需要超类对象的地方。例如下面的例子中，可以明确看到X.type和Y.type两种新类型出现，并且是不一样的：

      scala> object X
      defined object X

      scala> object Y
      defined object Y

      scala> var x = X
      x: X.type = X$@630bb67

      scala> x = Y
      <console>:17: error: type mismatch;
       found   : Y.type
       required: X.type
             x = Y
                 ^

  七、工厂对象与工厂方法

  如果定义一个方法专门用来构造某一个类的对象，那么这种方法就称为“工厂方法”。包含这些工厂方法集合的单例对象，也就叫“工厂对象” 。通常，工厂方法会定义在伴生对象里。尤其是当一系列类存在继承关系时，可以在基类的伴生对象里定义一系列对应的工厂方法。使用工厂方法的好处是可以不用直接使用new来实例化对象，改用方法调用，而且方法名可以是任意的，这样对外隐藏了类的实现细节。例如：

      // students.scala
      class Students(val name: String, var score: Int) {
        def exam(s: Int) = score = s
        override def toString = name + "'s score is " + score + "."
      }

      object Students {
        def registerStu(name: String, score: Int) = new Students(name, score)
      }

  将文件students.scala编译后，并在解释器里用“import Students._”导入单例对象后，就能这样使用：

      scala> import Students._
      import Students._

      scala> val stu = registerStu("Tim", 100)
      stu: Students = Tim's score is 100.

  八、apply方法

  有一个特殊的方法名——apply，如果定义了这个方法，那么既可以显式调用——“对象.apply(参数)” ，也可以隐式调用——“对象(参数)”。隐式调用时，编译器会自动插入缺失的“.apply”。如果apply是无参方法，应该写出空括号，否则无法隐式调用。无论是类还是单例对象，都能定义这样的apply方法。

  通常，在伴生对象里定义名为apply的工厂方法，就能通过“伴生对象名(参数)”来构造一个对象。也常常在类里定义一个与类相关的、具有特定行为的apply方法，让使用者可以隐式调用，进而隐藏相应的实现细节。例如：

      // students2.scala
      class Students2(val name: String, var score: Int) {
        def apply(s: Int) = score = s
        def display() = println("Current score is " + score + ".")
        override def toString = name + "'s score is " + score + "."
      }

      object Students2 {
        def apply(name: String, score: Int) = new Students2(name, score)
      }

  将文件students2.scala编译后，就能在解释器里这样使用：

      scala> val stu2 = Students2("Jack", 60)
      stu2: Students2 = Jack's score is 60.

      scala> stu2(80)

      scala> stu2.display
      Current score is 80.

  其中，“Students2("Jack", 60)”被翻译成“Students2.apply("Jack", 60)” ，也就是调用了伴生对象里的工厂方法，所以构造了一个Students2的对象并赋给变量stu2。“stu2(80)”被翻译成“stu2.apply(80)” ，也就是更新了字段score的数据。
  九、主函数

  主函数是Scala程序唯一的入口，即程序是从主函数开始运行的。要提供这样的入口，则必须在某个单例对象里定义一个名为“main”的函数，而且该函数只有一个参数，类型为字符串数组Array[String]，函数的返回类型是Unit。任何符合条件的单例对象都能成为程序的入口。例如：

      // students2.scala
      class Students2(val name: String, var score: Int) {
        def apply(s: Int) = score = s
        def display() = println("Current score is " + score + ".")
        override def toString = name + "'s score is " + score + "."
      }

      object Students2 {
        def apply(name: String, score: Int) = new Students2(name, score)
      }

      // main.scala
      object Start {
        def main(args: Array[String]) = {
          try {
            val score = args(1).toInt
            val s = Students2(args(0), score)
            println(s.toString)
          } catch {
            case ex: ArrayIndexOutOfBoundsException => println("Arguments are deficient!")
            case ex: NumberFormatException => println("Second argument must be a Int!")
          }
        }
      }

  使用命令“scalac students2.scala main.scala”将两个文件编译后，就能用命令“scala Start 参数1 参数2”来运行程序。命令里的“Start”就是包含主函数的单例对象的名字，后面可以输入若干个用空格间隔的参数。这些参数被打包成字符串数组供主函数使用，也就是代码里的args(0)、args(1)。例如：

      PS E:\Microsoft VS\Scala> scala Start Tom
      Arguments are deficient!
      PS E:\Microsoft VS\Scala> scala Start Tom aaa
      Second argument must be a Int!
      PS E:\Microsoft VS\Scala> scala Start Tom 100
      Tom's score is 100.

  主函数的一种简化写法是让单例对象混入“App”特质(特质在后续章节讲解)，这样就只要在单例对象里编写主函数的函数体。例如：

      // main2.scala
      object Start2 extends App {
        try {
          var sum = 0
          for(arg <- args) {
            sum += arg.toInt
          }
          println("sum = " + sum)
        } catch {
          case ex: NumberFormatException => println("Arguments must be Int!")
        }
      }

   将文件编译后，就可以如下使用：

      PS E:\Microsoft VS\Scala> scala Start2 10 -8 20 AAA
      Arguments must be Int!
      PS E:\Microsoft VS\Scala> scala Start2 10 -8 20 8
      sum = 30

  十、总结

  本章讲解了Scala的类和对象，从中可以初窥Scala在语法精简和便捷上的努力。难点是理解单例对象的概念、类与类型的关系和工厂方法的作用。如果读者有其他oop语言基础，在这里也并不是能一下就接受Scala的语法。最后一个重点就是学会灵活使用apply方
  ————————————————
  版权声明：本文为CSDN博主「_iChthyosaur」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
  原文链接：https://blog.csdn.net/qq_34291505/article/details/86760620
   */

}
