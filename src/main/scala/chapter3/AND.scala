package chapter3

import chisel3._
import chisel3.stage.ChiselGeneratorAnnotation

class AND extends RawModule{
  val io = IO(new Bundle{
    val a = Input(UInt(1.W))
    val b = Input(UInt(1.W))
    val c = Output(UInt(1.W))
  })
  io.c := io.a & io.b
}

object testMain extends App{
  (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/and"),Seq(ChiselGeneratorAnnotation(()=>new AND)))
}
/*
Command to run:
sbt "runMain chapter3.testMain"
in chisel-template folder
 */