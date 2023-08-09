package test
import chisel3._

class AndRawModule extends RawModule{

  val ioBundle = IO(new Bundle{
    val a = Input(UInt(1.W))
    val b = Input(UInt(1.W))
  })
  val c = IO(Output(UInt(1.W)))
  c := ioBundle.a & ioBundle.b
}

class AndMultiIOModule extends MultiIOModule{

  val io = IO(new Bundle{
    val a = Input(UInt(1.W))
    val c = Output(UInt(1.W))
  })
  val iob = IO(Input(UInt(1.W)))
  io.c := io.a & iob
}

class AndModule  extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(1.W))
    val b = Input(UInt(1.W))
    val c = Output(UInt(1.W))
  })
  io.c := io.a & io.b
}
