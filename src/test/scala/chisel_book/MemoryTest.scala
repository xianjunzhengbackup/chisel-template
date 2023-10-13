package chisel_book
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import chisel3.stage.PrintFullStackTraceAnnotation

class MemoryTest extends AnyFlatSpec with ChiselScalatestTester {
  val annos = Seq(WriteVcdAnnotation,PrintFullStackTraceAnnotation)
  it should "test Memory module" in {
    test(new Memory(1)).withAnnotations(annos) { dut =>
        for(i <- 1 to 1024 by 1){
          val data = (i & 255).U
          dut.io.wrData.poke(data)
          dut.io.wrAddr.poke((i-1).U)
          dut.io.wrEnable.poke(true.B)
          dut.clock.step(1)
        }
        dut.io.wrEnable.poke(false.B)
        dut.clock.step(1)
        for(i<- 1 to 1024 by 1){
          dut.io.rdAddr.poke((i-1).U)
          dut.clock.step()
          val out = dut.io.rdData.peekInt()
          val data=i & 255
          assert(out==data)
          println(s"$out")
        }
    }
  }
}
