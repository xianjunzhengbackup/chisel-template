package horie.SequentialCircuit
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
import chisel3.iotesters._
import chisel3.util._
import horie.CombinationalCircuit.Seg7LEDBundle

class Seg7LED extends Module{
  val io = IO(new Bundle{
    val digits = Input(Vec(8,UInt(4.W)))
    val seg7led = Output(new Seg7LEDBundle)
  })

  val (digitChangeCount,digitChange)=Counter(true.B,10)
  //val (digitChangeCount,digitChange)=Counter(true.B,1000000)
  val (digitIndex,digitWrap)=Counter(digitChange,8)
  val digitNum=io.digits(digitIndex)

  io.seg7led.cathodes :=MuxCase("b111_1111".U, Array(
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
  io.seg7led.decimalPoint := 1.U
  io.seg7led.anodes := ~("b0000_0001".U << digitIndex)
}

object Seg7LEDObj extends App{    
  (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/SequentialCircuit/Register"),Seq(ChiselGeneratorAnnotation(()=>new Seg7LED)))
  chisel3.iotesters.Driver.execute(Array("-td","/data/data/com.termux/files/home/generated/horie/SequentialCircuit","--backend-name","verilator"),()=>new Seg7LED)(c=>new Seg7LEDTest(c))
}

class Seg7LEDTest(c:Seg7LED) extends PeekPokeTester(c){
  val number = Array(1,2,3,4,5,6,7,8)
  for(i<-0 to 7)
    poke(c.io.digits(i),i)
  step(200)
}
