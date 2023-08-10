object 集合 extends App{
  /*
  不管是用Scala编写软件，还是用Chisel开发硬件电路，集合都是非常有用的数据结构。Scala里常见的集合有：数组、列表、集、映射、序列、元组、数组缓冲和列表缓冲。了解这些集合的概念并熟练掌握基本使用方法，对提高工作效率大有帮助。本章的内容便是逐一讲解这些集合类，所涉内容均为基础，对编写、阅读Chisel代码有用即可。如果想深入了解集合的原理，请读者自行学习。
  一、数组

  数组是最基本的集合，实际是计算机内一片地址连续的内存空间，通过指针来访问每一个数组元素。因为数组是结构最简单的集合，所以它在访问速度上要比其它集合要更快。Scala的数组类名为Array，继承自Java。Array是一个具体的类，因此可以通过new来构造一个数组对象。数组元素的类型可以是任意的，而且不同的元素类型会导致每个元素的内存大小不一样，但是所有元素的类型必须一致。Scala编译器的泛型机制是擦除式的，在运行时并不会保留类型参数的信息。但是数组的特点使得它成为唯一的例外，因为数组的元素类型跟数组保存在一起。

  数组对象必须是定长的，也就是在构造时可以选择任意长度的数组，构造完毕后就不能再更改长度了。构造数组对象的语法如下：

      new Array[T](n)

  其中，方括号里的T表示元素的类型，它可以显式声明，也可以通过传入给构造方法的对象来自动推断。圆括号里的n代表元素个数，它必须是一个非负整数，如果n等于0则表示空数组。和Java一样，Scala的类型参数也是放在方括号里的。构造对象时，除了可以用值参数来“配置”对象，也可以用类型参数来“配置”。这其实是oop里一种重要的多态，称为全类型多态或参数多态，即通过已有的各种类型创建新的各种类型。

  数组可以用过下标来索引每个元素，和大多数语言一样，Scala的数组下标也是从0开始的。不过，有一点不同的是，其他语言的数组下标都是写在方括号里，而Scala的数组下标却是写在圆括号里。还记得“操作符即方法吗”？Scala并没有什么下标索引操作符，而是在Array类里定义了一个apply方法，该方法接收一个Int类型的参数，返回对应下标的数组元素。所以，Scala的数组下标才要写在圆括号里，这其实是让编译器隐式插入apply方法的调用，当然读者也可以显式调用。

  虽然数组是定长的，但是每个数组元素都是可变的，也就是可以对数组元素重新赋值。例如：

      scala> val intArray = new Array[Int](3)
      intArray: Array[Int] = Array(0, 0, 0)

      scala> intArray(0) = 1

      scala> intArray(1) = 2

      scala> intArray(2) = 3

      scala> intArray
      res0: Array[Int] = Array(1, 2, 3)

  除此之外，Array的伴生对象里还定义了一个apply工厂方法，因此也可以按如下方式构造数组对象：

      scala> val charArray = Array('a', 'b', 'c')
      charArray: Array[Char] = Array(a, b, c)

  二、列表

   列表是一种基于链表的数据结构，这使得列表访问头部元素很快，往头部增加新元素也是消耗定长时间，但是对尾部进行操作则需要线性化的时间，也就是列表越大时间越长。列表类名为List，这是一个抽象类，因此不能用new来构造列表对象。但是伴生对象里有一个apply工厂方法，接收若干个参数，以数组的形式转换成列表(链表)。列表也是定长的，且每个元素的类型相同、不可再重新赋值，有点像不可写入的数组。列表元素也是从下标0开始索引，下标同样写在圆括号里。例如：

      scala> val intList = List(1, 1, 10, -5)
      intList: List[Int] = List(1, 1, 10, -5)

      scala> intList(0)
      res0: Int = 1

      scala> intList(3)
      res1: Int = -5

   因为列表的数据结构特性使得在头部添加元素很快，而尾部很慢，所以列表定义了一个名为“::”的方法，在列表头部添加新元素。注意，这会构造一个新的列表对象，而不是直接修改旧列表，因为列表是不可变的。其写法如下：

      x :: xs

  其中左侧的x是一个T类型的元素，右侧的xs是一个List[T]类型的列表。这种写法符合直观表示。还记得前面说过以冒号结尾的中缀操作符，其调用对象在右侧吗？其实正是出自这里。因为x是任意类型的，如果让x成为调用对象，那么就必须在所有类型包括自定义类型里都添加方法“::”，这显然是不现实的。如果让列表xs成为调用对象，那么只需要列表类定义该方法即可。例如：

      scala> 1 :: List(2, 3)
      res0: List[Int] = List(1, 2, 3)

  还有一个名字相近的方法——:::，它用于拼接左、右两个列表，返回新的列表：

      scala> List(1, 2) ::: List(2, 1)
      res0: List[Int] = List(1, 2, 2, 1)

  List有一个子对象——Nil，它表示空列表。Nil的类型是List[Nothing]，因为List的类型参数是协变的(有关泛型请见后续章节)，而Nothing又是所有类的子类，所以List[Nothing]是所有列表的子类，即Nil兼容所有元素。既然Nil是一个空列表对象，那么它同样能调用方法“::”，通过Nil和::就能构造出一个列表，例如：

      scala> 1 :: 2 :: 3 :: Nil
      res0: List[Int] = List(1, 2, 3)

  用apply工厂方法构造其实是上述方式的等效形式。展开来解释就是：在空列表Nil的头部添加了一个元素3，构成了列表List(3)；随后，继续在头部添加元素2，构成列表List(2, 3)；最后，在头部添加元素1，得到最终的List(1, 2, 3)。

  读者可以发挥更多想象，数组与列表元素不仅可以是值类型，它们也可以是自定义的类，甚至是数组和列表本身，构成嵌套的数组与列表。此外，如果元素类型是Any，那么数组和列表也就可以包含不同类型的元素。当然，并不推荐这么做。例如：

      scala> List(Array(1, 2, 3), Array(10, 100, 100))
      res0: List[Array[Int]] = List(Array(1, 2, 3), Array(10, 100, 100))

      scala> List(1, '1', "1")
      res1: List[Any] = List(1, 1, 1)

  三、数组缓冲与列表缓冲

  因为列表往尾部添加元素很慢，所以一种可行方案是先往列表头部添加，再把列表整体翻转。

  另一种方案是使用定义在scala.collection.mutable包里的ArrayBuffer和ListBuffer。这两者并不是真正的数组和列表，而可以认为是暂存在缓冲区的数据。在数组缓冲和列表缓冲的头部、尾部都能添加、删去元素，并且耗时是固定的，只不过数组缓冲要比数组慢一些。数组和列表能使用的成员方法，在它们的缓冲类里也有定义。

  通过“ArrayBuffer/ListBuffer += value”可以往缓冲的尾部添加元素，通过“value +=: ArrayBuffer/ListBuffer”可以往缓冲的头部添加元素，但只能通过“ArrayBuffer/ListBuffer -= value”往缓冲的尾部删去第一个符合的元素。往尾部增加或删除元素时，元素数量可以不只一个。例如：

      scala> import scala.collection.mutable.{ArrayBuffer, ListBuffer}
      import scala.collection.mutable.{ArrayBuffer, ListBuffer}

      scala> val ab = new ArrayBuffer[Int]()
      ab: scala.collection.mutable.ArrayBuffer[Int] = ArrayBuffer()

      scala> ab += 10
      res0: ab.type = ArrayBuffer(10)

      scala> -10 +=: ab
      res1: ab.type = ArrayBuffer(-10, 10)

      scala> ab -= -10
      res2: ab.type = ArrayBuffer(10)

      scala> val lb = new ListBuffer[String]()
      lb: scala.collection.mutable.ListBuffer[String] = ListBuffer()

      scala> lb += ("abc", "oops", "good")
      res3: lb.type = ListBuffer(abc, oops, good)

      scala> lb -= "abc"
      res4: lb.type = ListBuffer(oops, good)

      scala> "scala" +=: lb
      res5: lb.type = ListBuffer(scala, oops, good)

  当缓冲里的元素添加完毕后，就可以通过方法“toArray”或“toList”把缓冲的数据构造成一个数组或列表对象。注意，这是构造一个新的对象，原有缓冲仍然存在。例如：

      scala> lb.toArray
      res6: Array[String] = Array(scala, oops, good)

      scala> lb.toList
      res7: List[String] = List(scala, oops, good)

      scala> lb
      res8: scala.collection.mutable.ListBuffer[String] = ListBuffer(scala, oops, good)

  四、元组

  元组也是一种常用的数据结构，它和列表一样也是不可变的。元组的特点是可以包含不同类型的对象。其字面量写法是在圆括号里编写用逗号间隔的元素。例如：

      scala> (1, "tuple", Console)
      res0: (Int, String, Console.type) = (1,tuple,scala.Console$@5fc59e43)

  上述例子构造了一个三元组，包含了一个Int对象、一个String对象和控制台对象。注意查看打印的元组类型。

  元组最常用的地方是作为函数的返回值。由于函数只有一个返回语句，但如果想返回多个表达式或对象，就可以把它们包在一个元组里返回。

  因为元组含有不同类型的对象，所以不可遍历，也就无法通过下标来索引，只能通过“_1”、“_2”......这样来访问每个元素。注意第一个元素就是“_1”，不是“_0”。例如：

      scala> val t = ("God", 'A', 2333)
      t: (String, Char, Int) = (God,A,2333)

      scala> t._1
      res0: String = God

      scala> t._2
      res1: Char = A

      scala> t._3
      res2: Int = 2333

  实际上，元组并不是一个类，而是一系列类：Tuple1、Tuple2、Tuple3......Tuple22。这些类都是具体的，因此除了通过字面量的写法构造元组，也可以显式地通过“new TupleX(元组元素)”来构造。其中，每个数字代表元组包含的元素数量，也就是说元组最多只能包含22个元素，除非自定义Tuple23、Tuple24......不过这没有意义，因为元组可以嵌套元组，并不妨碍元组包含任意数量的元素。

  进一步查看元组的API，会发现每个TupleX类里都有名为“_1”、“_2”......“_X”的字段。这正好呼应了前面访问元组元素所用的独特语法。

  一元组没有字面量，只能显式地通过“new Tuple1(元组元素)”来构造一元组，因为此时编译器不会把圆括号解释成元组。

  二元组也叫“对偶”，这在映射里会用到。

  当函数的入参数量只有一个时，那么调用时传递进去的元组字面量也可以省略圆括号。例如：

      scala> def getType(x: Any) = x.getClass
      getType: (x: Any)Class[_]

      scala> getType(1)
      res0: Class[_] = class java.lang.Integer

      scala> getType(1, 2, 3)
      res1: Class[_] = class scala.Tuple3

  五、映射

  映射是包含一系列“键-值”对的集合，键和值的类型可以是任意的，但是每个键-值对的类型必须一致。键-值对的写法是“键 -> 值”。

  实际上，映射并不是一个类，而是一个特质。所以无法用new构建映射对象，只能通过伴生对象里的apply工厂方法来构造映射类型的对象。例如：

      scala> val map = Map(1 -> "+", 2 -> "-", 3 -> "*", 4 -> "/")
      map: scala.collection.immutable.Map[Int,String] = Map(1 -> +, 2 -> -, 3 -> *, 4 -> /)

  映射的apply方法通过接收一个键作为参数，返回对应的值。例如：

      scala> map(3)
      res0: String = *

      scala> map(0)
      java.util.NoSuchElementException: key not found: 0
        at scala.collection.immutable.Map$Map4.apply(Map.scala:204)
        ... 28 elided

  表达式“object1 -> object2”实际就是一个对偶(二元组)，因此键-值对也可以写成对偶的形式。例如：

      scala> val tupleMap = Map(('a', 'A'), ('b', 'B'))
      tupleMap: scala.collection.immutable.Map[Char,Char] = Map(a -> A, b -> B)

      scala> tupleMap('a')
      res0: Char = A

  默认情况下，使用的是scala.collection.immutable包里的不可变映射。当然，也可以导入scala.collection.mutable包里的可变映射，这样就能动态地增加、删除键-值对。可变映射的名字也叫“Map”，因此要注意使用import导入可变映射时，是否把不可变映射覆盖了。
  六、集

  集和映射一样，也是一个特质，也只能通过apply工厂方法构建对象。集只能包含字面值不相同的同类型元素。当构建时传入了重复参数，那么会过滤掉多余的，只取一个。集的apply方法是测试是否包含传入的参数，返回true或false，而不是通过下标来索引元素。例如：

      scala> val set = Set(1, 1, 10, 10, 233)
      set: scala.collection.immutable.Set[Int] = Set(1, 10, 233)

      scala> set(100)
      res0: Boolean = false

      scala> set(233)
      res1: Boolean = true

   默认情况下，使用的也是不可变集，scala.collection.mutable包里也有同名的可变集。
  七、序列

  序列Seq也是一个特质，数组和列表都混入了这个特质。序列可遍历、可迭代，也就是能用从0开始的下标索引，也可用于循环。序列也是包含一组相同类型的元素，并且不可变。其构造方法也是通过apply工厂方法。

  只是因为Chisel在某些场合会用到Seq，所以介绍这个概念，但是不必深入了解。
  八、集合的常用方法

  上述集合类都定义了很多有用的成员方法，在这里介绍一二。如果想查看更多内容，建议前往官网的API网站查询。
     Ⅰ、map

  map方法接收一个无副作用的函数作为入参，对调用该方法的集合的每个元素应用入参函数，并把所得结果全部打包在一个集合里返回。例如：

      scala> Array("apple", "orange", "pear").map(_ + "s")
      res0: Array[String] = Array(apples, oranges, pears)

      scala> List(1, 2, 3).map(_ * 2)
      res1: List[Int] = List(2, 4, 6)

     Ⅱ、foreach

  foreach方法与map方法类似，不过它的入参是一个有副作用的函数。例如：

      scala> var sum = 0
      sum: Int = 0

      scala> Set(1, -2, 234).foreach(sum += _)

      scala> sum
      res0: Int = 233

     Ⅲ、zip

  zip方法把两个可迭代的集合一一对应，构成若干个对偶。如果其中一个集合比另一个长，则忽略多余的元素。例如：

      scala> List(1, 2, 3) zip Array('1', '2', '3')
      res0: List[(Int, Char)] = List((1,1), (2,2), (3,3))

      scala> List(1, 2, 3) zip Set("good", "OK")
      res1: List[(Int, String)] = List((1,good), (2,OK))

  九、总结

  本章介绍了Scala标准库里的常用集合，这些数据结构在Chisel里面也经常用到，读者应该熟悉掌握它们的概念和相关重点。在后一章内建控制结构中，也要用到这些
  ————————————————
  版权声明：本文为CSDN博主「_iChthyosaur」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
  原文链接：https://blog.csdn.net/qq_34291505/article/details/86832500
   */

}
