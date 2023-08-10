package Sequential_circuit

object Multiclockdomain extends App{
  /*
  In the previous section, the display period for one pixel was haphazardly
  close to 4 clocks of the FPGA board clock, so the numbers were rounded as
  follows:
  val pxClock = (100000000.0 / fps / vMax / hMax).round.toInt
  Then, we prepared the counter for 4 clocks as shown below and moved the
  display position horizontally.
  val (pxCount, pxEn) = Counter(true.B, pxClock)
  val (hCount, hEn) = Counter(pxEn, hMax)
  However, when we try to display at SVGA resolution (800 x 600 pixels), we
  can not move sideways. This is because hMax = 1056 and vMax = 628, and a
  counter of 2.5 clocks is required as shown below.
  100,000,000 ÷ 60 ÷ 1056 ÷ 628 = 2.51...
  However, there is no problem if we prepare a clock with a period of one pixel
  and change hCount for each clock. If we prepare the following clock, we can
  also display the SVGA resolution.
  60 × 1056 × 628 = 39790080 = 40MHz
  Generate a clock
  First, using Vivado, create an IP that generates a 40 MHz clock.
  1. On [IP Catalog] pain, double-click [Clocking Wizard] under [Vivado
  Repository] - [FPGA Features and Design] - [Clocking].
  2. On the [Clocking Wizard] window, change the [Component Name] at
  the top to [DisplayClock].
  3. On the [Clocking Options] tab, change the [Port Name] of [Input Clock
  Information] - [Primary] clock to [clk_system]
  4. On the [Output Clocks]tab, change the [Port Name] of [Output Clock] -
  [clock_out1] to [clk_display], [Output Fraq] to [40.000], uncheck [reset]
  and [locked] of [Enable Optional Inputs / Outputs for MMCM/PLL].
  5. Click the [OK] button.
  6. On the [Generate Output Products] window, click the [Generate] button.
  7. Select the [IP Sources] tab at below the tree in the [Sources] pane at the
  center of the window.
  8. double-click [Display.veo] in [IP] - [Diplay] - [Instantiation Template]
  Next, create the following class of Chisel:
  /** DisplayClock
  */
  class DisplayClock extends BlackBox with HasBlackBoxInline {
  val io = IO(new Bundle {
  val clk_system = Input(Clock())
  val clk_display = Output(Clock())
  })
  }
  Generate VRAM, character ROM
  When generating IP of VRAM in Vivado, set [Read Depth] to [480000] (800
  x 600). Character ROM is the same as the previous section.
  Change the display module
  The definitions of constants are divided into two classes: abstract classes for
  declaring parameter types and objects that define actual values for various
  resolutions.
  class VgaUartDisp(dispMode: DispMode) extends Module {
  val io = IO(new Bundle {
  val rxData = Input(Bool())
  val txData = Output(Bool())
  val rts = Output(Bool())
  val cts = Input(Bool())
  val vga = Output(new VgaBundle)
  })
  /* State machine definition */
  val sIdle :: sCharWrite :: Nil = Enum(2)
  val state = RegInit(sIdle)
  // Row and column to display character
  val rowChar = RegInit(0.U(5.W))
  val colChar = RegInit(0.U(7.W))
  // Character color
  // (Because it is boring in a single color, change the color
  by the row)
  val colorIndex = (colChar / 10.U)(2, 0)
  val colorChar = Cat(7.U - colorIndex, colorIndex,
  colorIndex(1, 0))
  val uart = Module(new Uart)
  uart.io.rxData := io.rxData
  io.txData := uart.io.txData
  io.rts := uart.io.rts
  uart.io.cts := io.cts
  uart.io.sendData.valid := false.B // No data is sent
  uart.io.sendData.bits := 0.U
  uart.io.receiveData.ready := state === sIdle
  val charVramWriter = Module(new CharVramWriter(dispMode))
  charVramWriter.io.charData.bits.row := rowChar
  charVramWriter.io.charData.bits.col := colChar
  charVramWriter.io.charData.bits.charCode :=
  uart.io.receiveData.bits
  charVramWriter.io.charData.bits.color := colorChar
  charVramWriter.io.charData.valid := uart.io.receiveData.valid
  val displayClock = Module(new DisplayClock)
  displayClock.io.clk_system := clock
  withClock (displayClock.io.clk_display) {
  val vgaDisplay = Module(new VgaDisplay(dispMode))
  vgaDisplay.io.vramData <> charVramWriter.io.vramData
  vgaDisplay.io.vramClock := clock
  io.vga := vgaDisplay.io.vga
  }
  // State transition
  switch (state) {
  is (sIdle) {
  when (uart.io.receiveData.valid) {
  state := sCharWrite
  }
  }
  is (sCharWrite) {
  when (charVramWriter.io.charData.ready) {
  when (colChar === dispMode.col.U - 1.U) {
  when (rowChar === dispMode.row.U - 1.U) {
  rowChar := 0.U
  } .otherwise {
  rowChar := rowChar + 1.U
  }
  colChar := 0.U
  } .otherwise {
  colChar := colChar + 1.U
  }
  state := sIdle
  }
  }
  }
  }
  object VgaUartDisp extends App {
  chisel3.Driver.execute(args, () => new VgaUartDisp(SVGA))
  }
  Now we can view at SVGA resolution.
   */

}
