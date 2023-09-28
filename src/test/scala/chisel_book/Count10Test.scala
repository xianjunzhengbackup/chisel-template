package chisel_book
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

 class Count10Test extends AnyFlatSpec with ChiselScalatestTester{
    "Count10" should "pass" in {
        test(new Count10)
          .withAnnotations(Seq(WriteVcdAnnotation)){ dut =>
            dut.clock.step(30)
      }
    }
  }
