package chisel_book
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class ALUTest extends AnyFlatSpec with ChiselScalatestTester {
  "ALU" should "pass" in {
    test(new ALU)
      .withAnnotations(Seq(WriteVcdAnnotation)){ dut =>
      dut.io.a.poke(255.U)
      dut.io.b.poke(255.U)
      dut.io.fn.poke(0.U)
      dut.clock.step()
      val res1 = dut.io.y.peekInt()
      assert(res1==510)

      
      dut.io.fn.poke(1.U)
      dut.clock.step()
      val res2 = dut.io.y.peekInt()
      assert(res2==0)

      
      dut.io.fn.poke(2.U)
      dut.clock.step()
      val res3 = dut.io.y.peekInt()
      assert(res3==255)


      dut.io.fn.poke(3.U)
      dut.clock.step()
      val res4 = dut.io.y.peekInt()
      assert(res4==255)
    }
  }
}
