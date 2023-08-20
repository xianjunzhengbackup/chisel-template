circuit Mux4 :
  module Mux2 :
    input clock : Clock
    input reset : Reset
    output io : { flip selector : UInt<1>, flip in_0 : UInt<1>, flip in_1 : UInt<1>, out : UInt<1>}

    node _io_out_T = not(io.selector) @[Mux2.scala 14:14]
    node _io_out_T_1 = and(_io_out_T, io.in_0) @[Mux2.scala 14:27]
    node _io_out_T_2 = and(io.selector, io.in_1) @[Mux2.scala 14:53]
    node _io_out_T_3 = or(_io_out_T_1, _io_out_T_2) @[Mux2.scala 14:38]
    io.out <= _io_out_T_3 @[Mux2.scala 14:10]

  module Mux2_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip selector : UInt<1>, flip in_0 : UInt<1>, flip in_1 : UInt<1>, out : UInt<1>}

    node _io_out_T = not(io.selector) @[Mux2.scala 14:14]
    node _io_out_T_1 = and(_io_out_T, io.in_0) @[Mux2.scala 14:27]
    node _io_out_T_2 = and(io.selector, io.in_1) @[Mux2.scala 14:53]
    node _io_out_T_3 = or(_io_out_T_1, _io_out_T_2) @[Mux2.scala 14:38]
    io.out <= _io_out_T_3 @[Mux2.scala 14:10]

  module Mux2_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip selector : UInt<1>, flip in_0 : UInt<1>, flip in_1 : UInt<1>, out : UInt<1>}

    node _io_out_T = not(io.selector) @[Mux2.scala 14:14]
    node _io_out_T_1 = and(_io_out_T, io.in_0) @[Mux2.scala 14:27]
    node _io_out_T_2 = and(io.selector, io.in_1) @[Mux2.scala 14:53]
    node _io_out_T_3 = or(_io_out_T_1, _io_out_T_2) @[Mux2.scala 14:38]
    io.out <= _io_out_T_3 @[Mux2.scala 14:10]

  module Mux4 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip selector : UInt<2>, flip in_0 : UInt<1>, flip in_1 : UInt<1>, flip in_2 : UInt<1>, flip in_3 : UInt<1>, out : UInt<1>}

    inst mux1 of Mux2 @[Mux4.scala 17:18]
    mux1.clock <= clock
    mux1.reset <= reset
    inst mux2 of Mux2_1 @[Mux4.scala 18:18]
    mux2.clock <= clock
    mux2.reset <= reset
    node _mux1_io_selector_T = bits(io.selector, 0, 0) @[Mux4.scala 19:33]
    mux1.io.selector <= _mux1_io_selector_T @[Mux4.scala 19:20]
    mux1.io.in_0 <= io.in_0 @[Mux4.scala 20:16]
    mux1.io.in_1 <= io.in_1 @[Mux4.scala 21:16]
    node _mux2_io_selector_T = bits(io.selector, 0, 0) @[Mux4.scala 22:33]
    mux2.io.selector <= _mux2_io_selector_T @[Mux4.scala 22:20]
    mux2.io.in_0 <= io.in_2 @[Mux4.scala 23:16]
    mux2.io.in_1 <= io.in_3 @[Mux4.scala 24:16]
    inst mux3 of Mux2_2 @[Mux4.scala 25:18]
    mux3.clock <= clock
    mux3.reset <= reset
    node _mux3_io_selector_T = bits(io.selector, 1, 1) @[Mux4.scala 26:34]
    mux3.io.selector <= _mux3_io_selector_T @[Mux4.scala 26:20]
    mux3.io.in_0 <= mux1.io.out @[Mux4.scala 27:16]
    mux3.io.in_1 <= mux2.io.out @[Mux4.scala 28:16]
    io.out <= mux3.io.out @[Mux4.scala 29:10]

