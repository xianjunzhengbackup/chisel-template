package horie.SequentialCircuit.KitchenTimer
import horie.CombinationalCircuit.Seg7LEDBundle  
import horie.SequentialCircuit.Debounce
import chisel3.stage.ChiselGeneratorAnnotation 
import chisel3._        
import chisel3.iotesters._     
import chisel3.util._

class KitchenTimer extends Module{
  val io=IO(new Bundle{
    val min=Input(Bool())
    val sec=Input(Bool())
    val startStop=Input(Bool())
    val seg7led=Output(new Seg7LEDBundle)
  })
  val sTimeSet :: sRun :: sPause :: sFin :: Nil = Enum(4)
  val state = RegInit(sTimeSet)

  //detecting falling edge
  val reg1 = RegInit(true.B)
  val reg2 = RegInit(true.B)
  reg1 := Debounce(io.startStop)
  reg2 := reg1
  val stateChange =(reg1===false.B) && (reg2===true.B)
  
  //detecting min key falling edge
  val min_reg1 = RegInit(true.B)
  val min_reg2 = RegInit(true.B)
  min_reg1 := Debounce(io.min)
  min_reg2 := min_reg1
  val minChange =(min_reg1===false.B) && (min_reg2===true.B)
  //detecting sec key falling edge
  val sec_reg1 = RegInit(true.B)
  val sec_reg2 = RegInit(true.B)
  sec_reg1 := Debounce(io.sec)
  sec_reg2 := sec_reg1
  val secChange =(sec_reg1===false.B) && (sec_reg2===true.B)

  val time=Module(new Time)
  time.io.incMin := (state===sTimeSet || state===sPause) && minChange
  time.io.incSec := (state===sTimeSet || state===sPause) && secChange
  time.io.countDown :=state===sRun

  when(stateChange){
    switch(state){
      is(sTimeSet){
        when(!time.io.zero){
          state := sRun
        }
      }
      is(sRun){
        state := sPause
      }

      is(sPause){
        state := sRun
      }
      is(sFin){
        state := sTimeSet
      }
    }
  }.elsewhen(state===sRun && time.io.zero){
    state :=sFin
  }
  val seg7LED = Module(new Seg7LED)
  seg7LED.io.digits := VecInit(List(time.io.sec % 10.U,
    (time.io.sec / 10.U)(3,0),
    time.io.min % 10.U,
    (time.io.min / 10.U)(3,0))
    ::: List.fill(4){0.U(4.W)})
  seg7LED.io.blink :=(state===sFin)
  io.seg7led :=seg7LED.io.seg7led
}

object KitchenTimerObj extends App{        
  (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/SequentialCircuit/KitechTimer","--no-check-comb-loops"),Seq(ChiselGeneratorAnnotation(()=>new KitchenTimer)))
  chisel3.iotesters.Driver.execute(Array("-td","/data/data/com.termux/files/home/generated/horie/KitchenTimer","--backend-name","verilator","--no-check-comb-loops"),()=>new KitchenTimer)(c=>new KitchenTimerTest(c))
}

class KitchenTimerTest(c:KitchenTimer) extends PeekPokeTester(c){
  poke(c.io.min,true)
  poke(c.io.sec,true)
  poke(c.io.startStop,true)
  step(10)
  poke(c.io.min,false)
  step(10)
  poke(c.io.min,true)
  step(10)
  poke(c.io.startStop,false)
  step(10)
  poke(c.io.startStop,true)
  step(200)
  
  poke(c.io.startStop,false)
  step(10)
  poke(c.io.startStop,true)
  step(10)
  
  poke(c.io.sec,false)
  step(10)
  poke(c.io.sec,true)
  step(10)
  poke(c.io.sec,false)
  step(10)
  poke(c.io.sec,true)
  step(10)
  
  poke(c.io.startStop,false)
  step(10)
  poke(c.io.startStop,true)
  step(100)
}
