package horie.CombinationalCircuit
import chisel3._
import chisel3.util._

class Seg7LEDBundle extends Bundle{
  val cathodes = UInt(7.W)
  val decimalPoint = UInt(1.W)
  val anodes = UInt(8.W)
}

class Seg7LED1Digit extends Module{
  val io = IO(new Bundle{
    val num = Input(UInt(4.W))
    val seg7led = Output(new Seg7LEDBundle)
  })

  io.seg7led.cathodes := MuxCase("b111_1111".U,
    Seq(
      (io.num === "h0".U) -> "b100_0000".U,
      (io.num === "h1".U) -> "b111_1001".U,
      (io.num === "h2".U) -> "b010_0100".U,
      (io.num === "h3".U) -> "b011_0000".U,
      (io.num === "h4".U) -> "b001_1001".U,
      (io.num === "h5".U) -> "b001_0010".U,
      (io.num === "h6".U) -> "b000_0010".U,
      (io.num === "h7".U) -> "b101_1000".U,
      (io.num === "h8".U) -> "b000_0000".U,
      (io.num === "h9".U) -> "b001_0000".U,
      (io.num === "ha".U) -> "b000_1000".U,
      (io.num === "hb".U) -> "b000_0011".U,
      (io.num === "hc".U) -> "b100_0110".U,
      (io.num === "hd".U) -> "b010_0001".U,
      (io.num === "he".U) -> "b000_0110".U,
      (io.num === "hf".U) -> "b000_1110".U))
  io.seg7led.decimalPoint := 1.U
  io.seg7led.anodes := "b1111_1110".U
}

