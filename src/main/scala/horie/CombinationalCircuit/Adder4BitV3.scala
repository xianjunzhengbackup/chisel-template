package horie.CombinationalCircuit

import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
import chisel3.iotesters._
import chisel3.util._

class Adder4BitV3 extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(4.W))
    val b = Input(UInt(4.W))
    val carryIn = Input(UInt(1.W))
    val sum = Output(UInt(4.W))
    val carryOut = Output(UInt(1.W))
  })
/*
  val f1 = Module(new FullAdder)
  val f2 = Module(new FullAdder)
  val f3 = Module(new FullAdder)
  val f0 = Module(new FullAdder)
*/

  val f = VecInit.fill(4)(Module(new FullAdder).io)
/*
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
  f3.io.carryIn := f2.io.carryOut */

 /* for(n <- 0 to 3){
    if(n==0) {
      f(0).a := io.a(0)
      f(0).b := io.b(0)
      f(0).carryIn := io.carryIn
    } else {
      f(n).a := io.a(n)
      f(n).b := io.b(n)
      f(n).carryIn := f(n-1).carryOut
    }
  }*/

 val carries = Wire(Vec(5,UInt(1.W)))
 val sum = Wire(Vec(4,UInt(1.W)))

 carries(0) := io.carryIn
 for(i<- 0 to 3){
    f(i).a :=io.a(i)
    f(i).b := io.b(i)
    f(i).carryIn := carries(i)
    sum(i) := f(i).sum
    carries(i+1) := f(i).carryOut
 }

/*  for(n <- 0 to 3){
    f(n).carryIn := {}
  }*/
  
  //io.sum := Cat(f(3).sum,f(2).sum,f(1).sum,f(0).sum)
  io.sum := sum.asUInt
  io.carryOut := f(3).carryOut
}

object Adder4BitV3Obj extends App{
    (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/CombinationalCircuit/Adder4Bit"),Seq(ChiselGeneratorAnnotation(()=>new Adder4BitV3 )))
      chisel3.iotesters.Driver.execute(args,()=>new Adder4BitV3)(c=>new Adder4BitV3Test(c))
}
class Adder4BitV3Test(c:Adder4BitV3) extends PeekPokeTester(c){
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

