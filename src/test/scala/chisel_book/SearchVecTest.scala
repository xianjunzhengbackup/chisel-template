package chisel_book
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import chisel3.stage.PrintFullStackTraceAnnotation

class SearchVecTest extends AnyFlatSpec with ChiselScalatestTester {
  val annos = Seq(WriteVcdAnnotation,PrintFullStackTraceAnnotation)
  it should "test SearchVec" in {
    test(new SearchVec(10)).withAnnotations(annos) { dut =>
        for(i <- 9 to 0 by -1){
          dut.io.vec(i).poke(i.U)
          dut.clock.step()
          println(s"minimum value is "+dut.io.out.v.peekInt()+" and its index is " + dut.io.out.idx.peekInt())
        }
    }
  }
}
