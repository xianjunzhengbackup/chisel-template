package test
import chisel3.stage.ChiselGeneratorAnnotation

object ANdRawModuleMain extends App{

  (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/AndRawModule"),Seq(ChiselGeneratorAnnotation(()=>new AndModule)))
  (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/AndRawModule"),Seq(ChiselGeneratorAnnotation(()=>new AndRawModule)))
  (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/AndRawModule"),Seq(ChiselGeneratorAnnotation(()=>new AndMultiIOModule)))
}
