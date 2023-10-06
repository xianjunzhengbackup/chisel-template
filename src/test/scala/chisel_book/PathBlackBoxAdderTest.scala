package chisel_book
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class PathBlackBoxAdderTest extends AnyFlatSpec with ChiselScalatestTester {
  "DUT" should "pass" in {
    test(new PathBlackBoxAdderWrapper)
      .withAnnotations(Seq(WriteVcdAnnotation)){ dut =>
        for(i <- 32 to 32-10 by -1){
          dut.io.a.poke(i.U)
          dut.io.b.poke(10.U)
          dut.io.cin.poke(1.U)

          dut.clock.step()
          println(s"a: $i, b:10, cin:1 c:"+dut.io.c.peekInt())
          println("cout:"+dut.io.cout.peekInt())
        }
    }
  }
}


class InlineBlackBoxAdderTest extends AnyFlatSpec with ChiselScalatestTester {
  "DUT" should "pass" in {
    test(new Module{
      val io=IO(new BlackBoxAdderIO)
      val adder = Module(new InlineBlackBoxAdder)
      io <> adder.io
      }){ dut =>
        for(i <- 32 to 32-10 by -1){
          dut.io.a.poke(i.U)
          dut.io.b.poke(10.U)
          dut.io.cin.poke(1.U)

          dut.clock.step()
          println(s"a: $i, b:10, cin:1 c:"+dut.io.c.peekInt())
          println("cout:"+dut.io.cout.peekInt())
        }
    }
  }
}
