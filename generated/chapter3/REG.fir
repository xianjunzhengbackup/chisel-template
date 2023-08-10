circuit REG :
  module REG :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<8>, flip en : UInt<1>, c : UInt<1>}

    reg reg0 : UInt, clock with :
      reset => (UInt<1>("h0"), reg0) @[chapter3_模块与硬件类型.scala 222:25]
    reg0 <= io.a @[chapter3_模块与硬件类型.scala 222:25]
    reg reg1 : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[chapter3_模块与硬件类型.scala 223:25]
    reg1 <= io.a @[chapter3_模块与硬件类型.scala 223:25]
    reg reg2 : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[chapter3_模块与硬件类型.scala 224:25]
    reg reg3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg3) @[chapter3_模块与硬件类型.scala 225:21]
    reg reg4 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg4) @[chapter3_模块与硬件类型.scala 226:21]
    node _reg5_T = add(io.a, UInt<1>("h1")) @[chapter3_模块与硬件类型.scala 227:33]
    node _reg5_T_1 = tail(_reg5_T, 1) @[chapter3_模块与硬件类型.scala 227:33]
    reg reg5 : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[Reg.scala 35:20]
    when io.en : @[Reg.scala 36:18]
      reg5 <= _reg5_T_1 @[Reg.scala 36:22]
    node _reg6_T = sub(io.a, UInt<1>("h1")) @[chapter3_模块与硬件类型.scala 228:33]
    node _reg6_T_1 = tail(_reg6_T, 1) @[chapter3_模块与硬件类型.scala 228:33]
    reg reg6 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg6) @[Reg.scala 19:16]
    when io.en : @[Reg.scala 20:18]
      reg6 <= _reg6_T_1 @[Reg.scala 20:22]
    reg reg7_r : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[Reg.scala 35:20]
    when io.en : @[Reg.scala 36:18]
      reg7_r <= io.a @[Reg.scala 36:22]
    reg reg7_r_1 : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[Reg.scala 35:20]
    when io.en : @[Reg.scala 36:18]
      reg7_r_1 <= reg7_r @[Reg.scala 36:22]
    reg reg7 : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[Reg.scala 35:20]
    when io.en : @[Reg.scala 36:18]
      reg7 <= reg7_r_1 @[Reg.scala 36:22]
    reg reg8_r : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg8_r) @[Reg.scala 19:16]
    when io.en : @[Reg.scala 20:18]
      reg8_r <= io.a @[Reg.scala 20:22]
    reg reg8_r_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg8_r_1) @[Reg.scala 19:16]
    when io.en : @[Reg.scala 20:18]
      reg8_r_1 <= reg8_r @[Reg.scala 20:22]
    reg reg8 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg8) @[Reg.scala 19:16]
    when io.en : @[Reg.scala 20:18]
      reg8 <= reg8_r_1 @[Reg.scala 20:22]
    node _reg2_T = andr(io.a) @[chapter3_模块与硬件类型.scala 232:20]
    reg2 <= _reg2_T @[chapter3_模块与硬件类型.scala 232:12]
    node _reg3_T = orr(io.a) @[chapter3_模块与硬件类型.scala 233:20]
    reg3 <= _reg3_T @[chapter3_模块与硬件类型.scala 233:12]
    node _T = bits(reset, 0, 0) @[chapter3_模块与硬件类型.scala 235:18]
    when _T : @[chapter3_模块与硬件类型.scala 235:26]
      reg4 <= UInt<1>("h0") @[chapter3_模块与硬件类型.scala 236:14]
    else :
      reg4 <= UInt<1>("h1") @[chapter3_模块与硬件类型.scala 238:14]
    node _io_c_T = bits(reg0, 0, 0) @[chapter3_模块与硬件类型.scala 241:19]
    node _io_c_T_1 = bits(reg1, 0, 0) @[chapter3_模块与硬件类型.scala 241:29]
    node _io_c_T_2 = and(_io_c_T, _io_c_T_1) @[chapter3_模块与硬件类型.scala 241:23]
    node _io_c_T_3 = bits(reg2, 0, 0) @[chapter3_模块与硬件类型.scala 241:39]
    node _io_c_T_4 = and(_io_c_T_2, _io_c_T_3) @[chapter3_模块与硬件类型.scala 241:33]
    node _io_c_T_5 = bits(reg3, 0, 0) @[chapter3_模块与硬件类型.scala 241:49]
    node _io_c_T_6 = and(_io_c_T_4, _io_c_T_5) @[chapter3_模块与硬件类型.scala 241:43]
    node _io_c_T_7 = bits(reg4, 0, 0) @[chapter3_模块与硬件类型.scala 241:59]
    node _io_c_T_8 = and(_io_c_T_6, _io_c_T_7) @[chapter3_模块与硬件类型.scala 241:53]
    node _io_c_T_9 = bits(reg5, 0, 0) @[chapter3_模块与硬件类型.scala 241:69]
    node _io_c_T_10 = and(_io_c_T_8, _io_c_T_9) @[chapter3_模块与硬件类型.scala 241:63]
    node _io_c_T_11 = bits(reg6, 0, 0) @[chapter3_模块与硬件类型.scala 241:79]
    node _io_c_T_12 = and(_io_c_T_10, _io_c_T_11) @[chapter3_模块与硬件类型.scala 241:73]
    node _io_c_T_13 = bits(reg7, 0, 0) @[chapter3_模块与硬件类型.scala 241:89]
    node _io_c_T_14 = and(_io_c_T_12, _io_c_T_13) @[chapter3_模块与硬件类型.scala 241:83]
    node _io_c_T_15 = bits(reg8, 0, 0) @[chapter3_模块与硬件类型.scala 241:99]
    node _io_c_T_16 = and(_io_c_T_14, _io_c_T_15) @[chapter3_模块与硬件类型.scala 241:93]
    io.c <= _io_c_T_16 @[chapter3_模块与硬件类型.scala 241:12]

