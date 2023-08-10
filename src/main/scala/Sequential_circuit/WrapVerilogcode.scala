package Sequential_circuit

object WrapVerilogcode extends App{
  /*
  So far, we have written code in Chisel and converted it to Verilog code.
  However, there are cases where you want to use code (Intellectual Property)
  written in Verilog with Chisel. In this section, we will use the Verilog
  interface to use memory called block RAM (BRAM) installed in Artix7. Let's
  use this BRAM to display characters on the VGA screen.
  BlackBox
  First, create video memory (VRAM) for VGA screen with BRAM and use it
  as a Chisel module.
  Generate block RAM IP using Vivado
  1. Launch Vivado and create a project. (Do not specify source code when
  creating a project.)
  2. On the left side of window, select [Flow Navigator]-[Project Manager]-
  [IP Catalog].
  3. In the IP Catalog pane on the right of the screen, double-click [Block
  Memory Generator] under [Vivado Repository]-[Memories & Storage
  Elements]-[RAMs & ROMs & BRAM].
  4. On the [Block Memory Generator] window, change the [Component
  Name] at the top to [Vram].
  5. On the [Basic] tab, change the [Memory Type] to [True Dual Port
  RAM].
  6. In [Port A Options], change [Write Width] and [Read Width] to [8],
  change [Write Depth] and [Read Depth] to [307200] (640 × 480), and
  then uncheck [Primitive Output Register].
  7. In [Port B Options], confirm that [Write Width] and [Read Width] are
  [8], and uncheck [Primitive Output Register].
  8. Click the [OK] button.
  9. On the [Generate Output Products] window, click the [Generate] button.
  10. Select the [IP Sources] tab (it may not look like a tab) at below the tree
  in the [Sources] pane at the center of the window.
  11. Double-click [Vram.veo] in [IP]-[Vram]-[Instantiation Template].
  In this file, template code for creating an instance of Vram is written as
  below.
  Vram your_instance_name (
  .clka(clka), // input wire clka
  .ena(ena), // input wire ena
  .wea(wea), // input wire [0 : 0] wea
  .addra(addra), // input wire [18 : 0] addra
  .dina(dina), // input wire [7 : 0] dina
  .douta(douta), // output wire [7 : 0] douta
  .clkb(clkb), // input wire clkb
  .enb(enb), // input wire enb
  .web(web), // input wire [0 : 0] web
  .addrb(addrb), // input wire [18 : 0] addrb
  .dinb(dinb), // input wire [7 : 0] dinb
  .doutb(doutb) // output wire [7 : 0] doutb
  );
  Embed block RAM in Chisel
  In Chisel, create a class that inherits from the BlackBox class, and make the
  VRAM created in BRAM available to Chisel. Here, the class name is the
  name specified in [Component Name] above. As a member of Bundle, define
  a name with "." such as template code ".clka". The bit width of Input, Output,
  and data is the same as the comment of the template code. The type is the one
  used by Chisel. The clka and clkb types are of the Clock type according to
  the code below.
  /** VRAM
  */
  class Vram extends BlackBox {
  val io = IO(new Bundle {
  val clka = Input(Clock())
  val ena = Input(Bool())
  val wea = Input(Bool())
  val addra = Input(UInt(19.W))
  val dina = Input(UInt(8.W))
  val douta = Output(UInt(8.W))
  val clkb = Input(Clock())
  val enb = Input(Bool())
  val web = Input(Bool())
  val addrb = Input(UInt(19.W))
  val dinb = Input(UInt(8.W))
  val doutb = Output(UInt(8.W))
  })
  }
  is (sVramWrite) {
  when (xInChar === 7.U) {
  when (yInChar === 15.U) {
  state := sIdle
  } .otherwise {
  state := sRomRead
  yInChar := yInChar + 1.U
  }
  } .otherwise {
  xInChar := xInChar + 1.U
  }
  }
  }
  // VRAM address of upper left point of character
  val pxBaseAddr = (VGA.hDispMax * 16).U * io.charData.bits.row
  + 8.U * io.charData.bits.col
  io.vramData.bits.addr := pxBaseAddr + VGA.hDispMax.U *
  yInChar + xInChar
  io.vramData.bits.data := Mux(pxShiftReg.io.shiftOut,
  io.charData.bits.color, 0.U)
  io.vramData.valid := state === sVramWrite
  io.charData.ready := state === sIdle
  }
  Write input data from UART to VRAM
  Let's implement a module that displays the input from the UART on the
  display using the created module and the module of the UART.
  class VgaUartDisp extends Module {
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
  val charVramWriter = Module(new CharVramWriter)
  charVramWriter.io.charData.bits.row := rowChar
  charVramWriter.io.charData.bits.col := colChar
  charVramWriter.io.charData.bits.charCode :=
  uart.io.receiveData.bits
  charVramWriter.io.charData.bits.color := colorChar
  charVramWriter.io.charData.valid := uart.io.receiveData.valid
  val vgaDisplay = Module(new VgaDisplay)
  vgaDisplay.io.vramData <> charVramWriter.io.vramData
  // State transition
  switch (state) {
  is (sIdle) {
  when (uart.io.receiveData.valid) {
  state := sCharWrite
  }
  }
  is (sCharWrite) {
  when (charVramWriter.io.charData.ready) {
  when (colChar === 79.U) {
  when (rowChar === 29.U) {
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
  io.vga := vgaDisplay.io.vga
  }
   */

}
