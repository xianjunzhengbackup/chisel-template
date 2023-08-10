circuit Mux4_2 :
  module Mux2 :
    input clock : Clock
    input reset : Reset
    output io : { flip sel : UInt<1>, flip in0 : UInt<1>, flip in1 : UInt<1>, out : UInt<1>}

    node _io_out_T = and(io.sel, io.in1) @[chapter3_模块与硬件类型.scala 92:25]
    node _io_out_T_1 = not(io.sel) @[chapter3_模块与硬件类型.scala 92:38]
    node _io_out_T_2 = and(_io_out_T_1, io.in0) @[chapter3_模块与硬件类型.scala 92:46]
    node _io_out_T_3 = or(_io_out_T, _io_out_T_2) @[chapter3_模块与硬件类型.scala 92:35]
    io.out <= _io_out_T_3 @[chapter3_模块与硬件类型.scala 92:14]

  module Mux2_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip sel : UInt<1>, flip in0 : UInt<1>, flip in1 : UInt<1>, out : UInt<1>}

    node _io_out_T = and(io.sel, io.in1) @[chapter3_模块与硬件类型.scala 92:25]
    node _io_out_T_1 = not(io.sel) @[chapter3_模块与硬件类型.scala 92:38]
    node _io_out_T_2 = and(_io_out_T_1, io.in0) @[chapter3_模块与硬件类型.scala 92:46]
    node _io_out_T_3 = or(_io_out_T, _io_out_T_2) @[chapter3_模块与硬件类型.scala 92:35]
    io.out <= _io_out_T_3 @[chapter3_模块与硬件类型.scala 92:14]

  module Mux2_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip sel : UInt<1>, flip in0 : UInt<1>, flip in1 : UInt<1>, out : UInt<1>}

    node _io_out_T = and(io.sel, io.in1) @[chapter3_模块与硬件类型.scala 92:25]
    node _io_out_T_1 = not(io.sel) @[chapter3_模块与硬件类型.scala 92:38]
    node _io_out_T_2 = and(_io_out_T_1, io.in0) @[chapter3_模块与硬件类型.scala 92:46]
    node _io_out_T_3 = or(_io_out_T, _io_out_T_2) @[chapter3_模块与硬件类型.scala 92:35]
    io.out <= _io_out_T_3 @[chapter3_模块与硬件类型.scala 92:14]

  module Mux4_2 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in0 : UInt<1>, flip in1 : UInt<1>, flip in2 : UInt<1>, flip in3 : UInt<1>, flip sel : UInt<2>, out : UInt<1>}

    inst Mux2 of Mux2 @[chapter3_模块与硬件类型.scala 153:41]
    Mux2.clock <= clock
    Mux2.reset <= reset
    inst Mux2_1 of Mux2_1 @[chapter3_模块与硬件类型.scala 153:41]
    Mux2_1.clock <= clock
    Mux2_1.reset <= reset
    inst Mux2_2 of Mux2_2 @[chapter3_模块与硬件类型.scala 153:41]
    Mux2_2.clock <= clock
    Mux2_2.reset <= reset
    wire m : { flip sel : UInt<1>, flip in0 : UInt<1>, flip in1 : UInt<1>, out : UInt<1>}[3] @[chapter3_模块与硬件类型.scala 153:22]
    m[0].out <= Mux2.io.out @[chapter3_模块与硬件类型.scala 153:22]
    Mux2.io.in1 <= m[0].in1 @[chapter3_模块与硬件类型.scala 153:22]
    Mux2.io.in0 <= m[0].in0 @[chapter3_模块与硬件类型.scala 153:22]
    Mux2.io.sel <= m[0].sel @[chapter3_模块与硬件类型.scala 153:22]
    m[1].out <= Mux2_1.io.out @[chapter3_模块与硬件类型.scala 153:22]
    Mux2_1.io.in1 <= m[1].in1 @[chapter3_模块与硬件类型.scala 153:22]
    Mux2_1.io.in0 <= m[1].in0 @[chapter3_模块与硬件类型.scala 153:22]
    Mux2_1.io.sel <= m[1].sel @[chapter3_模块与硬件类型.scala 153:22]
    m[2].out <= Mux2_2.io.out @[chapter3_模块与硬件类型.scala 153:22]
    Mux2_2.io.in1 <= m[2].in1 @[chapter3_模块与硬件类型.scala 153:22]
    Mux2_2.io.in0 <= m[2].in0 @[chapter3_模块与硬件类型.scala 153:22]
    Mux2_2.io.sel <= m[2].sel @[chapter3_模块与硬件类型.scala 153:22]
    node _m_0_sel_T = bits(io.sel, 0, 0) @[chapter3_模块与硬件类型.scala 154:25]
    m[0].sel <= _m_0_sel_T @[chapter3_模块与硬件类型.scala 154:16]
    m[0].in0 <= io.in0 @[chapter3_模块与硬件类型.scala 155:16]
    m[0].in1 <= io.in1 @[chapter3_模块与硬件类型.scala 156:16]
    node _m_1_sel_T = bits(io.sel, 0, 0) @[chapter3_模块与硬件类型.scala 158:25]
    m[1].sel <= _m_1_sel_T @[chapter3_模块与硬件类型.scala 158:16]
    m[1].in0 <= io.in2 @[chapter3_模块与硬件类型.scala 159:16]
    m[1].in1 <= io.in3 @[chapter3_模块与硬件类型.scala 160:16]
    node _m_2_sel_T = bits(io.sel, 1, 1) @[chapter3_模块与硬件类型.scala 162:25]
    m[2].sel <= _m_2_sel_T @[chapter3_模块与硬件类型.scala 162:16]
    m[2].in0 <= m[0].out @[chapter3_模块与硬件类型.scala 163:16]
    m[2].in1 <= m[1].out @[chapter3_模块与硬件类型.scala 164:16]
    io.out <= m[2].out @[chapter3_模块与硬件类型.scala 166:14]

