package horie.SequentialCircuit.PS2

import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
import chisel3.iotesters._
import chisel3.util._

class ShiftRegisterSIPO(val n:Int) extends Module{
  val io = IO(new Bundle{
    val shiftIn = Input(Bool())
    val enable = Input(Bool())
    val q = Output(UInt(n.W))
  })

/*val regs:Vec[UInt] = VecInit(for(i<- n-1 to 0 by -1)
    yield{
      if(i==0) RegEnable(io.shiftIn.asUInt,0.U(1.W),io.enable)
      else RegEnable(regs(i-1),0.U(1.W),io.enable)
    })*/

  val regs = RegInit(0.U(n.W))
  when(io.enable){
    regs := regs(n-2 , 0) ## io.shiftIn.asUInt
  }
  io.q := regs
}

object ShiftRegisterSIPOObj extends App{
    (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/SequentialCircuit/horie/PS2","--full-stacktrace"),Seq(ChiselGeneratorAnnotation(()=>new ShiftRegisterSIPO(8))))
    chisel3.iotesters.Driver.execute(Array("-td","/data/data/com.termux/files/home/generated/horie/SequentialCircuit/horie/PS2","--backend-name","verilator"),()=>new ShiftRegisterSIPO(8))(c=>new ShiftRegisterSIPO8BitTest(c))
}

class ShiftRegisterSIPO8BitTest(c:ShiftRegisterSIPO) extends PeekPokeTester(c){
  poke(c.io.enable,true)
  for(i<-0 to c.n){
    
    poke(c.io.shiftIn,true)
    step(1)
    poke(c.io.shiftIn,false)
    step(1)
  }
}
