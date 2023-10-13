package chisel_book
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import chisel3.stage.PrintFullStackTraceAnnotation

class SamplingTest extends AnyFlatSpec with ChiselScalatestTester {
  val annos = Seq(WriteVcdAnnotation,PrintFullStackTraceAnnotation)
  it should "test Sampling Module from DebounceWithMajorityVoting" in {
    test(new Sampling(10)).withAnnotations(annos) { dut =>
        for(i <- 0 to 20 by 1){
          dut.io.din.poke(false.B)
          dut.clock.step(3)
          dut.io.din.poke(true.B)
          dut.clock.step(3)
          dut.io.din.poke(false.B)
          dut.clock.step()
          dut.io.din.poke(true.B)
          dut.clock.step()
          dut.io.din.poke(false.B)
          dut.clock.step()
          dut.io.din.poke(true.B)
          dut.clock.step(20)
        }
    }
  }
}


class DebounceWithMajorityVotingTest extends AnyFlatSpec with ChiselScalatestTester {
  val annos = Seq(WriteVcdAnnotation,PrintFullStackTraceAnnotation)
  it should "test DebounceWithMajorityVoting" in {
    test(new DebounceWithMajorityVoting(10)).withAnnotations(annos) { dut =>
        for(i <- 0 to 20 by 1){
          dut.io.din.poke(false.B)
          dut.clock.step(3)
          dut.io.din.poke(true.B)
          dut.clock.step(3)
          dut.io.din.poke(false.B)
          dut.clock.step()
          dut.io.din.poke(true.B)
          dut.clock.step()
          dut.io.din.poke(false.B)
          dut.clock.step()
          dut.io.din.poke(true.B)
          dut.clock.step(20)
        }
    }
  }
}
