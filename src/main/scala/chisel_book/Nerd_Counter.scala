package chisel_book
import chisel3._
import chisel3.util._
import math._

class NerdCounter(i:Int) extends Module{
  val io = IO(new Bundle{
    val done = Output(Bool())
  })

  val bits =(log10(i)/log10(2)).toInt + 1 

  val minus_1 = (pow(2,bits)).toInt - 1
  val cntReg = RegInit(i.U(bits.W))
  val adder = minus_1.U(bits.W) + cntReg

  io.done := cntReg === 0.U

  val next = Mux(io.done,i.U(bits.W),adder)

  cntReg := next
}
