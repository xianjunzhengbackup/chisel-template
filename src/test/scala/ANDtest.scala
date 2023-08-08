package test
import chisel3.stage.chiselGeneratorAnnotation

object testMain extends App{
  (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/and"),Seq(ChiselGeneratorAnnotation(()=>new AND)))
}
