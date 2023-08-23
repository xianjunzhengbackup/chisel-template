package horie.CombinationalCircuit
import chisel3._
import chisel3.stage.ChiselGeneratorAnnotation
class HalfAdder extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(1.W))
    val b = Input(UInt(1.W))
    val sum = Output(UInt(1.W))
    val carryOut=Output(UInt(1.W))
  })
  io.sum := io.a ^ io.b
  io.carryOut := io.a & io.b
}

object HalfAdderObj extends App{                                 (new chisel3.stage.ChiselStage).execute(Array("--target-dir"    ,"generated/horie/CombinationalCircuit/HalfAdder"),Seq(ChiselGeneratorAnnotation(()=>new HalfAdder )))
}
