
package horie.CombinationalCircuit
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
import chisel3.iotesters._
import chisel3.util._

class Multiplier4BitV2 extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(4.W))
    val b = Input(UInt(4.W))
    val result = Output(UInt(8.W))
  })

  val digit0 = Wire(UInt(4.W))
  val digit1 = Wire(UInt(4.W))
  val digit2 = Wire(UInt(4.W))
  val digit3 = Wire(UInt(4.W))
  digit0 :=io.a & Fill(4,io.b(0))
  digit1 :=io.a & Fill(4,io.b(1))
  digit2 :=io.a & Fill(4,io.b(2))
  digit3 :=io.a & Fill(4,io.b(3))
  val adder1 = Module(new Adder4Bit)
  adder1.io.a :=digit1
  adder1.io.b := Cat(0.U,digit0(3,1))
  adder1.io.carryIn :=0.U

  val adder2 =Module(new Adder4Bit)
  adder2.io.a := digit2
  adder2.io.b := Cat(adder1.io.carryOut,adder1.io.sum(3,1))
  adder2.io.carryIn :=0.U

  val adder3 =Module(new Adder4Bit)
  adder3.io.a := digit3
  adder3.io.b := Cat(adder2.io.carryOut,adder2.io.sum(3,1))
  adder3.io.carryIn :=0.U

  io.result :=Cat(adder3.io.carryOut,adder3.io.sum,adder2.io.sum(0),adder1.io.sum(0),digit0(0))
  
}

object Multiplier4BitV2Obj extends App{
     (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/CombinationalCircuit/Multiplier4BitV2"),Seq(ChiselGeneratorAnnotation(()=>new Multiplier4BitV2)))                
     chisel3.iotesters.Driver.execute(Array("-td","/data/data/com.termux/files/home/generated/horie/CombinationalCircuit","--backend-name","verilator"),()=>new Multiplier4BitV2)(c=>new Multiplier4BitV2Test(c))
     }                                                                
class Multiplier4BitV2Test(c:Multiplier4BitV2) extends PeekPokeTester(c){
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
