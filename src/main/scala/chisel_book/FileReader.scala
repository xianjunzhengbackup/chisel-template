package chisel_book
import chisel3._
import scala.io.Source

class FileReader extends Module{
  val io = IO(new Bundle{
    val address = Input(UInt(8.W))
    val data = Output(UInt(8.W))
  })
  val array = new Array[Int](256)
  var idx=0

  val source = Source.fromFile("/storage/emulated/0/Download/chisel-template/data.txt")
  for(line<-source.getLines()){
    array(idx) = line.toInt
    idx +=1
  }

  val table=VecInit(array.toIndexedSeq.map(_.U(8.W)))

  io.data := table(io.address)
}
object GenerateFileReader extends App{
  emitVerilog(new FileReader,Array("--target-dir","generated/chisel_book"))
}
