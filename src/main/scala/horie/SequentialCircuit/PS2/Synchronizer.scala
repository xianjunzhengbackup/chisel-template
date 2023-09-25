package horie.SequentialCircuit.PS2
import chisel3._
import chisel3.util._

class Synchronizer extends Module{
  val io = IO(new Bundle{
    val d = Input(Bool())
    val q = Output(Bool())
  })

  val reg1 = RegNext(io.d)
  val reg2 = RegNext(reg1)

  io.q := reg2
}

object Synchronizer {
  def apply(d:Bool)={
    val syn = Module(new Synchronizer)
    syn.io.d := d
    syn.io.q
  }
}
