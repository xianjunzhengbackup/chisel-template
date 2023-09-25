package horie.SequentialCircuit
import chisel3._
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3.iotesters._

class DLatch extends Module{
  val io = IO(new Bundle{
    val data = Input(Bool())
    val enable=Input(Bool())
    val q=Output(Bool())
  })

  val srLatch=Module(new SRLatch)
  srLatch.io.reset := io.enable & ~io.data
  srLatch.io.set := io.enable & io.data

  io.q :=srLatch.io.q
}

object DLatchObj extends App{                                      (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/SequentialCircuit/LatchAndFlipFlop","--no-check-comb-loops"),Seq(ChiselGeneratorAnnotation(()=>new DLatch)))
    chisel3.iotesters.Driver.execute(Array("-td","/data/data/com.termux/files/home/generated/horie/SequentialCircuit","--backend-name","verilator","--no-check-comb-loops"),()=>new DLatch)(c=>new DLatchTest(c))
}

class DLatchTest(c:DLatch) extends PeekPokeTester(c){
    println("Test for D Latch starts")
    for{
         d <- false to true
         e <- false to true
      }{
          poke(c.io.enable,e)
          poke(c.io.data,d)
          step(1)
          System.out.println(s"enable is $e, data is $d")
          val q = peek(c.io.q)
          System.out.println(s"Q is $q")
      }
}
