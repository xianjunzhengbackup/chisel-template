package chisel_book
import chisel3._
import chisel3.util._
import math._

class Memory(CapacityInKByte:Int) extends Module{
  val width =(log10(CapacityInKByte)/log10(2)).toInt + 10 
  val io = IO(new Bundle{
    val rdAddr = Input(UInt(width.W))
    val rdData = Output(UInt(8.W))
    val wrAddr = Input(UInt(width.W))
    val wrData = Input(UInt(8.W))
    val wrEnable = Input(Bool())
  })
  val mem = SyncReadMem(CapacityInKByte * 1024,UInt(8.W))
  io.rdData := mem.read(io.rdAddr)

  when(io.wrEnable){
    mem.write(io.wrAddr,io.wrData)
  }
}

object GenerateMemory extends App{
  emitVerilog(new Memory(2),Array("--target-dir","generated/chisel_book"))
}
