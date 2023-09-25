package horie.SequentialCircuit
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
import chisel3.iotesters._

class DFlipFlop extends Module{
  val io = IO(new Bundle{
    val clock=Input(Bool())
    val data = Input(Bool())
    val q=Output(Bool())
  })

  val dLatch1=Module(new DLatch)
  dLatch1.io.enable := ~io.clock
  dLatch1.io.data :=io.data

  val dLatch2=Module(new DLatch)
  dLatch2.io.enable :=io.clock
  dLatch2.io.data :=dLatch1.io.q

  io.q :=dLatch2.io.q
}

object DFlipFlopObj extends App{                                    (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/SequentialCircuit/LatchAndFlipFlop","--no-check-comb-loops"),Seq(ChiselGeneratorAnnotation(()=>new DFlipFlop)))
    chisel3.iotesters.Driver.execute(Array("-td","/data/data/com.termux/files/home/generated/horie/SequentialCircuit","--backend-name","verilator","--no-check-comb-loops"),()=>new DFlipFlop)(c=>new DFlipFlopTest(c))
}

class DFlipFlopTest(c:DFlipFlop) extends PeekPokeTester(c){
  poke(c.io.data,false)
  poke(c.io.clock,false)
  step(1)
  poke(c.io.clock,true)
  step(1)
  poke(c.io.data,true)
  poke(c.io.clock,false)
  step(1)
  poke(c.io.clock,true)
  step(1)
  poke(c.io.data,false)
  poke(c.io.clock,false)
  step(1)
  poke(c.io.clock,true)
}
