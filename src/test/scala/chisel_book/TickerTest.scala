package chisel_book
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

trait TickerTestFunc{
  def testFn[T<:Ticker](dut:T,n:Int)={
    var count = -1
    for(_<-0 to n*3){
      if(count > 0)
        dut.io.tick.expect(false.B)
      else if(count == 0)
        dut.io.tick.expect(true.B)

      if(dut.io.tick.peekBoolean())
        count = n-1
      else 
        count -=1

      dut.clock.step()
    }
  }
}
class TickerTest extends AnyFlatSpec with ChiselScalatestTester with TickerTestFunc{
  "UpTicker 5" should "pass" in {
    test(new UpTicker(5))
      .withAnnotations(Seq(WriteVcdAnnotation)){ dut=>
        testFn(dut,5)
    }
  }
  "DownTicker 7" should "pass" in{
    test(new DownTicker(7))
      .withAnnotations(Seq(WriteVcdAnnotation)){ dut=>
        testFn(dut,7)
   }
  }
  "NerdTicker 7" should "pass" in{
    test(new NerdTicker(7))
      .withAnnotations(Seq(WriteVcdAnnotation)){ dut=>
        testFn(dut,7)
   }
  }
}
