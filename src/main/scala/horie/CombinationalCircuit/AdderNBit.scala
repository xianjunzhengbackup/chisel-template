package horie.CombinationalCircuit

import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
import chisel3.iotesters._
import chisel3.util._

class AdderNBit(val n:Int) extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(n.W))
    val b = Input(UInt(n.W))
    val carryIn = Input(UInt(1.W))
    val sum = Output(UInt(n.W))
    val carryOut = Output(UInt(1.W))
  })

  val f = VecInit.fill(n)(Module(new FullAdder).io)

 val carries = Wire(Vec(n+1,UInt(1.W)))
 val sum = Wire(Vec(n,UInt(1.W)))

 carries(0) := io.carryIn
 for(i<- 0 to n-1){
    f(i).a :=io.a(i)
    f(i).b := io.b(i)
    f(i).carryIn := carries(i)
    sum(i) := f(i).sum
    carries(i+1) := f(i).carryOut
 }

  io.sum := sum.asUInt
  io.carryOut := f(n-1).carryOut
}

object AdderNBitObj extends App{
    (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/CombinationalCircuit/AdderNBit"),Seq(ChiselGeneratorAnnotation(()=>new AdderNBit(8))))
      chisel3.iotesters.Driver.execute(args,()=>new AdderNBit(8))(c=>new AdderNBitTest(c))
}
class AdderNBitTest(c:AdderNBit) extends PeekPokeTester(c){
    val startValue = math.pow(2,c.n - 1).toInt
    for{
        a <- 0 to startValue
        b <- startValue to 2*startValue
        carry <- 0 to 1
      }{
          poke(c.io.a,a)
          poke(c.io.b,b)
          poke(c.io.carryIn,carry)
          step(1)
      }
}

