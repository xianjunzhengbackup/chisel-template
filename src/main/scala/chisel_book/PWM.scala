package chisel_book
import chisel3._
import chisel3.util._

class PWM extends Module{
  val io = IO(new Bundle{
    val high = Input(UInt(4.W))
    val out = Output(Bool())
  })
  //high is high cycles in every 10 cycles.
  //so duty varies from 10% ->...90%

  val counter = RegInit(0.U(4.W))

  when(counter =/= 9.U){
    counter := counter + 1.U
  }.otherwise{
    counter := 0.U
  }

  when(counter <=io.high){
    io.out := true.B
  }.otherwise{
    io.out := false.B
  }
}
