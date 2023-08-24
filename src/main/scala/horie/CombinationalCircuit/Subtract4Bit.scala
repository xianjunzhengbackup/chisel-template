package horie.CombinationalCircuit
import chisel3._
import chisel3.iotesters._
import chisel3.stage.ChiselGeneratorAnnotation

class Subtract4Bit extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(4.W))
    val b = Input(UInt(4.W))
    val result = Output(UInt(4.W))
  })

  val adder = Module(new Adder4Bit)
  val b_complement = ~io.b + 1.U
  adder.io.b := b_complement
  adder.io.a := io.a
  adder.io.carryIn := 0.U
  io.result := adder.io.sum
}

object Subtract4BitObj extends App{
  (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/CombinationalCircuit/Subtract4Bit"),Seq(ChiselGeneratorAnnotation(()=>new Subtract4Bit )))
  chisel3.iotesters.Driver.execute(args,()=>new Subtract4Bit)(c=>new Subtract4BitTest(c))
}
class Subtract4BitTest(c:Subtract4Bit) extends PeekPokeTester(c){
  for{
      a <- 0 to 7
      b <- 8 to 15
    }{
    poke(c.io.a,a)
    poke(c.io.b,b)
    step(1)
    poke(c.io.a,b)
    poke(c.io.b,a)
    step(1)
    }
}
