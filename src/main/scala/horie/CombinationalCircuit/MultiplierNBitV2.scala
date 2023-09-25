package horie.CombinationalCircuit                                  
import chisel3.stage.ChiselGeneratorAnnotation                     
import chisel3._
import chisel3.iotesters._                                         
import chisel3.util._              

class MultiplierNBitV2(val n:Int) extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(n.W))
    val b = Input(UInt(n.W))
    val result = Output(UInt((2*n).W))
  })
 val digits = VecInit(for(i<-0 to n-1)yield{
  io.a & Fill(n,io.b(i))
 })
  val adders = VecInit.fill(n-1)(Module(new AdderNBit(n)).io)
  for(i <- 0 to n-2){
    adders(i).a := digits(i+1)
    if(i==0) adders(i).b :=Cat(0.U,digits(0)(n-1,1))
    else adders(i).b := Cat(adders(i-1).carryOut,adders(i-1).sum(n-1,1))
    adders(i).carryIn :=0.U
  }
  val res_n_plus_1 = Cat(adders(n-2).carryOut,adders(n-2).sum)
  val res_n_minus_2 = Cat(for(i<-n-3 to 0 by -1) yield {adders(i).sum(0)})
  io.result := Cat(res_n_plus_1,res_n_minus_2,digits(0)(0))
}

object MultiplierNBitV2Obj extends App{
     (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/CombinationalCircuit/MultiplierNBit"),Seq(ChiselGeneratorAnnotation(()=>new MultiplierNBitV2(8))))
     chisel3.iotesters.Driver.execute(Array("-td","/data/data/com.termux/files/home/generated/horie/CombinationalCircuit","--backend-name","verilator"),()=>new MultiplierNBitV2(8))(c=>new MultiplierNBitV2Test(c))
     }
class MultiplierNBitV2Test(c:MultiplierNBitV2) extends PeekPokeTester(c){
         val startValue =(Math.pow(2,c.n)-1).toInt
         val endValue = startValue
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
