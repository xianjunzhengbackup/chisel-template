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
      reset => (UInt<1>("h0"), reg1) @[PS2.scala 24:21]
    reg1 <= io.ps2Clk @[PS2.scala 24:21]
    reg reg2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg2) @[PS2.scala 25:21]
    reg2 <= reg1 @[PS2.scala 25:21]
    node _stateChange_T = eq(reg2, UInt<1>("h1")) @[PS2.scala 26:27]
    node _stateChange_T_1 = eq(reg1, UInt<1>("h0")) @[PS2.scala 26:48]
    node stateChange = and(_stateChange_T, _stateChange_T_1) @[PS2.scala 26:39]
    reg state : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[PS2.scala 29:22]
    reg receiveCount : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[PS2.scala 33:29]
    when stateChange : @[PS2.scala 34:21]
      node _T = eq(UInt<2>("h0"), state) @[PS2.scala 35:19]
      when _T : @[PS2.scala 35:19]
        state <= UInt<2>("h1") @[PS2.scala 37:15]
        receiveCount <= UInt<1>("h0") @[PS2.scala 38:22]
      else :
        node _T_1 = eq(UInt<2>("h1"), state) @[PS2.scala 35:19]
        when _T_1 : @[PS2.scala 35:19]
          node _T_2 = eq(receiveCount, UInt<3>("h7")) @[PS2.scala 41:26]
          when _T_2 : @[PS2.scala 41:34]
            state <= UInt<2>("h2") @[PS2.scala 42:17]
            receiveCount <= UInt<1>("h0") @[PS2.scala 43:24]
          else :
            node _receiveCount_T = add(receiveCount, UInt<1>("h1")) @[PS2.scala 44:51]
            node _receiveCount_T_1 = tail(_receiveCount_T, 1) @[PS2.scala 44:51]
            receiveCount <= _receiveCount_T_1 @[PS2.scala 44:35]
        else :
          node _T_3 = eq(UInt<2>("h2"), state) @[PS2.scala 35:19]
          when _T_3 : @[PS2.scala 35:19]
            state <= UInt<2>("h3") @[PS2.scala 48:15]
            receiveCount <= UInt<1>("h0") @[PS2.scala 49:22]
          else :
            node _T_4 = eq(UInt<2>("h3"), state) @[PS2.scala 35:19]
            when _T_4 : @[PS2.scala 35:19]
              state <= UInt<2>("h0") @[PS2.scala 52:15]
              receiveCount <= UInt<1>("h0") @[PS2.scala 53:22]
    node _T_5 = eq(io.ps2Clk, UInt<1>("h0")) @[PS2.scala 57:34]
    node _T_6 = asClock(_T_5) @[PS2.scala 57:40]
    inst receiveBuffer of ShiftRegisterSIPO @[PS2.scala 58:11]
    receiveBuffer.clock <= _T_6
    receiveBuffer.reset <= reset
    receiveBuffer.io.shiftIn <= io.ps2Data @[PS2.scala 60:28]
    node _receiveBuffer_io_enable_T = eq(state, UInt<2>("h1")) @[PS2.scala 61:36]
    receiveBuffer.io.enable <= _receiveBuffer_io_enable_T @[PS2.scala 61:27]
    io.ps2Out <= receiveBuffer.io.q @[PS2.scala 62:13]

