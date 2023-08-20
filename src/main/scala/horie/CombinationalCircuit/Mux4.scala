package horie.CombinationalCircuit

import chisel3._
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3.iotesters._

class Mux4 extends Module{

  val io = IO(new Bundle{
    val selector=Input(UInt(2.W))
    val in_0=Input(UInt(1.W))
    val in_1=Input(UInt(1.W))
    val in_2=Input(UInt(1.W))
    val in_3=Input(UInt(1.W))
    val out=Output(UInt(1.W))
  })
  val mux1=Module(new Mux2)
  val mux2=Module(new Mux2)
  mux1.io.selector :=io.selector(0)
  mux1.io.in_0 := io.in_0
  mux1.io.in_1 := io.in_1
  mux2.io.selector :=io.selector(0)
  mux2.io.in_0 := io.in_2
  mux2.io.in_1 := io.in_3
  val mux3=Module(new Mux2)
  mux3.io.selector := io.selector(1)
  mux3.io.in_0 := mux1.io.out
  mux3.io.in_1 := mux2.io.out
  io.out := mux3.io.out
}

object Mux4Obj extends App{
  (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/CombinationalCircuit/Mux4"),Seq(ChiselGeneratorAnnotation(()=>new Mux4 )))
  chisel3.iotesters.Driver.execute(args,()=>new Mux4)(c=>new Mux4Test(c))
}

class Mux4Test(c:Mux4) extends PeekPokeTester(c){
  for(sel <- 0 until 8){
    poke(c.io.in_0,0)
    poke(c.io.in_1,1)
    poke(c.io.in_2,0)
    poke(c.io.in_3,1)
    poke(c.io.selector,sel)
    step(1)
  }
  
}
