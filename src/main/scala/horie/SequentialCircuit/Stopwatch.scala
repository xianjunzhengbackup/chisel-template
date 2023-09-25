package horie.SequentialCircuit
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
import chisel3.iotesters._
import chisel3.util._
import horie.CombinationalCircuit.Seg7LEDBundle

class Stopwatch extends Module{
  val io = IO(new Bundle{
    val startStop = Input(Bool())
    val seg7led=Output(new Seg7LEDBundle)
  })

  val ss = Debounce(io.startStop)
 
  //val (_,msTrigger) = Counter(~ss ,1000000)
  val (_,msTrigger) = Counter(~ss ,1)
  val (msCount,sTrigger)=Counter(msTrigger,100)
  val (sCount,mTrigger)=Counter(sTrigger,60)
  val (mCount,hTrigger)=Counter(mTrigger,60)
  val (hCount,_)=Counter(hTrigger,24)

  val seg = Module(new Seg7LED)
  io.seg7led := seg.io.seg7led
  seg.io.digits := VecInit(msCount%10.U,(msCount/10.U)(3,0),sCount%10.U,(sCount/10.U)(3,0),mCount%10.U,(mCount/10.U)(3,0),hCount%10.U,(hCount/10.U)(3,0))
}

object StopwatchObj extends App{  
  (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/SequentialCircuit/Register","--no-check-comb-loops"),Seq(ChiselGeneratorAnnotation(()=>new Stopwatch)))    
  chisel3.iotesters.Driver.execute(Array("-td","/data/data/com.termux/files/home/generated/horie/SequentialCircuit","--backend-name","verilator","--no-check-comb-loops"),()=>new Stopwatch)(c=>new StopwatchTest(c))     
}

class StopwatchTest(c:Stopwatch) extends PeekPokeTester(c){
  poke(c.io.startStop,true)
  step(10)
  poke(c.io.startStop,false)
  step(1000)
  poke(c.io.startStop,true)
  step(10)
  poke(c.io.startStop,false)
  step(1000)
  poke(c.io.startStop,true)
  step(10)
}
