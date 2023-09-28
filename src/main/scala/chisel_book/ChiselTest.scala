package chisel_book

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class DeviceUnderTest extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(2.W))
    val b = Input(UInt(2.W))
    val out = Output(UInt(2.W))
    val equ = Output(Bool())
  })
  io.out := io.a & io.b
  io.equ := io.a ===io.b

  printf("dut: %d %d %d\n",io.a,io.b,io.out)
}

