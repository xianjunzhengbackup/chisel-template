package horie.SequentialCircuit
import horie.CombinationalCircuit._
import chisel3.stage.ChiselGeneratorAnnotation   
import chisel3._
import chisel3.iotesters._
import chisel3.util._

class ClockSec1Digit extends Module{
  val io = IO(new Bundle{
    val seg7led = Output(new Seg7LEDBundle)
  })

  val reg24Bit = RegInit(0.U(24.W))
  val reg4Bit = RegInit(0.U(4.W))
  //when(reg24Bit === "d1000000".U){
  when(reg24Bit === "d9".U){
    reg4Bit := reg4Bit + 1.U(4.W)
    reg24Bit := 0.U
  }  .otherwise {
    reg4Bit := reg4Bit
    reg24Bit := reg24Bit + 1.U
  }

  val seg = Module(new Seg7LED1Digit)  
  seg.io.num := reg4Bit
  io.seg7led := seg.io.seg7led
}

object ClockSec1DigitObj extends App{   
  (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/SequentialCircuit/Register"),Seq(ChiselGeneratorAnnotation(()=>new ClockSec1Digit)))
  chisel3.iotesters.Driver.execute(Array("-td","/data/data/com.termux/files/home/generated/horie/SequentialCircuit","--backend-name","verilator"),()=>new ClockSec1Digit)(c=>new ClockSec1DigitTest(c)) 
}

class ClockSec1DigitTest(c:ClockSec1Digit) extends PeekPokeTester(c)   
{
  step(1000)
}
