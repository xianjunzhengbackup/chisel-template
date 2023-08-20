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
object Mux2Obj extends App{
  (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generatd/"),Seq(ChiselGeneratorAnnotation(()=>new Mux2)))
}
