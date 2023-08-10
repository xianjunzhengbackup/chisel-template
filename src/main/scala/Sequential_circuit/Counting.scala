package Sequential_circuit

object Counting extends App{
  /*
  Count up(1 digit sec clock)
  Counter
  We can use the register to keep outputting the previous clock value.
  Connect Adder, which adds 1 to the output of the register, and connect the
  output of Adder to the input of the register, it becomes a counter that counts
  up to 1 clock as following. RegInit returns a register with the reset value as
  an argument.
  /** 31 bit counter. 7 segment LED displays upper 4 bit value.
  */
  class Counter31Bit extends Module {
  val io = IO(new Bundle {
  val seg7led = Output(new Seg7LEDBundle)
  })
  // Register for counter of 31 bit width (Initialize to 0)
  val count = RegInit(0.U(31.W))
  count := count + 1.U // 1 increase per clock
  // display upper 4 bit of counter
  val seg7LED1Digit = Module(new Seg7LED1Digit)
  seg7LED1Digit.io.num := count(30, 27) // display upper 4 bits
  io.seg7led := seg7LED1Digit.io.seg7led
  }
  If the register variable is on the right-hand side, as in the following "count",
  the "count" changes every clock rise. On the other hand, if a variable such as
  Output or Wire like seg7led is on the right side, when the variable on the
  right side changes, the variable on the left side also changes immediately.
  count := count + 1.U // 1 increase per clock
  When we run this module, we will see the LED numbers increase by 1 every
  about 134M clock (about 1.3 seconds).
  1 digit sec clock(when)
  In the previous example, the LED display changed every halfway time. Next,
  let's change it every 100M clock (one second).
  First, create two registers. When one counter reaches 100,000,000, the other
  counter is incremented by one. And the former returns to 0 and counts up
  again. To change the value of a register under certain conditions, use "when":
  class ClockSec1Digit extends Module {
  val io = IO(new Bundle {
  val seg7led = Output(new Seg7LEDBundle)
  })
  // Counter for 1 second.
  val count1Sec = RegInit(0.U(27.W))
  // Counter from 0 to 15 seconds.
  val count = RegInit(0.U(4.W))
  when (count1Sec === 100000000.U) {
  // Counted up 100 Million times
  count := count + 1.U // increment second.
  count1Sec := 0.U // reset counter
  } .otherwise {
  // Increment every 1 clock
  count1Sec := count1Sec + 1.U
  }
  val seg7LED1Digit = Module(new Seg7LED1Digit)
  seg7LED1Digit.io.num := count
  io.seg7led := seg7LED1Digit.io.seg7led
  }
  Did you notice that "." is prepended to "otherwise" like ".otherwise"? "when"
  and "otherwise" are not keywords of grammar like "if", but are singleton
  objects and methods respectively. In Scala, there are many cases where a
  simple method call looks like its own grammar.
  In the previous chapter, we generated a sequence with four FullAdders as
  elements using the curried method Seq.fill as follows.
  Seq.fill(4){ Module(new FullAdder).io }
  Likewise, the following "when" is a call to the curried "when.apply" method.
  when (count1Sec === 100000000.U) {
  // Counted up 100 Million times
  count := count + 1.U // increment second.
  count1Sec := 0.U // reset counter
  }
  The above is the same as the following.
  when.apply(count1Sec === 100000000.U) {count := count + 1.U;
  However, even if we intend to press the button for a moment, it is in a state
  where the button is kept pressing for more than a few million clocks. In
  addition, even if we intend to press the button only once, it will be bouncing
  back and forth many times at the moment the metal contacts of the button
  contacts. The potential is repeatedly changing ON / OFF many times as
  follows. (It usually lasts for a few hundred microseconds to a few tens of
  milliseconds.)
  Bounce
  To detect a change only once, detect the change from false.B to true.B by
  saving the state of the button twice with a cycle longer than the bounce
  period as follows:
  /** Debounce module for push button
  */
  class Debounce extends Module {
  val io = IO(new Bundle{
  val in = Input(Bool())
  val out = Input(Bool())
  })
  // Capture values at 100 millisecond intervals
  val (count, enable) = Counter(true.B, 10000000)
  val reg0 = RegEanble(in , false.B, enable)
  val reg1 = RegEanble(reg0, false.B, enable)
  // Change is detected only when enable, and it makes pulse of
  1 clock
  io.out := reg0 && ~reg1 && enable
  }
  /** Debounce module for push button(Singleton object)
  */
  object Debounce {
  def apply(in: Bool()): Bool = {
  val debounce = Module(new Debounce)
  debounce.io.in := in
  debounce.io.out
  }
  }
  Then, add a register in the clock circuit to store whether or not to measure
  time. It is stopwatch.
  class Stopwatch extends Module {
  val io = IO(new Bundle {
  val startStop = Input(Bool())
  val seg7led = Output(new Seg7LEDBundle)
  })
  val running = RegInit(false.B)
  when (Debounce(io.startStop)) {
  running := ~running
  }
  val (clockNum, centimalSec) = Counter(running, 1000000) //
  Count for 1M clocks(0.01sec)
  val (cSec, oneSec) = Counter(centimalSec, 100) // 0.01
  second count
  val (sec, oneMin) = Counter(oneSec, 60) // 60 seconds
  count
  val (min, oneHour) = Counter(oneMin, 60) // 60 minutes
  count
  val (hour, oneDay) = Counter(oneHour, 24) // 24 hours
  count
  val seg7LED = Module(new Seg7LED)
  seg7LED.io.digits := VecInit(List(cSec % 10.U, (cSec / 10.U)
  (3, 0), sec % 10.U, (sec / 10.U)(3, 0),
  min % 10.U, (min / 10.U)(3, 0), hour % 10.U, (hour / 10.U)
  (3, 0)))
  io.seg7led := seg7LED.io.seg7led
  }
   */

}
