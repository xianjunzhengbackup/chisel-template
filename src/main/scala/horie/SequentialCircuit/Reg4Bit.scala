package horie.SequentialCircuit
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
import chisel3.iotesters._
import chisel3.util._

class Reg4Bit extends Module{
  val io = IO(new Bundle{
    val resetN=Input(Bool())
    val in = Input(UInt(4.W))
    val enable=Input(Bool())
    val out =Output(UInt(4.W))
  })
  withReset(~io.resetN){
    io.out :=RegEnable(io.in,0.U(4.W),io.enable)
  }
}

object Reg4BitObj extends App{
  (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/SequentialCircuit/Register"),Seq(ChiselGeneratorAnnotation(()=>new Reg4Bit)))           
  chisel3.iotesters.Driver.execute(Array("-td","/data/data/com.termux/files/home/generated/horie/SequentialCircuit","--backend-name","verilator"),()=>new Reg4Bit)(c=>new Reg4BitTest(c))}

class Reg4BitTest(c:Reg4Bit) extends PeekPokeTester(c){
  for{
      i <- 0 to 3
    }{
      poke(c.io.enable,true)
      poke(c.io.resetN,true)
      step(2)
      poke(c.io.enable,true)
      poke(c.io.resetN,false)
      poke(c.io.in,true)
      step(2)
      poke(c.io.resetN,true)
      step(1)
      poke(c.io.resetN,false)
      step(1)
      poke(c.io.in,false)
      step(2)
      poke(c.io.enable,false)
      poke(c.io.in,true)
      step(2)
    }
}
