object 内建控制结构 extends App{
  /*
  对任何编程语言来说，都离不开判断、选择、循环等基本的程序控制结构。自然，Scala也实现了必需的基本控制结构，只不过这些内建控制结构的语法更贴近函数式的风格。本章内容将对这些语法逐一讲解，这些语法在Chisel里编写电路逻辑时也是经常出现的。
  一、if表达式

  用于判断的“if......else if......else”语法想必是所有编程语言都具备的。Scala的if表达式与大多数语言是一样的。在if和每个else if后面都将接收一个Boolean类型的表达式作为参数，如果表达式的结果为true，就执行对应的操作，否则跳过。每个分支都可以包含一个表达式作为执行体，如果有多个表达式，则应该放进花括号里。对整个if表达式而言，实际是算作一个表达式。例如：

      scala> def whichInt(x: Int) = {
               |    if(x == 0) "Zero"
               |    else if(x > 0) "Positive Number"
               |    else "Negative Number"
               |  }
      whichInt: (x: Int)String

      scala> whichInt(-1)
      res0: String = Negative Number

  二、while循环

  Scala的“while”语法与C语言一致，都是当判别式的结果为true时，一直执行花括号里的循环体，直到判别式为false。“do......while”也是一样的，先执行一次循环体，再来进行判别，直到判别式为false。例如要计算两个整数的最大公约数：

      def gcdLoop(x: Long, y: Long): Long = {
        var a = x
        var b = y
        while (a != 0) {
          val temp = a
          a = b % a
          b = temp
        }
        b
      }

  从上述代码可以看出，while语法的风格是指令式的。实际上，Scala把“if”叫“表达式”，是因为if表达式能返回有用的值，而“while”叫循环，是因为while循环不会返回有用的值，主要作用是不断重写某些var变量，所以while循环的类型是Unit。在纯函数式的语言里，只有表达式，不会存在像while循环这样的语法。Scala兼容两种风格，并引入了while循环，是因为某些时候用while编写的代码可阅读性更强。但其实所有的while循环都可以通过其它函数式风格的语法来实现，常见做法就是函数的自我递归调用。例如，一个函数式风格的求取最大公约数的函数定义如下：

      def gcd(x: Long, y: Long): Long =
        if (y == 0) x else gcd(y, x % y)
  gcd(10,4) => gcd(4,2)=>gcd(2,0)=>2
  三、for表达式与for循环

  要实现循环，在Scala里推荐使用for表达式。不过，Scala的for表达式是函数式风格的，没有引入指令式风格的“for(i = 0; i < N; i++)”。一个Scala的for表达式的一般形式如下：

      for( seq ) yield expression

   整个for表达式算一个语句。在这里，seq代表一个序列。换句话说，能放进for表达式里的对象，必须是一个可迭代的集合。比如常用的列表(List)、数组(Array)、映射(Map)、区间(Range)、迭代器(Iterator)、流(Stream)和所有的集(Set)，它们都混入了特质Iterable。可迭代的集合对象能生成一个迭代器，用该迭代器可以逐个交出集合中的所有元素，进而构成了for表达式所需的序列。关键字“yield”是“产生”的意思，也就是把前面序列里符合条件的元素拿出来，逐个应用到后面的“expression”，得到的所有结果按顺序产生一个新的集合对象。如果把seq展开来，其形式如下：

      for {
        p <- persons          // 一个生成器
        n = p.name            // 一个定义
        if(n startsWith "To")  // 一个过滤器
      } yield n

  seq是由“生成器”、“定义”和“过滤器”三条语句组成，以分号隔开，或者放在花括号里让编译器自动推断分号。生成器“p <- persons”的右侧就是一个可迭代的集合对象，把它的每个元素逐一拿出来与左侧的模式进行匹配(有关模式匹配请见后续章节)。如果匹配成功，那么模式里的变量就会绑定上该元素对应的部分；如果匹配失败，并不会抛出匹配错误，而是简单地丢弃该元素。在这个例子里，左侧的p是一个无需定义的变量名，它构成了变量模式，也就是简单地指向persons的每个元素。大多数情况下的for表达式的生成器都是这么简单。定义就是一个赋值语句，这里的n也是一个无需定义的变量名。定义并不常用，比如这里的定义就可有可无。过滤器则是一个if语句，只有if后面的表达式为true时，生成器的元素才会继续向后传递，否则就丢弃该元素。这个例子中，是判断persons的元素的name字段是否以“To”为开头。最后，name以“To”为开头的persons元素会应用到yield后面的表达式，在这里仅仅是保持不变，没有任何操作。总之，这个表达式的结果就是遍历集合persons的元素，按顺序找出所有name以“To”为开头的元素，然后把这些元素组成一个新的集合。例如：
*/
      class Person(val name: String)

