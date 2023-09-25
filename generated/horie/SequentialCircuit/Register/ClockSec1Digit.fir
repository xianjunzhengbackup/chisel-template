circuit ClockSec1Digit :
  module Seg7LED1Digit :
    input clock : Clock
    input reset : Reset
    output io : { flip num : UInt<4>, seg7led : { cathodes : UInt<7>, decimalPoint : UInt<1>, anodes : UInt<8>}}

    node _io_seg7led_cathodes_T = eq(io.num, UInt<1>("h0")) @[Seg7LED.scala 19:15]
    node _io_seg7led_cathodes_T_1 = eq(io.num, UInt<1>("h1")) @[Seg7LED.scala 20:15]
    node _io_seg7led_cathodes_T_2 = eq(io.num, UInt<2>("h2")) @[Seg7LED.scala 21:15]
    node _io_seg7led_cathodes_T_3 = eq(io.num, UInt<2>("h3")) @[Seg7LED.scala 22:15]
    node _io_seg7led_cathodes_T_4 = eq(io.num, UInt<3>("h4")) @[Seg7LED.scala 23:15]
    node _io_seg7led_cathodes_T_5 = eq(io.num, UInt<3>("h5")) @[Seg7LED.scala 24:15]
    node _io_seg7led_cathodes_T_6 = eq(io.num, UInt<3>("h6")) @[Seg7LED.scala 25:15]
    node _io_seg7led_cathodes_T_7 = eq(io.num, UInt<3>("h7")) @[Seg7LED.scala 26:15]
    node _io_seg7led_cathodes_T_8 = eq(io.num, UInt<4>("h8")) @[Seg7LED.scala 27:15]
    node _io_seg7led_cathodes_T_9 = eq(io.num, UInt<4>("h9")) @[Seg7LED.scala 28:15]
    node _io_seg7led_cathodes_T_10 = eq(io.num, UInt<4>("ha")) @[Seg7LED.scala 29:15]
    node _io_seg7led_cathodes_T_11 = eq(io.num, UInt<4>("hb")) @[Seg7LED.scala 30:15]
    node _io_seg7led_cathodes_T_12 = eq(io.num, UInt<4>("hc")) @[Seg7LED.scala 31:15]
    node _io_seg7led_cathodes_T_13 = eq(io.num, UInt<4>("hd")) @[Seg7LED.scala 32:15]
    node _io_seg7led_cathodes_T_14 = eq(io.num, UInt<4>("he")) @[Seg7LED.scala 33:15]
    node _io_seg7led_cathodes_T_15 = eq(io.num, UInt<4>("hf")) @[Seg7LED.scala 34:15]
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
    io.seg7led.cathodes <= _io_seg7led_cathodes_T_31 @[Seg7LED.scala 17:23]
    io.seg7led.decimalPoint <= UInt<1>("h1") @[Seg7LED.scala 35:27]
    io.seg7led.anodes <= UInt<8>("hfe") @[Seg7LED.scala 36:21]

  module ClockSec1Digit :
    input clock : Clock
    input reset : UInt<1>
    output io : { seg7led : { cathodes : UInt<7>, decimalPoint : UInt<1>, anodes : UInt<8>}}

    reg reg24Bit : UInt<24>, clock with :
      reset => (reset, UInt<24>("h0")) @[ClockSec1Digit.scala 13:25]
    reg reg4Bit : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[ClockSec1Digit.scala 14:24]
    node _T = eq(reg24Bit, UInt<4>("ha")) @[ClockSec1Digit.scala 16:17]
    when _T : @[ClockSec1Digit.scala 16:29]
      node _reg4Bit_T = add(reg4Bit, UInt<4>("h1")) @[ClockSec1Digit.scala 17:24]
      node _reg4Bit_T_1 = tail(_reg4Bit_T, 1) @[ClockSec1Digit.scala 17:24]
      reg4Bit <= _reg4Bit_T_1 @[ClockSec1Digit.scala 17:13]
      reg24Bit <= UInt<1>("h0") @[ClockSec1Digit.scala 18:14]
    else :
      reg4Bit <= reg4Bit @[ClockSec1Digit.scala 20:13]
      node _reg24Bit_T = add(reg24Bit, UInt<1>("h1")) @[ClockSec1Digit.scala 21:26]
      node _reg24Bit_T_1 = tail(_reg24Bit_T, 1) @[ClockSec1Digit.scala 21:26]
      reg24Bit <= _reg24Bit_T_1 @[ClockSec1Digit.scala 21:14]
    inst seg of Seg7LED1Digit @[ClockSec1Digit.scala 24:19]
    seg.clock <= clock
    seg.reset <= reset
    seg.io.num <= reg4Bit @[ClockSec1Digit.scala 25:14]
    io.seg7led <= seg.io.seg7led @[ClockSec1Digit.scala 26:14]

