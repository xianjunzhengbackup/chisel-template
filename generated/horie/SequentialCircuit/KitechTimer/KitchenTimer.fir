circuit KitchenTimer :
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
    input reset : Reset
    output io : { flip in : UInt<1>, out : UInt<1>}

    reg reg1 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Debounce.scala 12:21]
    reg1 <= io.in @[Debounce.scala 13:8]
    reg reg2 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Debounce.scala 14:21]
    reg2 <= reg1 @[Debounce.scala 15:8]
    node _detectFallingEdge_T = not(reg1) @[Debounce.scala 22:28]
    node _detectFallingEdge_T_1 = and(_detectFallingEdge_T, reg2) @[Debounce.scala 22:34]
    node detectFallingEdge = eq(_detectFallingEdge_T_1, UInt<1>("h1")) @[Debounce.scala 22:41]
    node _detectRisingEdge_T = not(reg2) @[Debounce.scala 23:27]
    node _detectRisingEdge_T_1 = and(_detectRisingEdge_T, reg1) @[Debounce.scala 23:33]
    node detectRisingEdge = eq(_detectRisingEdge_T_1, UInt<1>("h1")) @[Debounce.scala 23:40]
    node _onems_f_T = eq(io.in, UInt<1>("h0")) @[Debounce.scala 26:18]
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
    node _onems_r_T = eq(io.in, UInt<1>("h1")) @[Debounce.scala 29:18]
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
    inst sr_latch of SRLatch @[Debounce.scala 31:24]
    sr_latch.clock <= clock
    sr_latch.reset <= reset
    sr_latch.io.reset <= onems_f @[Debounce.scala 32:21]
    sr_latch.io.set <= onems_r @[Debounce.scala 33:19]
    io.out <= sr_latch.io.q @[Debounce.scala 34:10]

  module SRLatch_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip set : UInt<1>, flip reset : UInt<1>, q : UInt<1>, notQ : UInt<1>}

    node _io_q_T = or(io.reset, io.notQ) @[SRLatch.scala 13:22]
    node _io_q_T_1 = not(_io_q_T) @[SRLatch.scala 13:11]
    io.q <= _io_q_T_1 @[SRLatch.scala 13:8]
    node _io_notQ_T = or(io.set, io.q) @[SRLatch.scala 14:23]
    node _io_notQ_T_1 = not(_io_notQ_T) @[SRLatch.scala 14:14]
    io.notQ <= _io_notQ_T_1 @[SRLatch.scala 14:11]

  module Debounce_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<1>, out : UInt<1>}

    reg reg1 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Debounce.scala 12:21]
    reg1 <= io.in @[Debounce.scala 13:8]
    reg reg2 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Debounce.scala 14:21]
    reg2 <= reg1 @[Debounce.scala 15:8]
    node _detectFallingEdge_T = not(reg1) @[Debounce.scala 22:28]
    node _detectFallingEdge_T_1 = and(_detectFallingEdge_T, reg2) @[Debounce.scala 22:34]
    node detectFallingEdge = eq(_detectFallingEdge_T_1, UInt<1>("h1")) @[Debounce.scala 22:41]
    node _detectRisingEdge_T = not(reg2) @[Debounce.scala 23:27]
    node _detectRisingEdge_T_1 = and(_detectRisingEdge_T, reg1) @[Debounce.scala 23:33]
    node detectRisingEdge = eq(_detectRisingEdge_T_1, UInt<1>("h1")) @[Debounce.scala 23:40]
    node _onems_f_T = eq(io.in, UInt<1>("h0")) @[Debounce.scala 26:18]
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
    node _onems_r_T = eq(io.in, UInt<1>("h1")) @[Debounce.scala 29:18]
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
    inst sr_latch of SRLatch_1 @[Debounce.scala 31:24]
    sr_latch.clock <= clock
    sr_latch.reset <= reset
    sr_latch.io.reset <= onems_f @[Debounce.scala 32:21]
    sr_latch.io.set <= onems_r @[Debounce.scala 33:19]
    io.out <= sr_latch.io.q @[Debounce.scala 34:10]

  module SRLatch_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip set : UInt<1>, flip reset : UInt<1>, q : UInt<1>, notQ : UInt<1>}

    node _io_q_T = or(io.reset, io.notQ) @[SRLatch.scala 13:22]
    node _io_q_T_1 = not(_io_q_T) @[SRLatch.scala 13:11]
    io.q <= _io_q_T_1 @[SRLatch.scala 13:8]
    node _io_notQ_T = or(io.set, io.q) @[SRLatch.scala 14:23]
    node _io_notQ_T_1 = not(_io_notQ_T) @[SRLatch.scala 14:14]
    io.notQ <= _io_notQ_T_1 @[SRLatch.scala 14:11]

  module Debounce_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<1>, out : UInt<1>}

    reg reg1 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Debounce.scala 12:21]
    reg1 <= io.in @[Debounce.scala 13:8]
    reg reg2 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Debounce.scala 14:21]
    reg2 <= reg1 @[Debounce.scala 15:8]
    node _detectFallingEdge_T = not(reg1) @[Debounce.scala 22:28]
    node _detectFallingEdge_T_1 = and(_detectFallingEdge_T, reg2) @[Debounce.scala 22:34]
    node detectFallingEdge = eq(_detectFallingEdge_T_1, UInt<1>("h1")) @[Debounce.scala 22:41]
    node _detectRisingEdge_T = not(reg2) @[Debounce.scala 23:27]
    node _detectRisingEdge_T_1 = and(_detectRisingEdge_T, reg1) @[Debounce.scala 23:33]
    node detectRisingEdge = eq(_detectRisingEdge_T_1, UInt<1>("h1")) @[Debounce.scala 23:40]
    node _onems_f_T = eq(io.in, UInt<1>("h0")) @[Debounce.scala 26:18]
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
    node _onems_r_T = eq(io.in, UInt<1>("h1")) @[Debounce.scala 29:18]
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
    inst sr_latch of SRLatch_2 @[Debounce.scala 31:24]
    sr_latch.clock <= clock
    sr_latch.reset <= reset
    sr_latch.io.reset <= onems_f @[Debounce.scala 32:21]
    sr_latch.io.set <= onems_r @[Debounce.scala 33:19]
    io.out <= sr_latch.io.q @[Debounce.scala 34:10]

  module Time :
    input clock : Clock
    input reset : Reset
    output io : { flip incMin : UInt<1>, flip incSec : UInt<1>, flip countDown : UInt<1>, min : UInt<6>, sec : UInt<6>, zero : UInt<1>}

    reg min : UInt<6>, clock with :
      reset => (reset, UInt<6>("h0")) @[Time.scala 21:20]
    when io.incMin : @[Time.scala 22:18]
      node _T = eq(min, UInt<6>("h3b")) @[Time.scala 23:13]
      when _T : @[Time.scala 23:21]
        min <= UInt<1>("h0") @[Time.scala 24:11]
      else :
        node _min_T = add(min, UInt<1>("h1")) @[Time.scala 26:17]
        node _min_T_1 = tail(_min_T, 1) @[Time.scala 26:17]
        min <= _min_T_1 @[Time.scala 26:11]
    reg sec : UInt<6>, clock with :
      reset => (reset, UInt<6>("h0")) @[Time.scala 30:20]
    when io.incSec : @[Time.scala 31:18]
      node _T_1 = eq(sec, UInt<6>("h3b")) @[Time.scala 32:13]
      when _T_1 : @[Time.scala 32:21]
        sec <= UInt<1>("h0") @[Time.scala 33:11]
      else :
        node _sec_T = add(sec, UInt<1>("h1")) @[Time.scala 35:18]
        node _sec_T_1 = tail(_sec_T, 1) @[Time.scala 35:18]
        sec <= _sec_T_1 @[Time.scala 35:11]
    wire zero : UInt<1> @[Time.scala 38:18]
    node _T_2 = eq(zero, UInt<1>("h0")) @[Time.scala 39:48]
    node _T_3 = and(io.countDown, _T_2) @[Time.scala 39:45]
    reg count : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Counter.scala 61:40]
    wire oneSec : UInt<1> @[Counter.scala 117:24]
    oneSec <= UInt<1>("h0") @[Counter.scala 117:24]
    when _T_3 : @[Counter.scala 118:16]
      node wrap_wrap = eq(count, UInt<1>("h1")) @[Counter.scala 73:24]
      node _wrap_value_T = add(count, UInt<1>("h1")) @[Counter.scala 77:24]
      node _wrap_value_T_1 = tail(_wrap_value_T, 1) @[Counter.scala 77:24]
      count <= _wrap_value_T_1 @[Counter.scala 77:15]
      oneSec <= wrap_wrap @[Counter.scala 118:23]
    node _zero_T = eq(min, UInt<1>("h0")) @[Time.scala 41:14]
    node _zero_T_1 = eq(sec, UInt<1>("h0")) @[Time.scala 41:27]
    node _zero_T_2 = and(_zero_T, _zero_T_1) @[Time.scala 41:21]
    node _zero_T_3 = eq(count, UInt<1>("h0")) @[Time.scala 41:42]
    node _zero_T_4 = and(_zero_T_2, _zero_T_3) @[Time.scala 41:34]
    zero <= _zero_T_4 @[Time.scala 41:8]
    node _T_4 = and(io.countDown, oneSec) @[Time.scala 43:21]
    when _T_4 : @[Time.scala 43:31]
      node _T_5 = eq(sec, UInt<1>("h0")) @[Time.scala 44:13]
      when _T_5 : @[Time.scala 44:20]
        node _T_6 = neq(min, UInt<1>("h0")) @[Time.scala 45:16]
        when _T_6 : @[Time.scala 45:24]
          node _min_T_2 = sub(min, UInt<1>("h1")) @[Time.scala 46:20]
          node _min_T_3 = tail(_min_T_2, 1) @[Time.scala 46:20]
          min <= _min_T_3 @[Time.scala 46:13]
          sec <= UInt<6>("h3b") @[Time.scala 47:13]
      else :
        node _sec_T_2 = sub(sec, UInt<1>("h1")) @[Time.scala 50:18]
        node _sec_T_3 = tail(_sec_T_2, 1) @[Time.scala 50:18]
        sec <= _sec_T_3 @[Time.scala 50:11]
    io.min <= min @[Time.scala 53:10]
    io.sec <= sec @[Time.scala 54:10]
    io.zero <= zero @[Time.scala 55:11]

  module Seg7LED :
    input clock : Clock
    input reset : Reset
    output io : { flip digits : UInt<4>[8], flip blink : UInt<1>, seg7led : { cathodes : UInt<7>, decimalPoint : UInt<1>, anodes : UInt<8>}}

    reg digitChangeCount : UInt<17>, clock with :
      reset => (reset, UInt<17>("h0")) @[Counter.scala 61:40]
    wire digitChange : UInt<1> @[Counter.scala 117:24]
    digitChange <= UInt<1>("h0") @[Counter.scala 117:24]
    when UInt<1>("h1") : @[Counter.scala 118:16]
      node wrap_wrap = eq(digitChangeCount, UInt<17>("h1869f")) @[Counter.scala 73:24]
      node _wrap_value_T = add(digitChangeCount, UInt<1>("h1")) @[Counter.scala 77:24]
      node _wrap_value_T_1 = tail(_wrap_value_T, 1) @[Counter.scala 77:24]
      digitChangeCount <= _wrap_value_T_1 @[Counter.scala 77:15]
      when wrap_wrap : @[Counter.scala 87:20]
        digitChangeCount <= UInt<1>("h0") @[Counter.scala 87:28]
      digitChange <= wrap_wrap @[Counter.scala 118:23]
    reg digitIndex : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[Counter.scala 61:40]
    wire digitWrap : UInt<1> @[Counter.scala 117:24]
    digitWrap <= UInt<1>("h0") @[Counter.scala 117:24]
    when digitChange : @[Counter.scala 118:16]
      node wrap_wrap_1 = eq(digitIndex, UInt<3>("h7")) @[Counter.scala 73:24]
      node _wrap_value_T_2 = add(digitIndex, UInt<1>("h1")) @[Counter.scala 77:24]
      node _wrap_value_T_3 = tail(_wrap_value_T_2, 1) @[Counter.scala 77:24]
      digitIndex <= _wrap_value_T_3 @[Counter.scala 77:15]
      digitWrap <= wrap_wrap_1 @[Counter.scala 118:23]
    node _io_seg7led_cathodes_T = eq(io.digits[digitIndex], UInt<1>("h0")) @[Seg7LED.scala 19:15]
    node _io_seg7led_cathodes_T_1 = eq(io.digits[digitIndex], UInt<1>("h1")) @[Seg7LED.scala 20:15]
    node _io_seg7led_cathodes_T_2 = eq(io.digits[digitIndex], UInt<2>("h2")) @[Seg7LED.scala 21:15]
    node _io_seg7led_cathodes_T_3 = eq(io.digits[digitIndex], UInt<2>("h3")) @[Seg7LED.scala 22:15]
    node _io_seg7led_cathodes_T_4 = eq(io.digits[digitIndex], UInt<3>("h4")) @[Seg7LED.scala 23:15]
    node _io_seg7led_cathodes_T_5 = eq(io.digits[digitIndex], UInt<3>("h5")) @[Seg7LED.scala 24:15]
    node _io_seg7led_cathodes_T_6 = eq(io.digits[digitIndex], UInt<3>("h6")) @[Seg7LED.scala 25:15]
    node _io_seg7led_cathodes_T_7 = eq(io.digits[digitIndex], UInt<3>("h7")) @[Seg7LED.scala 26:15]
    node _io_seg7led_cathodes_T_8 = eq(io.digits[digitIndex], UInt<4>("h8")) @[Seg7LED.scala 27:15]
    node _io_seg7led_cathodes_T_9 = eq(io.digits[digitIndex], UInt<4>("h9")) @[Seg7LED.scala 28:15]
    node _io_seg7led_cathodes_T_10 = eq(io.digits[digitIndex], UInt<4>("ha")) @[Seg7LED.scala 29:15]
    node _io_seg7led_cathodes_T_11 = eq(io.digits[digitIndex], UInt<4>("hb")) @[Seg7LED.scala 30:15]
    node _io_seg7led_cathodes_T_12 = eq(io.digits[digitIndex], UInt<4>("hc")) @[Seg7LED.scala 31:15]
    node _io_seg7led_cathodes_T_13 = eq(io.digits[digitIndex], UInt<4>("hd")) @[Seg7LED.scala 32:15]
    node _io_seg7led_cathodes_T_14 = eq(io.digits[digitIndex], UInt<4>("he")) @[Seg7LED.scala 33:15]
    node _io_seg7led_cathodes_T_15 = eq(io.digits[digitIndex], UInt<4>("hf")) @[Seg7LED.scala 34:15]
    node _io_seg7led_cathodes_T_16 = mux(_io_seg7led_cathodes_T_15, UInt<4>("he"), UInt<7>("h7f")) @[Mux.scala 101:16]
    node _io_seg7led_cathodes_T_17 = mux(_io_seg7led_cathodes_T_14, UInt<3>("h6"), _io_seg7led_cathodes_T_16) @[Mux.scala 101:16]
    node _io_seg7led_cathodes_T_18 = mux(_io_seg7led_cathodes_T_13, UInt<6>("h21"), _io_seg7led_cathodes_T_17) @[Mux.scala 101:16]
    node _io_seg7led_cathodes_T_19 = mux(_io_seg7led_cathodes_T_12, UInt<7>("h46"), _io_seg7led_cathodes_T_18) @[Mux.scala 101:16]
    node _io_seg7led_cathodes_T_20 = mux(_io_seg7led_cathodes_T_11, UInt<2>("h3"), _io_seg7led_cathodes_T_19) @[Mux.scala 101:16]
    node _io_seg7led_cathodes_T_21 = mux(_io_seg7led_cathodes_T_10, UInt<4>("h8"), _io_seg7led_cathodes_T_20) @[Mux.scala 101:16]
    node _io_seg7led_cathodes_T_22 = mux(_io_seg7led_cathodes_T_9, UInt<5>("h10"), _io_seg7led_cathodes_T_21) @[Mux.scala 101:16]
    node _io_seg7led_cathodes_T_23 = mux(_io_seg7led_cathodes_T_8, UInt<1>("h0"), _io_seg7led_cathodes_T_22) @[Mux.scala 101:16]
    node _io_seg7led_cathodes_T_24 = mux(_io_seg7led_cathodes_T_7, UInt<7>("h58"), _io_seg7led_cathodes_T_23) @[Mux.scala 101:16]
    node _io_seg7led_cathodes_T_25 = mux(_io_seg7led_cathodes_T_6, UInt<2>("h2"), _io_seg7led_cathodes_T_24) @[Mux.scala 101:16]
    node _io_seg7led_cathodes_T_26 = mux(_io_seg7led_cathodes_T_5, UInt<5>("h12"), _io_seg7led_cathodes_T_25) @[Mux.scala 101:16]
    node _io_seg7led_cathodes_T_27 = mux(_io_seg7led_cathodes_T_4, UInt<5>("h19"), _io_seg7led_cathodes_T_26) @[Mux.scala 101:16]
    node _io_seg7led_cathodes_T_28 = mux(_io_seg7led_cathodes_T_3, UInt<6>("h30"), _io_seg7led_cathodes_T_27) @[Mux.scala 101:16]
    node _io_seg7led_cathodes_T_29 = mux(_io_seg7led_cathodes_T_2, UInt<6>("h24"), _io_seg7led_cathodes_T_28) @[Mux.scala 101:16]
    node _io_seg7led_cathodes_T_30 = mux(_io_seg7led_cathodes_T_1, UInt<7>("h79"), _io_seg7led_cathodes_T_29) @[Mux.scala 101:16]
    node _io_seg7led_cathodes_T_31 = mux(_io_seg7led_cathodes_T, UInt<7>("h40"), _io_seg7led_cathodes_T_30) @[Mux.scala 101:16]
    io.seg7led.cathodes <= _io_seg7led_cathodes_T_31 @[Seg7LED.scala 18:23]
    reg anodes : UInt<8>, clock with :
      reset => (reset, UInt<8>("hfe")) @[Seg7LED.scala 36:21]
    when digitChange : @[Seg7LED.scala 37:20]
      node _anodes_T = bits(anodes, 6, 0) @[Seg7LED.scala 38:25]
      node _anodes_T_1 = bits(anodes, 7, 7) @[Seg7LED.scala 38:37]
      node _anodes_T_2 = cat(_anodes_T, _anodes_T_1) @[Cat.scala 33:92]
      anodes <= _anodes_T_2 @[Seg7LED.scala 38:12]
    reg blinkCount : UInt<27>, clock with :
      reset => (reset, UInt<27>("h0")) @[Counter.scala 61:40]
    wire blinkToggle : UInt<1> @[Counter.scala 117:24]
    blinkToggle <= UInt<1>("h0") @[Counter.scala 117:24]
    when io.blink : @[Counter.scala 118:16]
      node wrap_wrap_2 = eq(blinkCount, UInt<27>("h5f5e0ff")) @[Counter.scala 73:24]
      node _wrap_value_T_4 = add(blinkCount, UInt<1>("h1")) @[Counter.scala 77:24]
      node _wrap_value_T_5 = tail(_wrap_value_T_4, 1) @[Counter.scala 77:24]
      blinkCount <= _wrap_value_T_5 @[Counter.scala 77:15]
      when wrap_wrap_2 : @[Counter.scala 87:20]
        blinkCount <= UInt<1>("h0") @[Counter.scala 87:28]
      blinkToggle <= wrap_wrap_2 @[Counter.scala 118:23]
    reg blinkLight : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[Seg7LED.scala 41:25]
    when blinkToggle : @[Seg7LED.scala 42:20]
      node _blinkLight_T = eq(blinkLight, UInt<1>("h0")) @[Seg7LED.scala 43:19]
      blinkLight <= _blinkLight_T @[Seg7LED.scala 43:16]
    node _io_seg7led_anodes_T = eq(io.blink, UInt<1>("h0")) @[Seg7LED.scala 45:28]
    node _io_seg7led_anodes_T_1 = or(_io_seg7led_anodes_T, blinkLight) @[Seg7LED.scala 45:38]
    node _io_seg7led_anodes_T_2 = mux(_io_seg7led_anodes_T_1, anodes, UInt<8>("hff")) @[Seg7LED.scala 45:27]
    io.seg7led.anodes <= _io_seg7led_anodes_T_2 @[Seg7LED.scala 45:21]
    io.seg7led.decimalPoint <= UInt<1>("h1") @[Seg7LED.scala 46:27]

  module KitchenTimer :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip min : UInt<1>, flip sec : UInt<1>, flip startStop : UInt<1>, seg7led : { cathodes : UInt<7>, decimalPoint : UInt<1>, anodes : UInt<8>}}

    reg state : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[KitchenTimer.scala 17:22]
    reg reg1 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[KitchenTimer.scala 20:21]
    reg reg2 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[KitchenTimer.scala 21:21]
    inst reg1_debounce of Debounce @[Debounce.scala 40:26]
    reg1_debounce.clock <= clock
    reg1_debounce.reset <= reset
    reg1_debounce.io.in <= io.startStop @[Debounce.scala 41:20]
    reg1 <= reg1_debounce.io.out @[KitchenTimer.scala 22:8]
    reg2 <= reg1 @[KitchenTimer.scala 23:8]
    node _stateChange_T = eq(reg1, UInt<1>("h0")) @[KitchenTimer.scala 24:25]
    node _stateChange_T_1 = eq(reg2, UInt<1>("h1")) @[KitchenTimer.scala 24:45]
    node stateChange = and(_stateChange_T, _stateChange_T_1) @[KitchenTimer.scala 24:37]
    reg min_reg1 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[KitchenTimer.scala 27:25]
    reg min_reg2 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[KitchenTimer.scala 28:25]
    inst min_reg1_debounce of Debounce_1 @[Debounce.scala 40:26]
    min_reg1_debounce.clock <= clock
    min_reg1_debounce.reset <= reset
    min_reg1_debounce.io.in <= io.min @[Debounce.scala 41:20]
    min_reg1 <= min_reg1_debounce.io.out @[KitchenTimer.scala 29:12]
    min_reg2 <= min_reg1 @[KitchenTimer.scala 30:12]
    node _minChange_T = eq(min_reg1, UInt<1>("h0")) @[KitchenTimer.scala 31:27]
    node _minChange_T_1 = eq(min_reg2, UInt<1>("h1")) @[KitchenTimer.scala 31:51]
    node minChange = and(_minChange_T, _minChange_T_1) @[KitchenTimer.scala 31:39]
    reg sec_reg1 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[KitchenTimer.scala 33:25]
    reg sec_reg2 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[KitchenTimer.scala 34:25]
    inst sec_reg1_debounce of Debounce_2 @[Debounce.scala 40:26]
    sec_reg1_debounce.clock <= clock
    sec_reg1_debounce.reset <= reset
    sec_reg1_debounce.io.in <= io.sec @[Debounce.scala 41:20]
    sec_reg1 <= sec_reg1_debounce.io.out @[KitchenTimer.scala 35:12]
    sec_reg2 <= sec_reg1 @[KitchenTimer.scala 36:12]
    node _secChange_T = eq(sec_reg1, UInt<1>("h0")) @[KitchenTimer.scala 37:27]
    node _secChange_T_1 = eq(sec_reg2, UInt<1>("h1")) @[KitchenTimer.scala 37:51]
    node secChange = and(_secChange_T, _secChange_T_1) @[KitchenTimer.scala 37:39]
    inst time of Time @[KitchenTimer.scala 39:18]
    time.clock <= clock
    time.reset <= reset
    node _time_io_incMin_T = eq(state, UInt<2>("h0")) @[KitchenTimer.scala 40:27]
    node _time_io_incMin_T_1 = eq(state, UInt<2>("h2")) @[KitchenTimer.scala 40:47]
    node _time_io_incMin_T_2 = or(_time_io_incMin_T, _time_io_incMin_T_1) @[KitchenTimer.scala 40:39]
    node _time_io_incMin_T_3 = and(_time_io_incMin_T_2, minChange) @[KitchenTimer.scala 40:58]
    time.io.incMin <= _time_io_incMin_T_3 @[KitchenTimer.scala 40:18]
    node _time_io_incSec_T = eq(state, UInt<2>("h0")) @[KitchenTimer.scala 41:27]
    node _time_io_incSec_T_1 = eq(state, UInt<2>("h2")) @[KitchenTimer.scala 41:47]
    node _time_io_incSec_T_2 = or(_time_io_incSec_T, _time_io_incSec_T_1) @[KitchenTimer.scala 41:39]
    node _time_io_incSec_T_3 = and(_time_io_incSec_T_2, secChange) @[KitchenTimer.scala 41:58]
    time.io.incSec <= _time_io_incSec_T_3 @[KitchenTimer.scala 41:18]
    node _time_io_countDown_T = eq(state, UInt<2>("h1")) @[KitchenTimer.scala 42:28]
    time.io.countDown <= _time_io_countDown_T @[KitchenTimer.scala 42:21]
    when stateChange : @[KitchenTimer.scala 44:20]
      node _T = eq(UInt<2>("h0"), state) @[KitchenTimer.scala 45:18]
      when _T : @[KitchenTimer.scala 45:18]
        node _T_1 = eq(time.io.zero, UInt<1>("h0")) @[KitchenTimer.scala 47:14]
        when _T_1 : @[KitchenTimer.scala 47:28]
          state <= UInt<2>("h1") @[KitchenTimer.scala 48:17]
      else :
        node _T_2 = eq(UInt<2>("h1"), state) @[KitchenTimer.scala 45:18]
        when _T_2 : @[KitchenTimer.scala 45:18]
          state <= UInt<2>("h2") @[KitchenTimer.scala 52:15]
        else :
          node _T_3 = eq(UInt<2>("h2"), state) @[KitchenTimer.scala 45:18]
          when _T_3 : @[KitchenTimer.scala 45:18]
            state <= UInt<2>("h1") @[KitchenTimer.scala 56:15]
          else :
            node _T_4 = eq(UInt<2>("h3"), state) @[KitchenTimer.scala 45:18]
            when _T_4 : @[KitchenTimer.scala 45:18]
              state <= UInt<2>("h0") @[KitchenTimer.scala 59:15]
    else :
      node _T_5 = eq(state, UInt<2>("h1")) @[KitchenTimer.scala 62:19]
      node _T_6 = and(_T_5, time.io.zero) @[KitchenTimer.scala 62:27]
      when _T_6 : @[KitchenTimer.scala 62:43]
        state <= UInt<2>("h3") @[KitchenTimer.scala 63:11]
    inst seg7LED of Seg7LED @[KitchenTimer.scala 65:23]
    seg7LED.clock <= clock
    seg7LED.reset <= reset
    node _T_7 = rem(time.io.sec, UInt<4>("ha")) @[KitchenTimer.scala 66:49]
    node _T_8 = div(time.io.sec, UInt<4>("ha")) @[KitchenTimer.scala 67:18]
    node _T_9 = bits(_T_8, 3, 0) @[KitchenTimer.scala 67:25]
    node _T_10 = rem(time.io.min, UInt<4>("ha")) @[KitchenTimer.scala 68:17]
    node _T_11 = div(time.io.min, UInt<4>("ha")) @[KitchenTimer.scala 69:18]
    node _T_12 = bits(_T_11, 3, 0) @[KitchenTimer.scala 69:25]
    wire _WIRE : UInt<4>[8] @[KitchenTimer.scala 66:31]
    _WIRE[0] <= _T_7 @[KitchenTimer.scala 66:31]
    _WIRE[1] <= _T_9 @[KitchenTimer.scala 66:31]
    _WIRE[2] <= _T_10 @[KitchenTimer.scala 66:31]
    _WIRE[3] <= _T_12 @[KitchenTimer.scala 66:31]
    _WIRE[4] <= UInt<4>("h0") @[KitchenTimer.scala 66:31]
    _WIRE[5] <= UInt<4>("h0") @[KitchenTimer.scala 66:31]
    _WIRE[6] <= UInt<4>("h0") @[KitchenTimer.scala 66:31]
    _WIRE[7] <= UInt<4>("h0") @[KitchenTimer.scala 66:31]
    seg7LED.io.digits[0] <= _WIRE[0] @[KitchenTimer.scala 66:21]
    seg7LED.io.digits[1] <= _WIRE[1] @[KitchenTimer.scala 66:21]
    seg7LED.io.digits[2] <= _WIRE[2] @[KitchenTimer.scala 66:21]
    seg7LED.io.digits[3] <= _WIRE[3] @[KitchenTimer.scala 66:21]
    seg7LED.io.digits[4] <= _WIRE[4] @[KitchenTimer.scala 66:21]
    seg7LED.io.digits[5] <= _WIRE[5] @[KitchenTimer.scala 66:21]
    seg7LED.io.digits[6] <= _WIRE[6] @[KitchenTimer.scala 66:21]
    seg7LED.io.digits[7] <= _WIRE[7] @[KitchenTimer.scala 66:21]
    node _seg7LED_io_blink_T = eq(state, UInt<2>("h3")) @[KitchenTimer.scala 71:28]
    seg7LED.io.blink <= _seg7LED_io_blink_T @[KitchenTimer.scala 71:20]
    io.seg7led <= seg7LED.io.seg7led @[KitchenTimer.scala 72:14]

