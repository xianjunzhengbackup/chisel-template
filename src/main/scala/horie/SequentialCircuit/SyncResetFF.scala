package horie.SequentialCircuit
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
import chisel3.iotesters._

class SyncResetFF extends Module{
  val io = IO(new Bundle{
    val clock=Input(Bool())
    val reset=Input(Bool())
    val data=Input(Bool())
    val q=Output(Bool())
  })

  val dFF=Module(new DFlipFlop)
  dFF.io.clock := io.clock
  dFF.io.data := io.data & ~io.reset

  io.q :=dFF.io.q
}

class SyncRFFWrapper extends Module{
  val io=IO(new Bundle{
    val clock=Input(Bool())
    val resetNegate=Input(Bool())
    val data=Input(Bool())
    val q=Output(Bool())
  })
  val srFF=Module(new SyncResetFF)
  srFF.io.clock := io.clock
  srFF.io.reset := ~io.resetNegate
  srFF.io.data := io.data

  io.q :=srFF.io.q
}

object SyncRFFWrapperObj extends App{
  (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/SequentialCircuit/LatchAndFlipFlop","--no-check-comb-loops"),Seq(ChiselGeneratorAnnotation(()=>new SyncRFFWrapper)))
  chisel3.iotesters.Driver.execute(Array("-td","/data/data/com.termux/files/home/generated/horie/SequentialCircuit","--backend-name","verilator","--no-check-comb-loops"),()=>new SyncRFFWrapper)(c=>new SyncRFFWrapperTest(c))
}

class SyncRFFWrapperTest(c:SyncRFFWrapper) extends PeekPokeTester(c){
    for{
         i <- 0 to 3
      }{
          poke(c.io.clock,false)
          poke(c.io.data,true)
          poke(c.io.resetNegate,true)
          step(1)
          poke(c.io.clock,true)
          step(1)

          poke(c.io.clock,false)
          poke(c.io.data,true)
          poke(c.io.resetNegate,false)
          step(1)
          poke(c.io.clock,true)
          step(1)


          poke(c.io.clock,false)
          poke(c.io.data,false)
          poke(c.io.resetNegate,true)
          step(1)
          poke(c.io.clock,true)
          step(1)

          poke(c.io.clock,false)
          poke(c.io.data,true)
          poke(c.io.resetNegate,false)
          step(1)
          poke(c.io.clock,true)
          step(1)
      }
}
