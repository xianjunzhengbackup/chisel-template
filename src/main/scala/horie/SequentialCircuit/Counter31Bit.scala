package horie.SequentialCircuit
import horie.CombinationalCircuit._
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
import chisel3.iotesters._
import chisel3.util._

class Counter31Bit extends Module{
  val io = IO(new Bundle{
    val seg7led=Output(new Seg7LEDBundle)
  })
  val adder31Bit = Module(new AdderNBit(31))
  val reg31Bit = RegInit(0.U(31.W))
  adder31Bit.io.a := reg31Bit
  adder31Bit.io.b :=1.U(31.W)
  adder31Bit.io.carryIn := 0.U
  reg31Bit := adder31Bit.io.sum
  
  val seg = Module(new Seg7LED1Digit)
  seg.io.num := reg31Bit(3,0)
  io.seg7led := seg.io.seg7led
}
object Counter31BitObj extends App{ 
  (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/SequentialCircuit/Register"),Seq(ChiselGeneratorAnnotation(()=>new Counter31Bit)))
    chisel3.iotesters.Driver.execute(Array("-td","/data/data/com.termux/files/home/generated/horie/SequentialCircuit","--backend-name","verilator"),()=>new Counter31Bit)(c=>new Counter31BitTest(c))
}

class Counter31BitTest(c:Counter31Bit) extends PeekPokeTester(c)
{
  step(100)
}
