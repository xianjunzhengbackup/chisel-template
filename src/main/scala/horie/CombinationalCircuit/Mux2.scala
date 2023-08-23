package horie.CombinationalCircuit

import chisel3._
import chisel3.stage.ChiselGeneratorAnnotation

class Mux2 extends Module{
  val io = IO(new Bundle{
    val selector = Input(UInt(1.W))
    val in_0 = Input(UInt(1.W))
    val in_1 = Input(UInt(1.W))
    val out = Output(UInt(1.W))
  })

  io.out := (~io.selector & io.in_0) | (io.selector & io.in_1)
}

object Mux2{
  def apply(selector:UInt,in_0:UInt,in_1:UInt):UInt={
    val mux2 = Module(new Mux2())
    mux2.io.selector := selector
    mux2.io.in_0 := in_0
    mux2.io.in_1 := in_1
    mux2.io.out
  }
}
object Mux2Obj extends App{
  (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generatd/"),Seq(ChiselGeneratorAnnotation(()=>new Mux2)))
}