      object Alice extends Person("Alice")
      object Tom extends Person("Tom")
      object Tony extends Person("Tony")
      object Bob extends Person("Bob")
      object Todd extends Person("Todd")

      val persons = List(Alice, Tom, Tony, Bob, Todd)

      val To = for {
        p <- persons
        n = p.name
        if(n startsWith "To")
      } yield n

      println(To)

  /*    PS E:\Microsoft VS\Scala> scala test.scala
      List(Tom, Tony, Todd)

  每个for表达式都以生成器开始。如果一个for表达式中有多个生成器，那么出现在后面的生成器比出现在前面的生成器变得更频繁，也就是指令式编程里的嵌套的for循环。例如计算乘法口诀表：

       scala> for {
                |    i <- 1 to 9
                |    j <- i to 9
                |  } yield i * j
      res0: scala.collection.immutable.IndexedSeq[Int] = Vector(1, 2, 3, 4, 5, 6, 7, 8, 9, 4, 6, 8, 10, 12, 14, 16, 18, 9, 12, 15, 18, 21, 24, 27, 16, 20, 24, 28, 32, 36, 25, 30, 35, 40, 45, 36, 42, 48, 54, 49, 56, 63, 64, 72, 81)

  每当生成器生成一个匹配的元素，后面的定义就会重新求值。这个求值是有必要的，因为定义很可能需要随生成器的值变化而变化。为了不浪费这个操作，定义应尽量用到相关生成器绑定的变量，否则就没必要使用定义。例如：

      for(x <- 1 to 1000; y = expensiveComputationNotInvolvingX) yield x * y

  不如写成：

      val y = expensiveComputationNotInvolvingX

      for(x <- 1 to 1000) yield x * y

  如果只想把每个元素应用到一个Unit类型的表达式，那么就是一个“for循环”，而不再是一个“for表达式”。关键字“yield”也可以省略。例如：

      scala> var sum = 0
      sum: Int = 0

      scala> for(x <- 1 to 100) sum += x

      scala> sum
      res0: Int = 5050

  四、用try表达式处理异常
     Ⅰ、抛出一个异常

  如果操作非法，那么JVM会自动抛出异常。当然，也可以手动抛出异常。只需要用new构造一个异常对象，并用关键字“throw”抛出即可，语法与Java一样。例如：

      scala> throw new IllegalArgumentException
      java.lang.IllegalArgumentException
        ... 28 elided

      scala> throw new RuntimeException("RuntimeError")
      java.lang.RuntimeException: RuntimeError
        ... 28 elided

     Ⅱ、try-catch

  try后面可以用花括号包含任意条代码，当这些代码产生异常时，JVM并不会立即抛出，而是被catch捕获。catch捕获异常后，按其后面的定义进行相应的处理。处理的方式一般借助偏函数，在详细了解模式匹配前，只需要了解这些语法即可。例如处理除零异常：

      scala> def intDivision(x: Int, y: Int) = {
               |     try {
               |       x / y
               |     } catch {
               |       case ex: ArithmeticException => println("The divisor is Zero!")
               |     }
               |  }
      intDivision: (x: Int, y: Int)AnyVal

      scala> intDivision(10, 0)
      The divisor is Zero!
      res0: AnyVal = ()

      scala> intDivision(10, 2)
      res1: AnyVal = 5

     Ⅲ、finally

  try表达式的完整形式是“try-catch-finally”。不管有没有异常产生，finally里的代码一定会执行。通常finally语句块都是执行一些清理工作，比如关闭文件。尽管try表达式可以返回有用值，但是最好不要在finally语句块里这么做。因为Java在显式声明“return”时，会用finally的返回值覆盖前面真正需要的返回值。为了以防万一，最好不要这样做。例如：

      scala> def a(): Int = try return 1 finally return 2
      a: ()Int

      scala> a
      res0: Int = 2

      scala> def b(): Int = try 1 finally 2
      b: ()Int

      scala> b
      res1: Int = 1

  五、match表达式

  match表达式的作用相当于“switch”，也就是把作用对象与定义的模式逐个比较，按匹配的模式执行相应的操作。在详细了解模式匹配之前，先看一个简单的例子粗浅地了解一番：

      scala> def something(x: String) = x match {
               |     case "Apple" => println("Fruit!")
               |     case "Tomato" => println("Vegetable!")
               |     case "Cola" => println("Beverage!")
               |     case _ => println("Huh?")
               |  }
      something: (x: String)Unit

      scala> something("Cola")
      Beverage!

      scala> something("Toy")
      Huh?

  六、关于continue和break

  对于指令式编程而言，循环里经常用到关键字“continue”和“break”，例如下面的Java程序：

      // Java
      int i = 0;
      boolean foundIt = false;

      while (i < args.length) {
        if (args[i].startsWith("-")) {
          i = i + 1;
          continue;
        }
        if (args[i].endsWith(".scala")) {
          foundIt = true;
          break;
        }
        i = i + 1;
      }

  实际上，这两个关键字对循环而言并不是必须的。例如可以改写成如下Scala代码：

      // bad Scala
      var i = 0
      var foundIt = false

      while (i < args.length && !foundIt) {
        if (!args(i).startsWith("-")) {
          if (args(i).endsWith(".scala"))
            foundIt = true
        }
        i = i + 1
      }

  又因为这两个关键字过于偏向指令式风格，就像“return”，所以Scala并没有引入它们。而且，Scala并不提倡使用循环，可以通过函数的递归调用达到相同的效果。一个更好的、函数式风格的Scala代码如下：

      // good Scala
      def searchFrom(i: Int): Int =
        if (i >= args.length) -1
        else if (args(i).startsWith("-")) searchFrom(i + 1)
        else if (args(i).endsWith(".scala")) i
        else searchFrom(i + 1)

      val i = searchFrom(0)

  如果实在想用，那么Scala的标准库里提供了break方法。通过“import scala.util.control.Breaks._”可以导入Breaks类，该类定义了一个名为“break”的方法。那么，在写下break的地方，就会被编译器标记为可中断。
  七、变量的作用域

  在使用控制结构的时候，尤其是有嵌套时，必然要搞清楚变量的作用范围。Scala变量作用范围很明确，边界就是花括号。例如：

      def printMultiTable() = {
        var i = 1
        // 只有i在作用域内
        while (i <= 10) {
          var j = 1
          // i和j都在作用域内
          while (j <= 10) {
            val prod = (i * j).toString
            // i、j和prod都在作用域内
            var k = prod.length
            // i、j、prod和k都在作用域内
            while (k < 4) {
              print(" ")
              k += 1
            }
            print(prod)
            j += 1
          }
          // i和j仍在作用域内；prod和k已经超出作用域
          println()
          i += 1
        }
        // i仍在作用域内；j、prod和k已经超出作用域
      }

  如果内、外作用域有同名的变量，那么内部作用域以内部变量为准，超出内部的范围以外部变量为准。例如：

      scala> def f() = {
               |     val a = 1
               |     do {
               |         val a = 10
               |         println(a)
               |     } while(false)
               |     println(a)
               |  }
      f: ()Unit

      scala> f
      10
      1

  八、总结

  本章介绍了Scala的内建控制结构，尤其是for表达式，在Chisel里面也是经常用到。对于重复逻辑、连线等，使用for表达式就很方便。尽管Verilog也有for语法，但是使用较为麻烦，而且不能像Chisel一样支持泛型。

  除此之外，Chisel也有自定义的控制结构，这些内容会在后续章节
  ————————————————
  版权声明：本文为CSDN博主「_iChthyosaur」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
  原文链接：https://blog.csdn.net/qq_34291505/article/details/86908799
   */

}
