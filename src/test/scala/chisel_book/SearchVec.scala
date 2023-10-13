package chisel_book
import chisel3._

class Two extends Bundle{
  val v = UInt(8.W)
  val idx = UInt(8.W)
}
class SearchVec(n:Int) extends Module{
  val io = IO(new Bundle{
    val vec =Input(Vec(n,UInt(8.W)))
    val out = Output(new Two)
  })
  val vecTwo = Wire(Vec(n,new Two()))
  for(i<-0 to n-1){
    vecTwo(i).v := io.vec(i)
    vecTwo(i).idx := i.U
  }
  io.out := vecTwo.reduceTree((x,y)=>Mux(x.v < y.v),x,y)
}

object GenerateSearchVec extends App{
  emitVerilog(new SearchVec(10),Array("--target-dir","generated/chisel_book","PrintFullStackTraceAnnotation"))
}
