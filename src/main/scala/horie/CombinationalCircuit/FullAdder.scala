package horie.CombinationalCircuit

import chisel3.iotesters._
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
class FullAdder extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(1.W))
    val b = Input(UInt(1.W))
    val carryIn = Input(UInt(1.W))
    val sum = Output(UInt(1.W))
    val carryOut = Output(UInt(1.W))
  })

  val h1= Module(new HalfAdder)
  val h2 = Module(new HalfAdder)
/*   a       b     carryIn        SUM        carryOut
 *   1       1       0             0            1         
 *   1       1       1             1            1
 */
  h1.io.a := io.a
  h1.io.b := io.b
  h2.io.a := h1.io.sum
  h2.io.b := io.carryIn
  io.sum := h2.io.sum
  io.carryOut := h1.io.carryOut | h2.io.carryOut
}

object FullAdderObj extends App{
  //(new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/CombinationalCircuit/FullAdder"),Seq(ChiselGeneratorAnnotation(()=>new FullAdder )))
  chisel3.iotesters.Driver.execute(args,()=>new FullAdder)(c=>new FullAdderTest(c))
}
class FullAdderTest(c:FullAdder) extends PeekPokeTester(c){
  for{
    a <- 0 to 1
    b <- 0 to 1
    carry <- 0 to 1} {
      poke(c.io.a,a)
      poke(c.io.b,b)
      poke(c.io.carryIn,carry)
      step(1)
    }
}
