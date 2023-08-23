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

    node _out_0_1_T = bits(io.selector, 0, 0) @[Mux4.scala 31:32]
    inst out_0_1_mux2 of Mux2 @[Mux2.scala 19:22]
    out_0_1_mux2.clock <= clock
    out_0_1_mux2.reset <= reset
    out_0_1_mux2.io.selector <= _out_0_1_T @[Mux2.scala 20:22]
    out_0_1_mux2.io.in_0 <= io.in_0 @[Mux2.scala 21:18]
    out_0_1_mux2.io.in_1 <= io.in_1 @[Mux2.scala 22:18]
    node _out_2_3_T = bits(io.selector, 0, 0) @[Mux4.scala 32:32]
    inst out_2_3_mux2 of Mux2_1 @[Mux2.scala 19:22]
    out_2_3_mux2.clock <= clock
    out_2_3_mux2.reset <= reset
    out_2_3_mux2.io.selector <= _out_2_3_T @[Mux2.scala 20:22]
    out_2_3_mux2.io.in_0 <= io.in_2 @[Mux2.scala 21:18]
    out_2_3_mux2.io.in_1 <= io.in_3 @[Mux2.scala 22:18]
    node _io_out_T = bits(io.selector, 1, 1) @[Mux4.scala 33:28]
    inst io_out_mux2 of Mux2_2 @[Mux2.scala 19:22]
    io_out_mux2.clock <= clock
    io_out_mux2.reset <= reset
    io_out_mux2.io.selector <= _io_out_T @[Mux2.scala 20:22]
    io_out_mux2.io.in_0 <= out_0_1_mux2.io.out @[Mux2.scala 21:18]
    io_out_mux2.io.in_1 <= out_2_3_mux2.io.out @[Mux2.scala 22:18]
    io.out <= io_out_mux2.io.out @[Mux4.scala 33:9]

