package chisel_book
import chisel3._

class Adder extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(8.W))
    val b = Input(UInt(8.W))
    val y = Output(UInt(8.W))
  })

  io.y := io.a + io.b
}

class Register extends Module{
  val io = IO(new Bundle{
    val d = Input(UInt(8.W))
    val q = Output(UInt(8.W))
  })

  val r = RegInit(0.U(8.W))
  r := io.d
  io.q := r
}

class Count10 extends Module{
  val io = IO(new Bundle{
    val dout = Output(UInt(8.W))
  })

  val a = Module(new Adder)
  val r = Module(new Register)

  a.io.a := 1.U
  a.io.b := r.io.q
   
  val m= Mux(r.io.q>=9.U,0.U(8.W),a.io.y)
  r.io.d := m

  io.dout := r.io.q

  printf("dout is %d\n",io.dout)
}
