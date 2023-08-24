package horie.CombinationalCircuit
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
import chisel3.iotesters._
import chisel3.util._

class Multiplier4Bit extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(4.W))
    val b = Input(UInt(4.W))
    val result = Output(UInt(8.W))
  })
  val s = VecInit.fill(4)(Module(new LeftShifter).io)
  
  for(i <- 0 to 3){
    s(i).in := Mux(io.b(i),io.a,0.U(4.W))
    s(i).shiftAmount := Mux(io.b(i),i.U(2.W),0.U(2.W))
  }
  val adders = VecInit.fill(3)(Module(new AdderNBit(8)).io)
  for(i <- 0 to 2)
    adders(i).carryIn :=0.U(1.W)
  adders(0).a := Cat(0.U(1.W),s(0).out)
  adders(0).b := Cat(0.U(1.W),s(1).out)
  adders(1).a := Cat(0.U(1.W),s(2).out)
  adders(1).b := Cat(0.U(1.W),s(3).out)
  adders(2).a := adders(0).sum
  adders(2).b := adders(1).sum

  io.result := adders(2).sum
}

object Multiplier4BitObj extends App{
    (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/CombinationalCircuit/Multiplier4Bit"),Seq(ChiselGeneratorAnnotation(()=>new Multiplier4Bit)))
      chisel3.iotesters.Driver.execute(args,()=>new Multiplier4Bit)(c=>new Multiplier4BitTest(c))
}
class Multiplier4BitTest(c:Multiplier4Bit) extends PeekPokeTester(c){
    val startValue =7 
    val endValue = 15
    for{
        a <- 0 to startValue
        b <- startValue to endValue
      }{
          poke(c.io.a,a)
          poke(c.io.b,b)
          step(1)
      }
}
