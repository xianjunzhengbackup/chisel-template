circuit Reg4Bit :
  module Reg4Bit :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip resetN : UInt<1>, flip in : UInt<4>, flip enable : UInt<1>, out : UInt<4>}

    node _T = not(io.resetN) @[Reg4Bit.scala 14:13]
    reg io_out_r : UInt<4>, clock with :
      reset => (_T, UInt<4>("h0")) @[Reg.scala 35:20]
    when io.enable : @[Reg.scala 36:18]
      io_out_r <= io.in @[Reg.scala 36:22]
    io.out <= io_out_r @[Reg4Bit.scala 15:12]

