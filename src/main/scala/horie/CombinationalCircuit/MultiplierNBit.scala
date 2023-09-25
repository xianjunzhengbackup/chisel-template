package horie.CombinationalCircuit                                  
import chisel3.stage.ChiselGeneratorAnnotation                     
import chisel3._
import chisel3.iotesters._                                         
import chisel3.util._              

class MultiplierNBit(val n:Int) extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(n.W))
    val b = Input(UInt(n.W))
    val result = Output(UInt((2*n).W))
  })
  val digits = Wire(Vec(n,UInt(n.W)))
  for(i<-0 to n-1){
    digits(i) := io.a & Fill(n,io.b(i))
  }
  val adders = VecInit.fill(n-1)(Module(new AdderNBit(n)).io)
  for(i <- 0 to n-2){
    adders(i).a := digits(i+1)
    if(i==0) adders(i).b :=Cat(0.U,digits(0)(n-1,1))
    else adders(i).b := Cat(adders(i-1).carryOut,adders(i-1).sum(n-1,1))
    adders(i).carryIn :=0.U
  }
  val res_wire = Wire(Vec(2*n,UInt(1.W)))
  res_wire(2*n-1) := adders(n-2).carryOut
  for(i<-n-1 to 2*n-2) res_wire(i) := adders(n-2).sum(i-n+1)
  //res_wire(2*n-1,n-1) := Cat(adders(n-2).carryOut,adders(n-2).sum)
  for(i<-0 to n-2){
    if(i==0) res_wire(0) := digits(0)(0)
    else res_wire(i) := adders(i-1).sum(0)
  }
  io.result := res_wire.asUInt
  //io.result := Cat(adders(2).carryOut,adders(2).sum,adders(1).sum(0),adders(0).sum(0),digits(0)(0))
}

object MultiplierNBitObj extends App{
     (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/CombinationalCircuit/MultiplierNBit"),Seq(ChiselGeneratorAnnotation(()=>new MultiplierNBit(8))))
     chisel3.iotesters.Driver.execute(Array("-td","/data/data/com.termux/files/home/generated/horie/CombinationalCircuit","--backend-name","verilator"),()=>new MultiplierNBit(8))(c=>new MultiplierNBitTest(c))
     }
class MultiplierNBitTest(c:MultiplierNBit) extends PeekPokeTester(c){
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
