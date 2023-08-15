circuit Counter31Bit :
  module Seg7LED1Digit :
    input clock : Clock
    input reset : Reset
    output io : { flip num : UInt<4>, seg7led : { cathodes : UInt<7>, decimalPoint : UInt<1>, anodes : UInt<8>}}

    node _io_seg7led_cathodes_T = eq(io.num, UInt<1>("h0")) @[Seg7LED.scala 34:12]
    node _io_seg7led_cathodes_T_1 = eq(io.num, UInt<1>("h1")) @[Seg7LED.scala 35:12]
    node _io_seg7led_cathodes_T_2 = eq(io.num, UInt<2>("h2")) @[Seg7LED.scala 36:12]
    node _io_seg7led_cathodes_T_3 = eq(io.num, UInt<2>("h3")) @[Seg7LED.scala 37:12]
    node _io_seg7led_cathodes_T_4 = eq(io.num, UInt<3>("h4")) @[Seg7LED.scala 38:12]
    node _io_seg7led_cathodes_T_5 = eq(io.num, UInt<3>("h5")) @[Seg7LED.scala 39:12]
    node _io_seg7led_cathodes_T_6 = eq(io.num, UInt<3>("h6")) @[Seg7LED.scala 40:12]
    node _io_seg7led_cathodes_T_7 = eq(io.num, UInt<3>("h7")) @[Seg7LED.scala 41:12]
    node _io_seg7led_cathodes_T_8 = eq(io.num, UInt<4>("h8")) @[Seg7LED.scala 42:12]
    node _io_seg7led_cathodes_T_9 = eq(io.num, UInt<4>("h9")) @[Seg7LED.scala 43:12]
    node _io_seg7led_cathodes_T_10 = eq(io.num, UInt<4>("ha")) @[Seg7LED.scala 44:12]
    node _io_seg7led_cathodes_T_11 = eq(io.num, UInt<4>("hb")) @[Seg7LED.scala 45:12]
    node _io_seg7led_cathodes_T_12 = eq(io.num, UInt<4>("hc")) @[Seg7LED.scala 46:12]
    node _io_seg7led_cathodes_T_13 = eq(io.num, UInt<4>("hd")) @[Seg7LED.scala 47:12]
    node _io_seg7led_cathodes_T_14 = eq(io.num, UInt<4>("he")) @[Seg7LED.scala 48:12]
    node _io_seg7led_cathodes_T_15 = eq(io.num, UInt<4>("hf")) @[Seg7LED.scala 49:12]
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
    io.seg7led.cathodes <= _io_seg7led_cathodes_T_31 @[Seg7LED.scala 32:20]
    io.seg7led.decimalPoint <= UInt<1>("h1") @[Seg7LED.scala 51:24]
    io.seg7led.anodes <= UInt<8>("hfe") @[Seg7LED.scala 52:18]

  module Counter31Bit :
    input clock : Clock
    input reset : UInt<1>
    output io : { seg7led : { cathodes : UInt<7>, decimalPoint : UInt<1>, anodes : UInt<8>}}

    reg count : UInt<31>, clock with :
      reset => (reset, UInt<31>("h0")) @[Counting.scala 20:22]
    node _count_T = add(count, UInt<1>("h1")) @[Counting.scala 21:18]
    node _count_T_1 = tail(_count_T, 1) @[Counting.scala 21:18]
    count <= _count_T_1 @[Counting.scala 21:9]
    inst seg7LED1Digit of Seg7LED1Digit @[Counting.scala 23:29]
    seg7LED1Digit.clock <= clock
    seg7LED1Digit.reset <= reset
    node _seg7LED1Digit_io_num_T = bits(count, 30, 27) @[Counting.scala 24:32]
    seg7LED1Digit.io.num <= _seg7LED1Digit_io_num_T @[Counting.scala 24:24]
    io.seg7led <= seg7LED1Digit.io.seg7led @[Counting.scala 25:14]

