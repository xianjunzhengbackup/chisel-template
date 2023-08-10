object 包和导入 extends App{
  /*
  一、包

  当代码过于庞大时，为了让整个系统层次分明，各个功能部分划分明显，常常需要把整体划分成若干独立的模块。与Java一样，Scala把代码以“包”的形式划分。

  包是以关键字“package”为开头来定义的。可以用花括号把包的范围包起来，这种风格类似C++和C#的命名空间，而且这种方法使得一个文件可以包含多个不同的包。也可以不用花括号标注范围，但包的声明必须在文件最前面，这样使得整个文件的内容都属于这个包，这种风格类似Java。对于包的命名方式，推荐使用Java的反转域名法，即“com.xxx.xxx”的形式。

  在包里，可以定义class、object和trait，也可以定义别的package。如果编译一个包文件，那么会在当前路径下生成一个与包名相同的文件夹，文件夹里是包内class、object和trait编译后生成的文件，或者是包内层的包生成的更深一层文件夹。如果多个文件的顶层包的包名相同，那么编译后的文件会放在同一个文件夹内。也就是说，一个包的定义可以由多个文件的源代码组成。
  二、包的层次和精确代码访问

  因为包里还可以定义包，所以包也有层次结构。包不仅便于人们按模块阅读，同时也告诉编译器这些代码存在某些层次联系。像访问对象的成员一样，包也可以通过句点符号来按路径层次访问。如果包名中就出现了句点，那么编译器也会按层次编译。例如：

      package one.two

  等效于：

       package one

           package two

  这两种写法都会先编译出一个名为one的文件夹，然后在里面又编译出一个名为two的文件夹。如果一个包仅仅是包含了其他的包，没有额外的class、object和trait定义，那么建议写出第一种形式，这样内部代码省去了一次缩进。

  Scala的包是嵌套的，而不像Java那样只是分级的。这体现在Java访问包内的内容必须从最顶层的包开始把全部路径写齐，而Scala则可以按照一定的规则书写更简短的形式。例如：

      package bobsrockets {
        package navigation {
          class Navigator {
            // 不需要写成bobsrockets.navigation.StarMap
            val map = new StarMap
          }

          class StarMap
        }

        class Ship {
          // 不需要写成bobsrockets.navigation.Navigator
          val nav = new navigation.Navigator
        }

        package fleets {
          class Fleet {
            // 不需要写成bobsrockets.Ship
            def addShip() = { new Ship }
          }
        }
      }

  第一，访问同一个包内的class、object和trait不需要增加路径前缀。因为“new StarMap”和“class StarMap”都位于bobsrockets.navigation包内，所以这条代码能够通过编译。

  第二，访问同一个包内更深一层的包所含的class、object和trait，只需要写出那层更深的包。因为“class Ship”和“package navigation”都位于bobsrockets包内，所以要访问navigation包内的class、object和trait只需要增加“navigation.”，而不是完整的路径。

  第三，当使用花括号显式表明包的作用范围时，包外所有可访问的class、object和trait在包内也可以直接访问。因为“package fleets”位于外层包bobsrockets，所以bobsrockets包内、fleets包外的所有class、object和trait可以直接访问，故而“new Ship”不需要完整路径也能通过编译。

  以上规则在同一个文件内显式嵌套时可以生效。如果把包分散在多个文件内，并通过包名带句点来嵌套，则不会生效。例如下面的代码就不能通过编译：

      // bobsrockets.scala
      package bobsrockets {
        class Ship
      }

      // fleets.scala
      package bobsrockets.fleets {
        class Fleet {
          // 无法编译，Ship不在作用域内
          def addShip() = { new Ship }
        }
      }

  即使把这两个文件合并，也无法编译。但是当第二个文件把每个包分开声明时，上述规则又能生效。例如下面的代码是合法的：

      // bobsrockets.scala
      package bobsrockets
        class Ship

      // fleets.scala
      package bobsrockets
        package fleets
          class Fleet {
            // 可以编译
            def addShip() = { new Ship }
          }

  为了访问不同文件最顶层包的内容，Scala定义了一个隐式的顶层包“_root_”，所有自定义的包其实都包含在这个包里。例如：

      // launch.scala
      package launch {
        class Booster3
      }

      // bobsrockets.scala
      package bobsrockets {
        package navigation {
          package launch {
            class Booster1
          }

          class MissionControl {
            val booster1 = new launch.Booster1
            val booster2 = new bobsrockets.launch.Booster2
            val booster3 = new _root_.launch.Booster3
          }
        }

        package launch {
          class Booster2
        }
      }

  Booster3必须通过“_root_”才能访问，否则就和Booster1混淆，造成歧义。
  三、import导入

  如果每次都按第二点的精确访问方式来编程，则显得过于繁琐和复杂。因此，可以通过关键字“import”来导入相应的内容。

  Scala的import有三点灵活性：①可以出现在代码的任意位置，而不仅仅是开头。②除了导入包内所含的内容，还能导入对象(单例对象和new构造的对象都可以)和包自身，甚至函数的参数都能作为对象来导入。③可以重命名或隐藏某些成员。例如：

      package A {
        package B {
          class M
        }

        package C {
          object N
        }
      }

  通过语句“import A.B”就能把包B导入。当要访问M时，只需要写“B.M”而不需要完整的路径。通过“import A.B.M”和“import A.C.N”就分别导入了类M和对象N。此时访问它们只需要写M和N即可。

  路径最后的元素可以放在花括号里，这样就能导入一个或多个元素，例如通过“import A.{B, C}”就导入了两个包。花括号内的语句也叫“引入选择器子句”。如果要导入所有的元素，则使用下划线。例如“import A._”或“import A.{_}”就把包B和C都导入了。

  如果写成“import A.{B => packageB}”，就是在导入包B的同时重命名为“packageB”，此时可以用packageB指代包B，也仍能用“A.B”显式访问。如果写成“import A.{B => _, _}”，就是把包B进行隐藏，而导入A的其他元素。注意，指代其余元素的下划线通配符必须放在最后。

  包导入是相对路径，也就是代码里有“import A._”的文件要和包A编译后的文件夹要在同一级目录下。
  四、自引用

  Scala有一个关键字“this”，用于指代对象自己。简单的理解就是：如果this用在类的方法里，则指代正在调用方法的那个对象；如果用在类的构造方法里，则指代当前正在构建的对象。
  五、访问修饰符

  包、类和对象的成员都可以标上访问修饰符“private”和“protected”。用“private”修饰的成员是私有的，只能被包含它的包、类或对象的内部代码访问；用“protected”修饰的成员是受保护的，除了能被包含它的包、类或对象的内部代码访问，还能被子类访问(只有类才有子类)。例如：

      class Diet {
        private val time = "0:00"
        protected val food = "Nothing"
      }

      class Breakfast extends Diet {
        override val time = "8:00"  // error
        override val food = "Apple"  // OK
      }

  对time的重写会出错，因为私有成员只能被类Diet内部的代码访问，子类不会继承，外部也不能通过“(new Diet).time”来访问。对food的重写是允许的，因为子类可以访问受保护的成员，但是外部不能通过“(new Diet).food”来访问。

  除此之外，还可以加上限定词。假设X指代某个包、类或对象，那么private[X]和protected[X]就是在不加限定词的基础上，把访问权限扩大到X的内部。例如：

      package A {
        package B {
          private[A] class JustA
        }

        class MakeA {
          val a = new B.JustA  // OK
        }
      }

      package C {
        class Error {
          val a = new A.B.JustA  // error
        }
      }

  X还能是自引用关键字“this”。private[this]比private更严格，不仅只能由内部代码访问，还必须是调用方法的对象或构造方法正在构造的对象来访问；protected[this]则在private[this]的基础上扩展到定义时的子类。例如：

      scala> class MyInt1(x: Int) {
               |    private val mi1 = x
               |    def add(m: MyInt1) = mi1 + m.mi1
               |  }
      defined class MyInt1

      scala> class MyInt2(x: Int) {
               |    private[this] val mi2 = x
               |    def add(m: MyInt2) = mi2 + m.mi2
               |  }
      <console>:13: error: value mi2 is not a member of MyInt2
               def add(m: MyInt2) = mi2 + m.mi2
                                            ^

  MyInt1可以编译成功，但是MyInt2却不行，因为add传入的对象不是调用方法的对象，所以不能访问字段mi2，尽管这还是代码内部。换句话说，用private[this]和protected[this]修饰的成员x，只能通过“this.x”的方式来访问。

  对于类、对象和特质，不建议直接用private和protected修饰，容易造成作用域混乱，应该用带有限定词的访问修饰符来修饰，显式声明它们在包内的作用域。

  前面说过，伴生对象和伴生类共享访问权限，即两者可以互访对方的所有私有成员。在伴生对象里使用“protected”没有意义，因为伴生对象没有子类。特质使用“private”和“protected”修饰成员也没有意义。
  六、包对象

  包里可直接包含的元素有类、特质和单例对象，但其实类内可定义的元素都能放在包里，只不过字段和方法不能直接定义在包里。Scala把字段和方法放在一个“包对象”中，每个包都允许有一个包对象。包对象用关键字组合“package object”为开头来定义，其名称与关联的包名相同，有点类似伴生类与伴生对象的关系。

  包对象不是包，也不是对象，它会被编译成名为“package.class”的文件，该文件位于与它关联的包的对应文件夹里。为了保持路径同步，建议定义包对象的文件命名为“package.scala”，并和定义关联包的文件放在同一个目录下。
  七、总结

  本章讲解了包的概念，以及Scala独有的一些语法特点。这一章并不是重点，主要是方便读者在阅读别人的代码时能理解层次结构、模块划分，以及根据import的路径来快速寻找相应的
  ————————————————
  版权声明：本文为CSDN博主「_iChthyosaur」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
  原文链接：https://blog.csdn.net/qq_34291505/article/details/86777542
   */

}
