package horie.SequentialCircuit.KitchenTimer
import horie.CombinationalCircuit.Seg7LEDBundle
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
import chisel3.iotesters._
import chisel3.util._

class Seg7LED extends Module{
  val io = IO(new Bundle{
    val digits=Input(Vec(8,UInt(4.W)))
    val blink = Input(Bool())
    val seg7led = Output(new Seg7LEDBundle)
  })
  val (digitChangeCount,digitChange)=Counter(true.B,100000)
  val (digitIndex,digitWrap)=Counter(digitChange,8)
  val digitNum=io.digits(digitIndex)

  io.seg7led.cathodes := MuxCase("b111_1111".U, Array(
    (digitNum === "h0".U) -> "b100_0000".U, 
    (digitNum === "h1".U) -> "b111_1001".U, 
    (digitNum === "h2".U) -> "b010_0100".U, 
    (digitNum === "h3".U) -> "b011_0000".U, 
    (digitNum === "h4".U) -> "b001_1001".U, 
    (digitNum === "h5".U) -> "b001_0010".U, 
    (digitNum === "h6".U) -> "b000_0010".U, 
    (digitNum === "h7".U) -> "b101_1000".U, 
    (digitNum === "h8".U) -> "b000_0000".U, 
    (digitNum === "h9".U) -> "b001_0000".U, 
    (digitNum === "ha".U) -> "b000_1000".U, 
    (digitNum === "hb".U) -> "b000_0011".U, 
    (digitNum === "hc".U) -> "b100_0110".U,
    (digitNum === "hd".U) -> "b010_0001".U, 
    (digitNum === "he".U) -> "b000_0110".U, 
    (digitNum === "hf".U) -> "b000_1110".U))

  val anodes=RegInit("b1111_1110".U(8.W))
  when(digitChange){
    anodes := Cat(anodes(6,0),anodes(7))
  }
  val (blinkCount,blinkToggle)=Counter(io.blink,100000000)
  val blinkLight=RegInit(true.B)
  when(blinkToggle){
    blinkLight := !blinkLight
  }
  io.seg7led.anodes := Mux(!io.blink || blinkLight,anodes,"hff".U)
  io.seg7led.decimalPoint := 1.U
}

