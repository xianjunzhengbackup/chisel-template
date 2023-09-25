package horie.SequentialCircuit
import chisel3._
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3.iotesters._

class SRLatch extends Module{
  val io = IO(new Bundle{
    val set = Input(Bool())
    val reset =Input(Bool())
    val q=Output(Bool())
    val notQ = Output(Bool())
  })
  io.q := ~(io.reset | io.notQ)
  io.notQ := ~(io.set | io.q)
}

object SRLatchObj extends App{
    (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/SequentialCircuit/LatchAndFlipFlop","--no-check-comb-loops"),Seq(ChiselGeneratorAnnotation(()=>new SRLatch)))
    chisel3.iotesters.Driver.execute(Array("-td","/data/data/com.termux/files/home/generated/horie/SequentialCircuit","--backend-name","verilator","--no-check-comb-loops"),()=>new SRLatch)(c=>new SRLatchTest(c))
}
class SRLatchTest(c:SRLatch) extends PeekPokeTester(c){
    for{
         r <- false to true
         s <- false to true
      }{
          poke(c.io.set,s)
          poke(c.io.reset,r)
          step(1)
          System.out.println(s"reset is $r, set is $s")
          val q = peek(c.io.q)
          val notQ=peek(c.io.notQ)
          System.out.println(s"Q is $q")
          System.out.println(s"notQ is $notQ")

          poke(c.io.set,r)
          poke(c.io.reset,s)
          step(1)
          System.out.println(s"reset is $s, set is $r")
          val q2 = peek(c.io.q)
          val notQ2=peek(c.io.notQ)
          System.out.println(s"Q is $q2")
          System.out.println(s"notQ is $notQ2")
      }
}

