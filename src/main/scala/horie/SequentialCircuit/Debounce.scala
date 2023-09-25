package horie.SequentialCircuit
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
import chisel3.iotesters._
import chisel3.util._

class Debounce(holdTime:Int=5) extends Module{
  val io = IO(new Bundle{
    val in = Input(Bool())
    val out = Output(Bool())
  })
  val reg1 = RegInit(0.U(1.W))
  reg1 := io.in
  val reg2 = RegInit(0.U(1.W))
  reg2 := reg1
  /*reg1,reg2用于探测上升沿和下降沿。
  只有在最后一个上升沿/下降沿到来后，连续5个时钟都是对应的电平，底下
  那两个计数器才会工作。从而保证onems_f是最后一个下降沿到来才触发的信号，
  onems_r是最后一个上升沿到来才触发的信号。通过这个机制过滤掉抖动。然后分别置位，复位sr_latch
  holdTime is cycles after last falling/rising edge to trigger output
  */
  val detectFallingEdge = (~reg1 & reg2)===1.U
  val detectRisingEdge = (~reg2 & reg1)===1.U
  //val holdTime = 5
  val (_,onems_f)=withReset(detectFallingEdge){
    Counter(io.in===false.B,holdTime)
  }
  val (_,onems_r)=withReset(detectRisingEdge){
    Counter(io.in===true.B,holdTime)
  }
  val sr_latch = Module(new SRLatch)
  sr_latch.io.reset := onems_f
  sr_latch.io.set := onems_r
  io.out := sr_latch.io.q
  //val (_,onems) = Counter(detectFallingEdge,1000000)
}

object Debounce{
  def apply(in:Bool):Bool={
    val debounce = Module(new Debounce)
    debounce.io.in := in
    debounce.io.out
  }
  def apply(holdTime:Int,in:Bool):Bool={
    val debounce = Module(new Debounce(holdTime))
    debounce.io.in := in
    debounce.io.out
  }
}

object DebounceObj extends App{
  (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/SequentialCircuit/Register","--no-check-comb-loops"),Seq(ChiselGeneratorAnnotation(()=>new Debounce)))
  chisel3.iotesters.Driver.execute(Array("-td","/data/data/com.termux/files/home/generated/horie/SequentialCircuit","--backend-name","verilator","--no-check-comb-loops"),()=>new Debounce)(c=>new DebounceTest(c))
}
class DebounceTest(c:Debounce) extends PeekPokeTester(c){
  poke(c.io.in,true)
  step(10)
  for(i<-0 to 20){
    poke(c.io.in,false)
    step(1)
    poke(c.io.in,true)
    step(1)
  }
  poke(c.io.in,false)
  step(30)
  poke(c.io.in,true)
  for(i<-0 to 20){
    poke(c.io.in,false)
    step(1)
    poke(c.io.in,true) 
    step(1)  
  }
  step(50)
}
