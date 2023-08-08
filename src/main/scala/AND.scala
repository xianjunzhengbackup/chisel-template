package test
import chisel3._I
import chisel3.experimental._

class AND extends RawModule{
  val io = IO(new Bundle{
    val a = Input(UInt(1.W))
    val b = Input(UInt(1.W))
    val c = Output(UInt(1.W))
  })
  io.c := io.a & io.b
}
