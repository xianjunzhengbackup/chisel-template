package chisel_book
import chisel3._
import chisel3.util._

abstract class Ticker(n:Int) extends Module{
  val io=IO(new Bundle{
    val tick=Output(Bool())
  })
}

class UpTicker(n:Int) extends Ticker(n){
  val N=(n-1).U
  val cntReg=RegInit((n-1).U(8.W))

  cntReg := cntReg + 1.U
  val tick = cntReg === N
  when(tick){
    cntReg :=0.U
  }
  io.tick := tick
}

class DownTicker(n:Int) extends Ticker(n){
  val N=(n-1).U
  val cntReg = RegInit(0.U(8.W))

  cntReg := cntReg - 1.U
  val tick= cntReg === 0.U
  when(tick){
    cntReg := N
  }
  io.tick := tick
}

class NerdTicker(n:Int) extends Ticker(n){
  val N=n
  val MAX=(N-2).S(8.W)
  val cntReg=RegInit(MAX)
  io.tick := false.B

  cntReg :=cntReg -1.S
  when(cntReg(7)){
    cntReg := MAX
    io.tick := true.B
  }
}
