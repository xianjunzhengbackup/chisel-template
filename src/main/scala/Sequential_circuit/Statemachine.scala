package Sequential_circuit

object Statemachine extends App{
  /*
  In the previous section, we created a stopwatch using a register that holds the
  state of running and stop of time measurement. The stopwatch changes the
  value (state) of Bool's register in response to an event of pressing the start /
  stop button.
  With more registers and more bits, the circuit can change its behavior in
  response to different events. A circuit that changes state and behavior
  depending on the type of event is called a state machine. In actual digital
  circuits, the number of states is finite, so it may be called FSM (Finite State
  Machine). One of the most complex of state machines is the CPU.
  It's hard to make a CPU, so let's create a kitchen timer as a slightly more
  complex state machine in this section.
  Specifications of kitchen timer
  First, assign the timer button to the button on the FPGA board as shown
  below:
  KitchenTimerButton
  The specifications of the timer are as follows:
  At the time of startup, it is in the state of time setting.
  In the state of time setting, when the [minutes] and [seconds] buttons are
  pressed, the setting time is increased by one minute and one second,
  respectively.
  Start counting down with the [Start / Stop] button.
  Count down. When the time reaches 0, count down is completed.
  When the count down is complete, flash the LED.
  When the count down is complete, press the [Start / Stop] button to enter
  the time setting mode.
  If [Start / Stop] is pressed during count down, pause the count down.
  If [Start / Stop] is pressed during pause, counting down resumes.
  When the [minutes] and [seconds] buttons are pressed during pause, the
  set time is increased by 1 minute and 1 second, respectively.
  UML state diagram
  Let's read and understand the specifications in the previous section and draw
  a UML state diagram.
  First, there are four states: "Time setting", "Counting down", "Pause", and
  "Countdown complete".
  State transition occurs by the following two events.
  The first is the following transition by pressing the Start / Stop button.
  [Time setting]-> [Counting down]; However, a time of 1 second or more
  is set.
  [Counting down]-> [Pause]
  [Countdown complete]-> [Time setting]
  The second is the following transition due to the time becoming zero.
  [Counting down]-> [Countdown complete]
  The minutes and seconds buttons remain in their current state.
  The above can be summarized in the UML state diagram as follows:
  KitchenTimerState
  From this figure, to make a kitchen timer, implement the following three
  classes.
  Class that manages four states in response to events
  Class to manage time
  Class to control LED display
  Implementation of kitchen timer
  Let's implement the kitchen timer.
  First, create a module to manage time values. It corresponds to Model in the
  Model View Controller (MVC) design pattern.
  object Time {
  // Bit width required for 60-base notation (0 to 59)
  val sexagesimalWitdh = (log2Floor(59) + 1).W
  }
  /** Model class of time
  */
  class Time extends Module {
  // You can change the time only in the "Time setting" state
  or "Pause" state
  time.io.incMin := (state === sTimeSet || state === sPause) &&
  Debounce(io.min)
  time.io.incSec := (state === sTimeSet || state === sPause) &&
  Debounce(io.sec)
  time.io.countDown := state === sRun
  // State machine transition processing
  when (stateChange) {
  switch (state) {
  is (sTimeSet) {
  when (!time.io.zero) {
  state := sRun
  }
  }
  is (sRun) {
  state := sPause
  }
  is (sPause) {
  state := sRun
  }
  is (sFin) {
  state := sTimeSet
  }
  }
  } .elsewhen (state === sRun && time.io.zero) {
  state := sFin
  }
  // output
  val seg7LED = Module(new Seg7LED)
  seg7LED.io.digits := VecInit(List(time.io.sec % 10.U,
  (time.io.sec / 10.U)(3, 0),
  time.io.min % 10.U, (time.io.min / 10.U)(3, 0)) :::
  List.fill(4) { 0.U(4.W) })
  seg7LED.io.blink := (state === sFin)
  io.seg7led := seg7LED.io.seg7led
  }
  Above, we define the state enumeration (Enum) constant as follows:
  // "Time setting" :: "Counting down" :: "Pause" ::
  "Countdown complete"
  val sTimeSet :: sRun :: sPause :: sFin :: Nil = Enum(4)
  This is the List class version of the following tuple pattern:
  val (blinkCount, blinkToggle) = Counter(io.blink, 100000000)
  Above, "Counter" returned a tuple with two elements. On the other hand,
  "Enum(4)" returns a List with four elements of UInt. Four elements are
  assigned to sTimeSet, sRun, sPause, sFin respectively. So we get the same
  result as the following code:
  val sTimeSet = 0.U(2.W)
  val sRun = 1.U(2.W)
  val sPause = 2.U(2.W)
  val sFin = 3.U(2.W)
  In Scala, we can use the "::" operator to generate a list, as well as using a List
  object to generate a list. At the end of the list, Nil must be attached to indicate
  the end of the list.
  scala> List(1, 2, 3, 4)
  res0: List[Int] = List(1, 2, 3, 4)
  scala> 1 :: 2 :: 3 :: 4 :: Nil
  res1: List[Int] = List(1, 2, 3, 4)
  In Scala, when an expression for generating an object is described on the left
  side of a variable definition, the value on the right side is decomposed in the
  form of the expression and assigned to the variable on the left side.
  // Assign 1 and 99 to min and max.
  scala> val (min, max) = (1, 99)
  min: Int = 1
  max: Int = 99
  // Assing 1, 2, 3 to a, b, c
  scala> val a :: b :: c :: Nil = List(1, 2, 3)
  a: Int = 1
  b: Int = 2
  c: Int = 3
  Next, we will explain "switch () ~ is ()" used in the KitchenTimer class.
  This "switch ~ is" is a feature of Chisel, which corresponds to the "switch ~
  case" statement of other programming languages. It's not a Scala language
  grammar, and both "switch" and "is" singleton objects with curryed apply
  methods. (Note that there is no switch statement in Scala itself, and there is a
  match expression with more widely applicable functions.)
   */

}
