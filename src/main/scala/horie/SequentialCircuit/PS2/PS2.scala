package horie.SequentialCircuit.PS2
import horie.SequentialCircuit.PS2.ShiftRegisterSIPO
import horie.SequentialCircuit.PS2.Synchronizer
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3._
import chisel3.iotesters._
import chisel3.util._

//def genCounter (n: Int) = {
//  val cntReg = RegInit (0.U(8.W))
//  cntReg := Mux( cntReg === n.U, 0.U, cntReg + 1.U)
//  cntReg
//}
class PS2 extends Module{
  val io = IO(new Bundle{
    val ps2Data = Input(Bool())
    val ps2Clk = Input(Bool())
    val ps2Out = Output(UInt(8.W))
  })
//  val clk = Synchronizer(io.ps2Clk)
//  val data = Synchronizer(io.ps2Data)
  val clk = io.ps2Clk
  val data = io.ps2Data
  val reg1 = RegNext(clk)
  val reg2 = RegNext(reg1)
  val stateChange = (reg2 === true.B) && (reg1 === false.B)

  val sIdle :: sReceive :: sParity :: sStop :: Nil = Enum(4)
  val state = RegInit(sIdle)
//  val (receiveCount, receiveFinish) = withClock(clk.asClock){
//    Counter(state === sReceive, 8)
//  }
  val receiveCount = RegInit(0.U(4.W))
  when(stateChange) {
    switch(state) {
      is(sIdle) {
        state := sReceive
        receiveCount := 0.U
      }
      is(sReceive) {
        when(receiveCount===7.U) {
          state := sParity
          receiveCount := 0.U
        }.otherwise {receiveCount := receiveCount + 1.U}

      }
      is(sParity) {
        state := sStop
        receiveCount := 0.U
      }
      is(sStop) {
        state := sIdle
        receiveCount := 0.U
      }
    }
  }
  val receiveBuffer = withClock((!clk).asClock) {
    Module(new ShiftRegisterSIPO(8))
  }
  receiveBuffer.io.shiftIn := data
  receiveBuffer.io.enable := state === sReceive
  io.ps2Out := receiveBuffer.io.q
}

object PS2Obj extends App{
    (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/horie/SequentialCircuit/horie/PS2","--full-stacktrace"),Seq(ChiselGeneratorAnnotation(()=>new PS2)))
    chisel3.iotesters.Driver.execute(Array("-td","/data/data/com.termux/files/home/generated/horie/SequentialCircuit/horie/PS2","--backend-name","verilator"),()=>new PS2)(c=>new PS2Test(c))
}

class PS2Test(c:PS2) extends PeekPokeTester(c){
  def sendOneByte(n:Int)={
    val nn = n & 255
    
    poke(c.io.ps2Clk,true)
    poke(c.io.ps2Data,true)
    step(20)

    //send start bit
    poke(c.io.ps2Data,false)
    step(2)
    poke(c.io.ps2Clk,false)
    step(5)

    for(i<-7 to 0 by -1){
      val mask = 1 << i
    
      if((nn & mask) == mask) poke(c.io.ps2Data,true)
      else poke(c.io.ps2Data,false)
      poke(c.io.ps2Clk,true)
      step(5)
      poke(c.io.ps2Clk,false)
      step(5)
    }

    //send parity bit
    poke(c.io.ps2Data,true)
    poke(c.io.ps2Clk,true)
    step(5)
    poke(c.io.ps2Clk,false)
    step(5)

    //send stop bit
    poke(c.io.ps2Data, true)
    poke(c.io.ps2Clk, true)
    step(5)
    poke(c.io.ps2Clk, false)
    step(5)


    poke(c.io.ps2Clk,true)
    step(20)
  }

  for(i<-10 to 20){
    sendOneByte(i)
  }
}
