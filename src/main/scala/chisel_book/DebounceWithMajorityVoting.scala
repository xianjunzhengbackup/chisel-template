package chisel_book
import chisel3._
import chisel3.util._

class Sampling(SamFreq:Int=1000000) extends Module{
  val io = IO(new Bundle{
    val din = Input(Bool())
    val out = Output(Bool())
  })
  val dinSync = RegNext(RegNext(io.din))
  
  val dinDebReg=Reg(Bool())
  val cntReg = RegInit(0.U(32.W))
  val tick = cntReg === (SamFreq-1).U
  cntReg := cntReg + 1.U
  when(tick){
    cntReg :=0.U
    dinDebReg := dinSync
  }

  io.out := dinDebReg
}

class DebounceWithMajorityVoting(SamFreq:Int=1000000) extends Module{
  val io = IO(new Bundle{
    val din = Input(Bool())
    val out = Output(Bool())
  })

  val sampler = Module(new Sampling(SamFreq))
  sampler.io.din := io.din
  val syncDin = sampler.io.out

  val votingReg = RegInit(0.U(3.W))
  
  val cntReg=RegInit(0.U(32.W))
  val tick = cntReg === (SamFreq-1).U
  cntReg := cntReg + 1.U

  when(tick){
    cntReg := 0.U
    votingReg := votingReg(1,0) ## syncDin.asUInt
  }

  io.out := ((votingReg(2)&votingReg(1)) || (votingReg(2)&votingReg(0)) || (votingReg(1)&votingReg(0))).asBool
}
