object 抽象成员 extends App{
  /*
  一、抽象成员

  类可以用“abstract”修饰变成抽象的，特质天生就是抽象的，所以抽象类和特质里可以包含抽象成员，也就是没有完整定义的成员。Scala有四种抽象成员：抽象val字段、抽象var字段、抽象方法和抽象类型，它们的声明形式如下：

      trait Abstract {
        type T                          // 抽象类型
        def transform(x: T): T  // 抽象方法
        val initial: T                  // 抽象val字段
        var current: T              // 抽象var字段
      }

  因为定义不充分，存在不可初始化的字段和类型，或者没有函数体的方法，所以抽象类和特质不能直接用new构造实例。抽象成员的本意，就是让更具体的子类或子对象来实现它们。例如：

      class Concrete extends Abstract {
        type T = String
        def transform(x: String) = x + x
        val initial = "hi"
        var current = initial
      }

  抽象类型指的是用type关键字声明的一种类型——它是某个类或特质的成员但并未给出定义。虽然类和特质都定义了一种类型，并且它们可以是抽象的，但这不意味着抽象类或特质就叫抽象类型，抽象类型永远都是类和特质的成员。在使用抽象类型进行定义的地方，最后都要被解读成抽象类型的具体定义。而使用抽象类型的原因，一是给名字冗长或含义不明的类型起一个别名，二是声明子类必须实现的抽象类型。

  在不知道某个字段正确的值，但是明确地知道在当前类的每个实例中，该字段都会有一个不可变更的值时，就可以使用抽象val字段。抽象val字段与抽象无参方法类似，而且访问方式完全一样。但是，抽象val字段保证每次使用时都返回一个相同的值，而抽象方法的具体实现可能每次都返回不同的值。另外，抽象val字段只能实现成具体的val字段，不能改成var字段或无参方法；而抽象无参方法可以实现成具体的无参方法，也可以是val字段。

  抽象var字段与抽象val字段类似，但是是一个可被重新赋值的字段。与前一章讲解的具体var字段类似，抽象var字段会被编译器隐式地展开成抽象setter和抽象getter方法，但是不会在当前抽象类或特质中生成一个“private[this] var”字段。这个字段会在定义了其具体实现的子类或子对象当中生成。例如：

      trait AbstractTime {
        var hour: Int
        var minute: Int
      }
      // 相当于
      trait AbstractTime {
        def hour: Int             // hour的getter方法
        def hour_=(x: Int)    // hour的setter方法
        def minute: Int         // minute的getter方法
        def minute_=(x: Int) // minute的setter方法
      }

  二、初始化抽象val字段

  抽象val字段有时会承担超类参数的职能：它们允许程序员在子类中提供那些在超类中缺失的细节。这对特质尤其重要，因为特质没有构造方法，参数化通常都是通过子类实现抽象val字段来完成。例如：

      trait RationalTrait {
        val numerArg: Int
        val denomArg: Int
      }

  要在具体的类中混入这个特质，就必须实现它的两个抽象val字段。例如：

      new RationalTrait {
          val numerArg = 1
          val denomArg = 2
      }

  注意，前面说过，这不是直接实例化特质，而是隐式地用一个匿名类混入了该特质，并且花括号里的内容属于隐式的匿名类。

  构造子类的实例对象时，首先构造超类/超特质的组件，然后才轮到子类的剩余组件。因为花括号里的内容不属于超类/超特质，所以在构造超类/超特质的组件时，花括号里的内容其实是无用的。并且在这个过程中，如果需要访问超类/超特质的抽象val字段，会交出相应类型的默认值(比如Int类型的默认值是0)，而不是花括号里的定义。只有轮到构造子类的剩余组件时，花括号里的子类定义才会派上用场。所以，在构造超类/超特质的组件时，尤其是特质还不能接收子类的参数，如果默认值不满足某些要求，构造就会出错。例如：

      scala> trait RationalTrait {
               |    val numerArg: Int
               |    val denomArg: Int
               |    require(denomArg != 0)
               |  }
      defined trait RationalTrait

      scala> new RationalTrait {
               |      val numerArg = 1
               |      val denomArg = 2
               |  }
      java.lang.IllegalArgumentException: requirement failed
        at scala.Predef$.require(Predef.scala:264)
        at RationalTrait.$init$(<console>:14)
        ... 32 elided

  在这个例子中，require函数会在参数为false时报错。该特质是用默认值0去初始化两个抽象字段的，花括号里的定义只有等超特质构造完成才有用，所以require函数无法通过。为此，Scala提供了两种方法解决这种问题。
     Ⅰ、预初始化字段

  如果能让花括号里的代码在最开始执行，那么就能避免该问题，这个方法被称作“预初始化字段”。其形式为：

      new { 定义 } with 超类/超特质

  例如：

      scala> new {
               |      val numerArg = 1
               |      val denomArg = 2
               |  } with RationalTrait
      res0: RationalTrait = $anon$1@1a01ffff

  除了匿名类可以这样使用，单例对象或具名子类也可以，其形式是把花括号里的代码与单例对象名或类名用extends隔开，最后用with连接想要继承的类或混入的特质。例如：

      scala> class RationalClass(n: Int, d: Int) extends RationalTrait {
               |    val numerArg = n
               |    val denomArg = d
               |  }
      defined class RationalClass

      scala> new RationalClass(1, 2)
      java.lang.IllegalArgumentException: requirement failed
        at scala.Predef$.require(Predef.scala:264)
        at RationalTrait.$init$(<console>:14)
        ... 29 elided

      scala> class RationalClass(n: Int, d: Int) extends {
               |    val numerArg = n
               |    val denomArg = d
               |  } with RationalTrait
      defined class RationalClass

      scala> new RationalClass(1, 2)
      res1: RationalClass = RationalClass@6f26e775

  这个语法有一个瑕疵，就是由于预初始化字段发生得比构造超类/超特质更早，导致预初始化字段时实例对象其实还未被构造，所以花括号里的代码不能通过“this”来引用正在构造的对象本身。如果代码里出现了this，那么这个引用将指向包含当前被构造的类或对象的对象，而不是被构造的对象本身。例如：

      scala> new {
               |      val numerArg = 1
               |      val denomArg = this.numerArg * 2
               |  } with RationalTrait
      <console>:15: error: value numerArg is not a member of object $iw
               val denomArg = this.numerArg * 2
                                   ^

  这个代码无法通过编译，因为this指向了包含用new构造的对象的那个对象，在本例中是名为“$iw”的合成对象，该合成对象是Scala的编译器用于存放用户输入的代码的地方。由于$iw没有叫numerArg的成员，所以编译器产生了错误。
     Ⅱ、惰性的val字段

  预初始化字段是人为地调整初始化顺序，而把val字段定义成惰性的，则可以让程序自己确定初始化顺序。如果在val字段前面加上关键字“lazy”，那么该字段只有首次被使用时才会进行初始化。如果是用表达式进行初始化，那就对表达式求值并保存，后续使用字段时都是复用保存的结果而不是每次都求值表达式。例如：

      scala> trait LazyRationalTrait {
               |    val numerArg: Int
               |    val denomArg: Int
               |    lazy val numer = numerArg / g
               |    lazy val denom = denomArg / g
               |    override def toString = numer + "/" + denom
               |    private lazy val g = {
               |       require(denomArg != 0)
               |       gcd(numerArg, denomArg)
               |    }
               |    private def gcd(a: Int, b: Int): Int =
               |       if (b == 0) a else gcd(b, a % b)
               |  }
      defined trait LazyRationalTrait

      scala> val x = 2
      x: Int = 2

      scala> new LazyRationalTrait {
               |      val numerArg = 1 * x
               |      val denomArg = 2 * x
               |  }
      res0: LazyRationalTrait = 1/2

  首先仍然是先构造超特质的组件，但是需要初始化的非抽象字段都被lazy修饰，所以没有执行任何操作。并且由于require函数在字段g内部，而g没有初始化，所以不会出错。然后开始构造子类的组件，先对1 * x和2 * x两个表达式进行求值，得到2和4后把两个抽象字段初始化了。最后，解释器需要调用toString方法进行信息输出，该方法要访问numer，此时才对numer右侧的初始化表达式进行求值，且numerArg已经初始化为2；在numer初始化时要访问g，所以才对g进行初始化，但denomArg已满足require的要求，求得g为2并保存；等到toString方法要访问denom时，才初始化denom，并且g不用再次求值。至此，对象构造完成。
  三、抽象类型

  假设要编写一个Food类，用各种子类来表示各种食物。要编写一个抽象的Animal类，有一个eat方法，接收Food类型的参数。那么可能会写成如下形式：

      scala> class Food
      defined class Food

      scala> abstract class Animal {
               |     def eat(food: Food)
               |  }
      defined class Animal

   如果用不同的Animal子类来代表不同的动物，并且食物类型也会根据动物的习性发生改变。比如定义一头吃草的牛，那么可能定义如下：

      scala> class Grass extends Food
      defined class Grass

      scala> class Cow extends Animal {
               |    override def eat(food: Grass) = {}
               |  }
      <console>:13: error: class Cow needs to be abstract, since method eat in class Animal of type (food: Food)Unit is not defined
      (Note that Food does not match Grass: class Grass is a subclass of class Food, but method parameter types must match exactly.)
             class Cow extends Animal {
                   ^
      <console>:14: error: method eat overrides nothing.
      Note: the super classes of class Cow contain the following, non final members named eat:
      def eat(food: Food): Unit
             override def eat(food: Grass) = {}
                          ^

  奇怪的是，编译器并不允许这么做。问题出在“override def eat(food: Grass) = {}”这句代码并不会被编译。实现超类的抽象方法其实相当于重写，但是重写要保证参数列表完全一致，否则就是函数重载。在这里，超类的方法eat的参数类型是Food，但是子类的版本改成了Grass。Scala的编译器执行严格的类型检查，尽管Grass是Food的子类，但是出现在函数的参数类型上，并不能简单地套用子类型多态，就认为Grass等效于Food。所以，错误信息显示Cow类一是没有实现Animal类的抽象eat方法，二是Cow类的eat方法并未重写任何东西。

  如果有读者认为这种规则过于严厉，应该放松，那么就会出现如下不符合常识的情况：

      class Fish extends Food

      val bessy: Animal = new Cow

      bessy eat (new Fish)

  假设编译器放开对eat方法的参数类型的限制，使得任何Food类型都能通过编译，那么Fish类作为Food的子类，也就能被Cow类的eat方法所接受。但是，给一头牛喂鱼，而不是吃草，显然与事实不符。

  要达到上述目的，就需要更精确的编程模型。一种办法就是借助抽象类型及上界，例如：

      scala> class Food
      defined class Food

      scala> abstract class Animal {
               |     type SuitableFood <: Food
               |     def eat(food: SuitableFood)
               |  }
      defined class Animal

  在这里，引入了一个抽象类型。由于方法eat的参数设定为抽象类型，在编译时会被解读成具体的SuitableFood实现，所以不同的Animal子类可以通过更改具体的SuitableFood来达到改变食物类型的目的，并且这符合严格的规则检查。其次，上界保证了在子类实现SuitableFood时，必须是Food的某个子类，即不会喂给动物吃非食物类的东西。此时的Cow类如下所示：

      scala> class Grass extends Food
      defined class Grass

      scala> class Cow extends Animal {
               |    type SuitableFood = Grass
               |    override def eat(food: Grass) = {}
               |  }
      defined class Cow

  如果现在给吃草的牛喂一条鱼，那么就会发生类型错误：

      scala> class Fish extends Food
      defined class Fish

      scala> val bessy: Animal = new Cow
      bessy: Animal = Cow@2442f36d

      scala> bessy eat (new Fish)
      <console>:14: error: type mismatch;
       found   : Fish
       required: bessy.SuitableFood
             bessy eat (new Fish)
                        ^

  四、路径依赖类型

  在前面给牛喂鱼的例子中，可以发现错误信息里有一个有趣的现象：方法eat要求的参数类型是bessy.SuitableFood。关于类型“bessy.SuitableFood”，比普通的类型描述多了一个对象。这说明类型可以是对象的成员，bessy.SuitableFood表示SuitableFood是由bessy引用的对象的成员，或者说bessy引用对象的专属食物。像这样的类型称为路径依赖类型，尽管最后的类型是相同的，但若是前面的路径不同，那就是不同的类型。“路径”就是指对象的引用，它可以是单名，也可以是更长的路径。

  比如，狗吃狗粮，一条狗能吃另一条狗的狗粮，但牛怎么都不能吃狗粮：

      scala> class DogFood extends Food
      defined class DogFood

      scala> class Dog extends Animal {
               |    type SuitableFood = DogFood
               |    override def eat(food: DogFood) = {}
               |  }
      defined class Dog

      scala> val lassie = new Dog
      lassie: Dog = Dog@2655ad3b

      scala> val bessy = new Cow
      bessy: Cow = Cow@663e2cfd

      scala> lassie eat (new bessy.SuitableFood)
      <console>:14: error: type mismatch;
       found   : Grass
       required: DogFood
             lassie eat (new bessy.SuitableFood)
                         ^

      scala> val bootsie = new Dog
      bootsie: Dog = Dog@456454e0

      scala> lassie eat (new bootsie.SuitableFood)

      scala>

  因为bessy.SuitableFood和lassie.SuitableFood的路径不同，所以它们是不同的类型。而lassie.SuitableFood和bootsie.SuitableFood尽管有不同的路径，似乎是不同的类型，但其实这两个都是实际类型DogFood的别名，所以实质上是同一个类型。

  Scala的“路径依赖类型”很像Java的“内部类类型”，但是两者有重要区别：路径依赖类型的路径表明了外部类的对象，而内部类类型仅表明了外部类。

  Scala也可以表示Java的内部类，但是语法稍有不同。Scala定义一个内部类只需这样写：

      class Outer {
        class Inner
      }

  内部类Inner可以通过“Outer#Inner”来寻址，而不是Java的“Outer.Inner”，因为Scala把句点符号作为对象访问成员的专属符号，而类访问成员则是通过井号。比如有如下两个对象：

      val o1 = new Outer
      val o2 = new Outer

  那么，o1.Inner和o2.Inner就是两个路径依赖类型，并且是两个不同的类型。这两个路径依赖类型都是Outer#Inner的子类型，因为Outer#Inner其实是用任意的Outer对象来表示Inner类型。相比之下，o1.Inner是通过一个被o1引用的具体对象来表示的类型。o2.Inner也是如此。

  与Java一样，Scala的内部类的实例持有包含它的外部类的实例的引用，这使得内部类可以访问包含它的外部类的成员。也正因此，在没有给出某个外部类的具体实例时，不能直接实例化内部类，因为光有内部类实例，没有相应的外部类实例，就无法访问外部类实例的成员。有两种途径实例化内部类：一是在外部类的花括号内部通过“this.Inner”来实例化，让this引用正在构造的外部类实例；二是给出具体的外部类实例，比如o1.Inner，就可以通过“new o1.Inner”来实例化。例如：

      scala> val i1 = new o1.Inner
      i1: o1.Inner = Outer$Inner@5464a18

   Outer#Inner是不能直接实例化的，因为没有具体的外部类实例：

      scala> val i2 = new Outer#Inner
      <console>:12: error: Outer is not a legal prefix for a constructor
             val i2 = new Outer#Inner
                                ^

  五、细化类型

  当一个类继承自另一个类时，就称前者是后者的名义子类型。Scala还有一个结构子类型，表示两个类型只是有某些兼容的成员，而不是常规的那样继承来的关系。结构子类型通过细化类型来表示。

  比如，要做一个食草动物的集合。一种方法是定义一个食草的特质，让所有的食草动物类都混入该特质。但是这样会让食草动物与最基本的动物的关系不那么紧密。如果按前面定义食草牛那样继承自Animal类，那么食草动物集合的元素类型就可以表示为Animal类型，但这样又可能把食肉动物或杂食动物也包含进集合。此时，就可以使用结构子类型，其形式如下：

      Animal { type SuitableFood = Grass }

  最前面是基类Animal的声明，花括号里是想要兼容的成员。这个成员声明得比基类Animal更具体、更精细，表示食物类型必须是草。当然，并不一定要更加具体。那么，用这样一个类型指明集合元素得类型，就可以只包含食草动物了：

      val animals: List[Animal { type SuitableFood = Grass }] = ???

  六、Scala的枚举

  Scala没有特定的语法表示枚举，而是在标准类库中提供一个枚举类——scala.Enumeration。通过创建一个继承自这个类的子对象可以创建枚举。例如：

      scala> object Color extends Enumeration {
               |     val Red, Green, Blue = Value
               |  }
      defined object Color

  对象Color和普通的单例对象一样，可以通过“Color.Red”这样的方式来访问成员，或者先用“import Color._”导入。

  Enumeration类定义了一个名为Value的内部类，以及同名的无参方法。该方法每次都返回内部类Value的全新实例，也就是说，枚举对象Color的三个枚举值都分别引用了一个Value类型的实例对象。并且，因为Value是内部类，所以它的对象的具体类型还与外部类的实例对象有关。在这里，外部类的对象就是自定义的Color，所以三个枚举值引用的对象的真正类型应该是Color.Value。

  假如还有别的枚举对象，例如：

      scala> object Direction extends Enumeration {
               |     val North, East, South, West = Value
               |  }
      defined object Direction

  根据路径依赖类型的规则，Color.Value和Direction.Value是两个不同类型，所以两个枚举对象分别创造了两种不同类型的枚举值。

  方法Value有一个重载的版本，可以接收一个字符串参数来给枚举值关联特定的名称。例如：

      scala> object Direction extends Enumeration {
               |     val North = Value("N")
               |     val East = Value("E")
               |     val South = Value("S")
               |     val West = Value("W")
               |  }
      defined object Direction

  方法values返回枚举值的名称的集合。优先给出特定名称，否则就给字段名称。例如：

       scala> Color.values
      res0: Color.ValueSet = Color.ValueSet(Red, Green, Blue)

      scala> Direction.values
      res1: Direction.ValueSet = Direction.ValueSet(N, E, S, W)

  枚举值从0开始编号。内部类Value有一个方法id返回相应的编号，也可以通过“对象名(编号)”来返回相应的枚举值的名称。例如：

      scala> Color.Red.id
      res2: Int = 0

      scala> Color(2)
      res3: Color.Value = Blue

      scala> Color(3)
      java.util.NoSuchElementException: key not found: 3
        at scala.collection.MapLike.default(MapLike.scala:231)
        at scala.collection.MapLike.default$(MapLike.scala:230)
        at scala.collection.AbstractMap.default(Map.scala:59)
        at scala.collection.mutable.HashMap.apply(HashMap.scala:65)
        at scala.Enumeration.apply(Enumeration.scala:142)
        ... 28 elided

      scala> Direction.North.id
      res4: Int = 0

      scala> Direction(0)
      res5: Direction.Value = N

  七、总结

  对于本章内容不感兴趣或理解不深的读者，完全可以跳过，因为这些内容也仅仅是帮助理解Chisel标准库的工作机制。实际的电路不可能会有这样的抽象成员。
  ————————————————
  版权声明：本文为CSDN博主「_iChthyosaur」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
  原文链接：https://blog.csdn.net/qq_34291505/article/details/87202014
   */

}
