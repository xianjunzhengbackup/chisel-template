package horie.SequentialCircuit
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
import chisel3.iotesters._
import chisel3.util._
import horie.CombinationalCircuit.Seg7LEDBundle

class Clock extends Module{
  val io = IO(new Bundle{
    val seg7led = Output(new Seg7LEDBundle)
  })

  val (_,msTrigger) = Counter(true.B,1000000)
  val (msCount,sTrigger)=Counter(msTrigger,100)
  val (sCount,mTrigger)=Counter(sTrigger,60)
  val (mCount,hTrigger)=Counter(mTrigger,60)
  val (hCount,_)=Counter(hTrigger,24)

  val seg = Module(new Seg7LED)
  io.seg7led := seg.io.seg7led
  seg.io.digits := VecInit(msCount(3,0),Cat(0.U(1.W),msCount(6,4)),sCount(3,0),Cat(0.U(2.W),sCount(5,4)),mCount(3,0),Cat(0.U(2.W),mCount(5,4)),hCount(3,0),Cat(0.U(3.W),hCount(4)))
}

object ClockObj extends App{
  (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/SequentialCircuit/Register"),Seq(ChiselGeneratorAnnotation(()=>new Clock)))
}
