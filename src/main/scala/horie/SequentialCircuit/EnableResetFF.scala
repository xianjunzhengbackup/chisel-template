package horie.SequentialCircuit
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
import chisel3.iotesters._

class EnableResetFF extends Module{
  val io=IO(new Bundle{
    val clock=Input(Bool())
    val reset=Input(Bool())
    val enable=Input(Bool())
    val data=Input(Bool())
    val q=Output(Bool())
  })

  val dFF=Module(new DFlipFlop)
  dFF.io.clock :=io.clock
  dFF.io.data := (~io.reset & io.enable & io.data) 
  io.q :=dFF.io.q
}

object EnableResetFFObj extends App{    
  (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/SequentialCircuit/LatchAndFlipFlop","--no-check-comb-loops"),Seq(ChiselGeneratorAnnotation(()=>new EnableResetFF)))
  chisel3.iotesters.Driver.execute(Array("-td","/data/data/com.termux/files/home/generated/horie/SequentialCircuit","--backend-name","verilator","--no-check-comb-loops"),()=>new EnableResetFF)(c=>new EnableResetFFTest(c))
}

class EnableResetFFTest(c:EnableResetFF) extends PeekPokeTester(c){  
  for{ 
    i <- 0 to 3
    }{ 
      poke(c.io.clock,false)                                  
      poke(c.io.data,true)                                   
      poke(c.io.enable,true)
      poke(c.io.reset,false)
      step(1)                                                
      poke(c.io.clock,true)
      step(1)

      poke(c.io.clock,false)
      poke(c.io.data,true)
      poke(c.io.reset,true)                           
      step(1)                                                 
      poke(c.io.clock,true)                                   
      step(1)
      poke(c.io.clock,false)                  
      step(1)                                                  
      poke(c.io.clock,true)                                   
      step(1)
      poke(c.io.clock,false)                                  
      poke(c.io.data,true)                                    
      poke(c.io.reset,false)
      step(1)                                             
      poke(c.io.clock,true)                                 
      step(1)  
      poke(c.io.data,false)
      poke(c.io.clock,false)
      step(1)
      poke(c.io.clock,true)
      step(1)
    }
}
