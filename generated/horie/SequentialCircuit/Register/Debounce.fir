circuit Debounce :
  module SRLatch :
    input clock : Clock
    input reset : Reset
    output io : { flip set : UInt<1>, flip reset : UInt<1>, q : UInt<1>, notQ : UInt<1>}

    node _io_q_T = or(io.reset, io.notQ) @[SRLatch.scala 13:22]
    node _io_q_T_1 = not(_io_q_T) @[SRLatch.scala 13:11]
    io.q <= _io_q_T_1 @[SRLatch.scala 13:8]
    node _io_notQ_T = or(io.set, io.q) @[SRLatch.scala 14:23]
    node _io_notQ_T_1 = not(_io_notQ_T) @[SRLatch.scala 14:14]
    io.notQ <= _io_notQ_T_1 @[SRLatch.scala 14:11]

  module Debounce :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<1>, out : UInt<1>}

    reg reg1 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Debounce.scala 12:21]
    reg1 <= io.in @[Debounce.scala 13:8]
    reg reg2 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Debounce.scala 14:21]
    reg2 <= reg1 @[Debounce.scala 15:8]
    node _detectFallingEdge_T = not(reg1) @[Debounce.scala 16:28]
    node _detectFallingEdge_T_1 = and(_detectFallingEdge_T, reg2) @[Debounce.scala 16:34]
    node detectFallingEdge = eq(_detectFallingEdge_T_1, UInt<1>("h1")) @[Debounce.scala 16:41]
    node _detectRisingEdge_T = not(reg2) @[Debounce.scala 17:27]
    node _detectRisingEdge_T_1 = and(_detectRisingEdge_T, reg1) @[Debounce.scala 17:33]
    node detectRisingEdge = eq(_detectRisingEdge_T_1, UInt<1>("h1")) @[Debounce.scala 17:40]
    node _onems_f_T = eq(io.in, UInt<1>("h0")) @[Debounce.scala 19:18]
    reg onems_f_c_value : UInt<3>, clock with :
      reset => (detectFallingEdge, UInt<3>("h0")) @[Counter.scala 61:40]
    wire onems_f : UInt<1> @[Counter.scala 117:24]
    onems_f <= UInt<1>("h0") @[Counter.scala 117:24]
    when _onems_f_T : @[Counter.scala 118:16]
      node onems_f_wrap_wrap = eq(onems_f_c_value, UInt<3>("h4")) @[Counter.scala 73:24]
      node _onems_f_wrap_value_T = add(onems_f_c_value, UInt<1>("h1")) @[Counter.scala 77:24]
      node _onems_f_wrap_value_T_1 = tail(_onems_f_wrap_value_T, 1) @[Counter.scala 77:24]
      onems_f_c_value <= _onems_f_wrap_value_T_1 @[Counter.scala 77:15]
      when onems_f_wrap_wrap : @[Counter.scala 87:20]
        onems_f_c_value <= UInt<1>("h0") @[Counter.scala 87:28]
      onems_f <= onems_f_wrap_wrap @[Counter.scala 118:23]
    node _onems_r_T = eq(io.in, UInt<1>("h1")) @[Debounce.scala 22:18]
    reg onems_r_c_value : UInt<3>, clock with :
      reset => (detectRisingEdge, UInt<3>("h0")) @[Counter.scala 61:40]
    wire onems_r : UInt<1> @[Counter.scala 117:24]
    onems_r <= UInt<1>("h0") @[Counter.scala 117:24]
    when _onems_r_T : @[Counter.scala 118:16]
      node onems_r_wrap_wrap = eq(onems_r_c_value, UInt<3>("h4")) @[Counter.scala 73:24]
      node _onems_r_wrap_value_T = add(onems_r_c_value, UInt<1>("h1")) @[Counter.scala 77:24]
      node _onems_r_wrap_value_T_1 = tail(_onems_r_wrap_value_T, 1) @[Counter.scala 77:24]
      onems_r_c_value <= _onems_r_wrap_value_T_1 @[Counter.scala 77:15]
      when onems_r_wrap_wrap : @[Counter.scala 87:20]
        onems_r_c_value <= UInt<1>("h0") @[Counter.scala 87:28]
      onems_r <= onems_r_wrap_wrap @[Counter.scala 118:23]
    inst sr_latch of SRLatch @[Debounce.scala 24:24]
    sr_latch.clock <= clock
    sr_latch.reset <= reset
    sr_latch.io.reset <= onems_f @[Debounce.scala 25:21]
    sr_latch.io.set <= onems_r @[Debounce.scala 26:19]
    io.out <= sr_latch.io.q @[Debounce.scala 27:10]

