package horie.CombinationalCircuit
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
import chisel3.iotesters._

class LeftShifter extends Module{
  val io = IO(new Bundle{
    val in = Input(UInt(4.W))
    val shiftAmount = Input(UInt(2.W))
    val out =Output(UInt(6.W))
  })

  io.out := io.in << io.shiftAmount
}

object LeftShifterObj extends App{
    (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/CombinationalCircuit/LeftShifter"),Seq(ChiselGeneratorAnnotation(()=>new LeftShifter )))
      chisel3.iotesters.Driver.execute(args,()=>new LeftShifter)(c=>new LeftShifterTest(c))
}
class LeftShifterTest(c:LeftShifter) extends PeekPokeTester(c){
    for{
        a <- 0 to 15
        b <- 0 to 3
      }{
          poke(c.io.in,a)
          poke(c.io.shiftAmount,b)
          step(1)
      }
}
