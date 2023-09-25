package horie.SequentialCircuit.KitchenTimer

import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
import chisel3.iotesters._
import chisel3.util._

object Time{
  val sexagesimalWidth =(log2Floor(59)+1).W
}

class Time extends Module{
  val io = IO(new Bundle{
    val incMin = Input(Bool())
    val incSec = Input(Bool())
    val countDown = Input(Bool())
    val min = Output(UInt(Time.sexagesimalWidth))
    val sec=Output(UInt(Time.sexagesimalWidth))
    val zero = Output(Bool())
  })
  val min = RegInit(0.U(Time.sexagesimalWidth))
  when(io.incMin){
    when(min===59.U){
      min :=0.U
    }.otherwise{
      min :=min + 1.U
    }
  }

  val sec = RegInit(0.U(Time.sexagesimalWidth))
  when(io.incSec){
    when(sec===59.U){
      sec := 0.U
    }.otherwise{
      sec := sec + 1.U
    }
  }
  val zero = Wire(Bool())
  val (count,oneSec) = Counter(io.countDown && !zero,2)
  //val (count,oneSec) = Counter(io.countDown && !zero,100000000)
  zero := min===0.U && sec===0.U && count===0.U

  when(io.countDown && oneSec){
    when(sec===0.U){
      when(min =/= 0.U){
        min := min - 1.U
        sec :=59.U
      }
    }.otherwise{
      sec := sec - 1.U
    }
  }
  io.min :=min
  io.sec := sec
  io.zero := zero
}


