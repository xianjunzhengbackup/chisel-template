package horie.CombinationalCircuit
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
import chisel3.iotesters._
import chisel3.util._

class Multiplier4BitV3 extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(4.W))
    val b = Input(UInt(4.W))
    val result = Output(UInt(8.W))
  })
/*
  val digit0 = Wire(UInt(4.W))
  val digit1 = Wire(UInt(4.W))
  val digit2 = Wire(UInt(4.W))
  val digit3 = Wire(UInt(4.W))
  digit0 :=io.a & Fill(4,io.b(0))
  digit1 :=io.a & Fill(4,io.b(1))
  digit2 :=io.a & Fill(4,io.b(2))
  digit3 :=io.a & Fill(4,io.b(3))*/
 val digits = Wire(Vec(4,UInt(4.W)))
 for(i<-0 to 3){
    digits(i) := io.a & Fill(4,io.b(i))
 }
  val adders = VecInit.fill(3)(Module(new Adder4Bit).io)
  for(i <- 0 to 2){
    adders(i).a := digits(i+1)
    if(i==0) adders(i).b :=Cat(0.U,digits(0)(3,1))
    else adders(i).b := Cat(adders(i-1).carryOut,adders(i-1).sum(3,1))
    adders(i).carryIn :=0.U
  }
  io.result := Cat(adders(2).carryOut,adders(2).sum,adders(1).sum(0),adders(0).sum(0),digits(0)(0))
  /*
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
  */
}

object Multiplier4BitV3Obj extends App{
     (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/CombinationalCircuit/Multiplier4BitV3"),Seq(ChiselGeneratorAnnotation(()=>new Multiplier4BitV3)))                
     chisel3.iotesters.Driver.execute(Array("-td","/data/data/com.termux/files/home/generated/horie/CombinationalCircuit","--backend-name","verilator"),()=>new Multiplier4BitV3)(c=>new Multiplier4BitV3Test(c))
     }                                                                
class Multiplier4BitV3Test(c:Multiplier4BitV3) extends PeekPokeTester(c){
         val startValue =15
         val endValue = 15
          for{
             a <- 0 to startValue
              b <-0 to endValue
        }{
              poke(c.io.a,a)
              poke(c.io.b,b)
              step(1)
              val expectValue =a * b
              expect(c.io.result,expectValue)
          }
  }
