circuit LeftShifter :
  module LeftShifter :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<4>, flip shiftAmount : UInt<2>, out : UInt<6>}

    node _io_out_T = dshl(io.in, io.shiftAmount) @[LeftShifter.scala 13:19]
    io.out <= _io_out_T @[LeftShifter.scala 13:10]

