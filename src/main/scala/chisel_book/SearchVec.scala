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
  /*
  val vecTwo = Wire(Vec(n,new Two()))
  for(i<-0 to n-1){
    vecTwo(i).v := io.vec(i)
    vecTwo(i).idx := i.U
  }
  io.out := vecTwo.reduceTree((x,y)=>Mux(x.v < y.v,x,y))*/
 val resFun=io.vec.zipWithIndex.map((x)=>(x._1,x._2.U)).reduce((x,y)=>(Mux(x._1 < y._1,x._1,y._1),Mux(x._1 < y._1,x._2,y._2)))
 io.out.v :=resFun._1
 io.out.idx :=resFun._2
}

object GenerateSearchVec extends App{
  emitVerilog(new SearchVec(10),Array("--target-dir","generated/chisel_book","PrintFullStackTraceAnnotation"))
}


class SearchVecWithHighOrderFunc(n:Int,f:(UInt,UInt)=>Bool) extends Module{
  val io = IO(new Bundle{
    val vec =Input(Vec(n,UInt(8.W)))
    val out = Output(new Two)
  })
  /*
  val vecTwo = Wire(Vec(n,new Two()))
  for(i<-0 to n-1){
    vecTwo(i).v := io.vec(i)
    vecTwo(i).idx := i.U
  }
  io.out := vecTwo.reduceTree((x,y)=>Mux(x.v < y.v,x,y))*/
 val resFun=io.vec.zipWithIndex.map((x)=>(x._1,x._2.U)).reduce((x,y)=>(Mux(f(x._1,y._1),x._1,y._1),Mux(f(x._1,y._1),x._2,y._2)))
 io.out.v :=resFun._1
 io.out.idx :=resFun._2
}
object GenerateSearchVecWithHighOrderFunc extends App{
  val searchForHign:(UInt,UInt)=>Bool = {(x,y)=>x>y}
  emitVerilog(new SearchVecWithHighOrderFunc(10,(x:UInt,y:UInt)=>x>y),Array("--target-dir","generated/chisel_book","PrintFullStackTraceAnnotation"))
}
