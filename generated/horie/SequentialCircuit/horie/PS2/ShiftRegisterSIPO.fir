circuit ShiftRegisterSIPO :
  module ShiftRegisterSIPO :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip shiftIn : UInt<1>, flip enable : UInt<1>, q : UInt<8>}

    reg regs : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[ShiftRegisterSIPO.scala 21:21]
    when io.enable : @[ShiftRegisterSIPO.scala 22:18]
      node _regs_T = bits(regs, 6, 0) @[ShiftRegisterSIPO.scala 23:17]
      node _regs_T_1 = cat(_regs_T, io.shiftIn) @[ShiftRegisterSIPO.scala 23:27]
      regs <= _regs_T_1 @[ShiftRegisterSIPO.scala 23:10]
    io.q <= regs @[ShiftRegisterSIPO.scala 25:8]

