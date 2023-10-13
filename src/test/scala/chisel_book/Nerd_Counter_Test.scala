package chisel_book
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import chisel3.stage.PrintFullStackTraceAnnotation

class NerdCounterTest extends AnyFlatSpec with ChiselScalatestTester {
  //以下这句，第一个参数决定使用verilator来模拟，第二个参数生成Vcd，第三个参数打印所有信息
//  val annos = Seq(VerilatorBackendAnnotation,WriteVcdAnnotation,PrintFullStackTraceAnnotation)
  
  val annos = Seq(WriteVcdAnnotation,PrintFullStackTraceAnnotation)
    it should "Test Nerd Counter" in {
    test(new NerdCounter(10)).withAnnotations(annos) { dut =>
        for(i <- 1 to 20 by 1){
          dut.clock.step()
          println(s" Done:" + dut.io.done.peekInt())
        }
    }
  }
}
