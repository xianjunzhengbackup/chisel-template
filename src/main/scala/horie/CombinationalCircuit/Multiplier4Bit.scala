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

  val s1 = Module(new LeftShifter)

  s1.io.in := io.a
  s1.io.shiftAmount :=io.b(2,1) 
  val r1 = s1.io.out

  val adder8bit_1 = Module(new AdderNBit(8))
  adder8bit_1.io.carryIn := 0.U(1.W)
  adder8bit_1.io.b :=Cat(0.U(2.W),r1)
  adder8bit_1.io.a :=Mux(io.b(0),Cat(0.U(4.W),io.a),0.U(8.W))

  val adder8bit_2 = Module(new AdderNBit(8))
  adder8bit_2.io.carryIn := 0.U
  adder8bit_2.io.a := adder8bit_1.io.sum
  adder8bit_2.io.b :=Mux(io.b(3),Cat(0.U(1.W),io.a,0.U(3.W)),0.U(8.W))

  io.result := adder8bit_2.io.sum
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
