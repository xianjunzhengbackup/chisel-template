package horie.CombinationalCircuit

import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
import chisel3.iotesters._
import chisel3.util._

class Adder4Bit extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(4.W))
    val b = Input(UInt(4.W))
    val carryIn = Input(UInt(1.W))
    val sum = Output(UInt(4.W))
    val carryOut = Output(UInt(1.W))
  })

  val f1 = Module(new FullAdder)
  val f2 = Module(new FullAdder)
  val f3 = Module(new FullAdder)
  val f0 = Module(new FullAdder)

  f0.io.a := io.a(0)
  f0.io.b := io.b(0)
  f0.io.carryIn := io.carryIn

  f1.io.a := io.a(1)
  f1.io.b := io.b(1)
  f1.io.carryIn := f0.io.carryOut

  f2.io.a := io.a(2)
  f2.io.b := io.b(2)
  f2.io.carryIn := f1.io.carryOut

  f3.io.a := io.a(3)
  f3.io.b := io.b(3)
  f3.io.carryIn := f2.io.carryOut

  io.sum := Cat(f3.io.sum,f2.io.sum,f1.io.sum,f0.io.sum)
  io.carryOut := f3.io.carryOut
}

object Adder4BitObj extends App{
    (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/CombinationalCircuit/Adder4Bit"),Seq(ChiselGeneratorAnnotation(()=>new Adder4Bit )))
      chisel3.iotesters.Driver.execute(args,()=>new Adder4Bit)(c=>new Adder4BitTest(c))
}
class Adder4BitTest(c:Adder4Bit) extends PeekPokeTester(c){
    for{
        a <- 0 to 7
        b <- 8 to 15
        carry <- 0 to 1
      }{
          poke(c.io.a,a)
          poke(c.io.b,b)
          poke(c.io.carryIn,carry)
          step(1)
      }
}
