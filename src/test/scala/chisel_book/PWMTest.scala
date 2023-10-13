package chisel_book
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import chisel3.stage.PrintFullStackTraceAnnotation

class PWMTest extends AnyFlatSpec with ChiselScalatestTester {
  val annos = Seq(WriteVcdAnnotation,PrintFullStackTraceAnnotation)
  it should "test PWM module" in {
    test(new PWM).withAnnotations(annos) { dut =>
      for(i<-1 to 10){
        dut.io.high.poke(i.U)
        dut.clock.step(25)
      }
    }
  }
}
