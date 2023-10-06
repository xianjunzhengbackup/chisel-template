package chisel_book
import chisel3._
import chisel3.util._
import chisel3.stage.ChiselGeneratorAnnotation

class BUFGCE extends BlackBox(Map("SIM_DEVICE" -> "7SERIES")){
  val io = IO(new Bundle{
    val I = Input(Clock())
    val CE = Input(Bool())
    val O = Output(Clock())
  })
}

/*class alt_inbuf extends ExtModule(Map("io_standard" ->"1.0V",
                                      "location" ->"IOBANK_1",
                                      "enable_bus_hold"->"on",
                                      "weak_pull_up_resistor"->"off",
                                      "termination"->"parallet 50 ohms")){
  val io = IO(new Bundle{
    val i = Input(Bool())
    val o = Output(Bool())
  })
}*/

class BlackBoxAdderIO extends Bundle{
  val a = Input(UInt(32.W))
  val b = Input(UInt(32.W))
  val cin = Input(Bool())
  val c = Output(UInt(32.W))
  val cout = Output(Bool())
}

class InlineBlackBoxAdder extends HasBlackBoxInline{
  val io = IO(new BlackBoxAdderIO)
  setInline("InlineBlackBoxAdder.v",
    s"""
    |module InlineBlackBoxAdder(a,b,cin,c,cout);
    |input [31:0] a,b;
    |input cin;
    |output [31:0] c;
    |output cout;
    |wire [32:0] sum;
    |
    |assign sum = a + b + cin;
    |assing c = sum[31:0];
    |assign cout = sum[32];
    |
    |endmodule
    """.stripMargin)
}

class BlackBoxWrapper extends Module{
  val io = IO(new BlackBoxAdderIO)
  val bb = Module(new InlineBlackBoxAdder)
  io <> bb.io
  //bb.io.a := io.a
  //bb.io.b := io.b
  //bb.io.cin := io.cin
  //io.cout := bb.io.cout
  //io.c := bb.io.c
}

object OneMoreGenerateInlineBlackBoxAdder extends App{
  emitVerilog(new BlackBoxWrapper,
    Array("--target-dir","generated/chisel_book"))
}
/*object GenerateInlineBlackBoxAdder extends App{
  (new chisel3.stage.ChiselStage).execute(Array("--target-dir","generated/chisel_book/","--no-check-comb-loops"),Seq(ChiselGeneratorAnnotation(()=>new BlackBoxWrapper)))
}*/

class PathBlackBoxAdder extends HasBlackBoxPath{
  val io = IO(new BlackBoxAdderIO)
  addPath("./generated/chisel_book/InlineBlackBoxAdder.v")
}

class PathBlackBoxAdderWrapper extends Module{
  val io = IO(new BlackBoxAdderIO)
  val pb=Module(new PathBlackBoxAdder)
  io <> pb.io
}
