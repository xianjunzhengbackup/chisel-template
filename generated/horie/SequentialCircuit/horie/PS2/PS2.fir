circuit PS2 :
  module ShiftRegisterSIPO :
    input clock : Clock
    input reset : Reset
    output io : { flip shiftIn : UInt<1>, flip enable : UInt<1>, q : UInt<8>}

    reg regs : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[ShiftRegisterSIPO.scala 21:21]
    when io.enable : @[ShiftRegisterSIPO.scala 22:18]
      node _regs_T = bits(regs, 6, 0) @[ShiftRegisterSIPO.scala 23:17]
      node _regs_T_1 = cat(_regs_T, io.shiftIn) @[ShiftRegisterSIPO.scala 23:27]
      regs <= _regs_T_1 @[ShiftRegisterSIPO.scala 23:10]
    io.q <= regs @[ShiftRegisterSIPO.scala 25:8]

  module PS2 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip ps2Data : UInt<1>, flip ps2Clk : UInt<1>, ps2Out : UInt<8>}

    reg reg1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg1) @[PS2.scala 20:21]
    reg1 <= io.ps2Clk @[PS2.scala 20:21]
    reg reg2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg2) @[PS2.scala 21:21]
    reg2 <= reg1 @[PS2.scala 21:21]
    node _stateChange_T = eq(reg2, UInt<1>("h1")) @[PS2.scala 22:26]
    node _stateChange_T_1 = eq(reg1, UInt<1>("h0")) @[PS2.scala 22:45]
    node stateChange = and(_stateChange_T, _stateChange_T_1) @[PS2.scala 22:37]
    reg state : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[PS2.scala 24:22]
    node _T = asClock(io.ps2Clk) @[PS2.scala 25:50]
    node _T_1 = eq(state, UInt<2>("h1")) @[PS2.scala 26:18]
    reg receiveCount : UInt<3>, _T with :
      reset => (reset, UInt<3>("h0")) @[Counter.scala 61:40]
    wire receiveFinish : UInt<1> @[Counter.scala 117:24]
    receiveFinish <= UInt<1>("h0") @[Counter.scala 117:24]
    when _T_1 : @[Counter.scala 118:16]
      node wrap_wrap = eq(receiveCount, UInt<3>("h7")) @[Counter.scala 73:24]
      node _wrap_value_T = add(receiveCount, UInt<1>("h1")) @[Counter.scala 77:24]
      node _wrap_value_T_1 = tail(_wrap_value_T, 1) @[Counter.scala 77:24]
      receiveCount <= _wrap_value_T_1 @[Counter.scala 77:15]
      receiveFinish <= wrap_wrap @[Counter.scala 118:23]
    when stateChange : @[PS2.scala 28:20]
      node _T_2 = eq(UInt<2>("h0"), state) @[PS2.scala 29:22]
      when _T_2 : @[PS2.scala 29:22]
        state <= UInt<2>("h1") @[PS2.scala 31:25]
      else :
        node _T_3 = eq(UInt<2>("h1"), state) @[PS2.scala 29:22]
        when _T_3 : @[PS2.scala 29:22]
          when receiveFinish : @[PS2.scala 35:38]
            state <= UInt<2>("h2") @[PS2.scala 36:27]
        else :
          node _T_4 = eq(UInt<2>("h2"), state) @[PS2.scala 29:22]
          when _T_4 : @[PS2.scala 29:22]
            state <= UInt<2>("h0") @[PS2.scala 40:25]
    node _T_5 = asClock(io.ps2Clk) @[PS2.scala 45:37]
    inst receiveBuffer of ShiftRegisterSIPO @[PS2.scala 45:52]
    receiveBuffer.clock <= _T_5
    receiveBuffer.reset <= reset
    receiveBuffer.io.shiftIn <= io.ps2Data @[PS2.scala 46:28]
    node _receiveBuffer_io_enable_T = eq(state, UInt<2>("h1")) @[PS2.scala 47:34]
    receiveBuffer.io.enable <= _receiveBuffer_io_enable_T @[PS2.scala 47:27]
    io.ps2Out <= receiveBuffer.io.q @[PS2.scala 48:13]

