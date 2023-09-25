circuit Multiplier4BitV2 :
  module HalfAdder :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_1 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_2 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_3 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_4 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_5 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_4 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_5 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_6 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_7 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_6 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_7 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module Adder4Bit :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<4>, flip b : UInt<4>, flip carryIn : UInt<1>, sum : UInt<4>, carryOut : UInt<1>}

    inst f1 of FullAdder @[Adder4Bit.scala 17:18]
    f1.clock <= clock
    f1.reset <= reset
    inst f2 of FullAdder_1 @[Adder4Bit.scala 18:18]
    f2.clock <= clock
    f2.reset <= reset
    inst f3 of FullAdder_2 @[Adder4Bit.scala 19:18]
    f3.clock <= clock
    f3.reset <= reset
    inst f0 of FullAdder_3 @[Adder4Bit.scala 20:18]
    f0.clock <= clock
    f0.reset <= reset
    node _f0_io_a_T = bits(io.a, 0, 0) @[Adder4Bit.scala 22:18]
    f0.io.a <= _f0_io_a_T @[Adder4Bit.scala 22:11]
    node _f0_io_b_T = bits(io.b, 0, 0) @[Adder4Bit.scala 23:18]
    f0.io.b <= _f0_io_b_T @[Adder4Bit.scala 23:11]
    f0.io.carryIn <= io.carryIn @[Adder4Bit.scala 24:17]
    node _f1_io_a_T = bits(io.a, 1, 1) @[Adder4Bit.scala 26:18]
    f1.io.a <= _f1_io_a_T @[Adder4Bit.scala 26:11]
    node _f1_io_b_T = bits(io.b, 1, 1) @[Adder4Bit.scala 27:18]
    f1.io.b <= _f1_io_b_T @[Adder4Bit.scala 27:11]
    f1.io.carryIn <= f0.io.carryOut @[Adder4Bit.scala 28:17]
    node _f2_io_a_T = bits(io.a, 2, 2) @[Adder4Bit.scala 30:18]
    f2.io.a <= _f2_io_a_T @[Adder4Bit.scala 30:11]
    node _f2_io_b_T = bits(io.b, 2, 2) @[Adder4Bit.scala 31:18]
    f2.io.b <= _f2_io_b_T @[Adder4Bit.scala 31:11]
    f2.io.carryIn <= f1.io.carryOut @[Adder4Bit.scala 32:17]
    node _f3_io_a_T = bits(io.a, 3, 3) @[Adder4Bit.scala 34:18]
    f3.io.a <= _f3_io_a_T @[Adder4Bit.scala 34:11]
    node _f3_io_b_T = bits(io.b, 3, 3) @[Adder4Bit.scala 35:18]
    f3.io.b <= _f3_io_b_T @[Adder4Bit.scala 35:11]
    f3.io.carryIn <= f2.io.carryOut @[Adder4Bit.scala 36:17]
    node io_sum_lo = cat(f1.io.sum, f0.io.sum) @[Cat.scala 33:92]
    node io_sum_hi = cat(f3.io.sum, f2.io.sum) @[Cat.scala 33:92]
    node _io_sum_T = cat(io_sum_hi, io_sum_lo) @[Cat.scala 33:92]
    io.sum <= _io_sum_T @[Adder4Bit.scala 38:10]
    io.carryOut <= f3.io.carryOut @[Adder4Bit.scala 39:15]

  module HalfAdder_8 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_9 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_4 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_8 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_9 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_10 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_11 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_5 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_10 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_11 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_12 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_13 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_6 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_12 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_13 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_14 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_15 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_7 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_14 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_15 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module Adder4Bit_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<4>, flip b : UInt<4>, flip carryIn : UInt<1>, sum : UInt<4>, carryOut : UInt<1>}

    inst f1 of FullAdder_4 @[Adder4Bit.scala 17:18]
    f1.clock <= clock
    f1.reset <= reset
    inst f2 of FullAdder_5 @[Adder4Bit.scala 18:18]
    f2.clock <= clock
    f2.reset <= reset
    inst f3 of FullAdder_6 @[Adder4Bit.scala 19:18]
    f3.clock <= clock
    f3.reset <= reset
    inst f0 of FullAdder_7 @[Adder4Bit.scala 20:18]
    f0.clock <= clock
    f0.reset <= reset
    node _f0_io_a_T = bits(io.a, 0, 0) @[Adder4Bit.scala 22:18]
    f0.io.a <= _f0_io_a_T @[Adder4Bit.scala 22:11]
    node _f0_io_b_T = bits(io.b, 0, 0) @[Adder4Bit.scala 23:18]
    f0.io.b <= _f0_io_b_T @[Adder4Bit.scala 23:11]
    f0.io.carryIn <= io.carryIn @[Adder4Bit.scala 24:17]
    node _f1_io_a_T = bits(io.a, 1, 1) @[Adder4Bit.scala 26:18]
    f1.io.a <= _f1_io_a_T @[Adder4Bit.scala 26:11]
    node _f1_io_b_T = bits(io.b, 1, 1) @[Adder4Bit.scala 27:18]
    f1.io.b <= _f1_io_b_T @[Adder4Bit.scala 27:11]
    f1.io.carryIn <= f0.io.carryOut @[Adder4Bit.scala 28:17]
    node _f2_io_a_T = bits(io.a, 2, 2) @[Adder4Bit.scala 30:18]
    f2.io.a <= _f2_io_a_T @[Adder4Bit.scala 30:11]
    node _f2_io_b_T = bits(io.b, 2, 2) @[Adder4Bit.scala 31:18]
    f2.io.b <= _f2_io_b_T @[Adder4Bit.scala 31:11]
    f2.io.carryIn <= f1.io.carryOut @[Adder4Bit.scala 32:17]
    node _f3_io_a_T = bits(io.a, 3, 3) @[Adder4Bit.scala 34:18]
    f3.io.a <= _f3_io_a_T @[Adder4Bit.scala 34:11]
    node _f3_io_b_T = bits(io.b, 3, 3) @[Adder4Bit.scala 35:18]
    f3.io.b <= _f3_io_b_T @[Adder4Bit.scala 35:11]
    f3.io.carryIn <= f2.io.carryOut @[Adder4Bit.scala 36:17]
    node io_sum_lo = cat(f1.io.sum, f0.io.sum) @[Cat.scala 33:92]
    node io_sum_hi = cat(f3.io.sum, f2.io.sum) @[Cat.scala 33:92]
    node _io_sum_T = cat(io_sum_hi, io_sum_lo) @[Cat.scala 33:92]
    io.sum <= _io_sum_T @[Adder4Bit.scala 38:10]
    io.carryOut <= f3.io.carryOut @[Adder4Bit.scala 39:15]

  module HalfAdder_16 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_17 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_8 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_16 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_17 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_18 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_19 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_9 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_18 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_19 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_20 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_21 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_10 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_20 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_21 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_22 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_23 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_11 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_22 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_23 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module Adder4Bit_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<4>, flip b : UInt<4>, flip carryIn : UInt<1>, sum : UInt<4>, carryOut : UInt<1>}

    inst f1 of FullAdder_8 @[Adder4Bit.scala 17:18]
    f1.clock <= clock
    f1.reset <= reset
    inst f2 of FullAdder_9 @[Adder4Bit.scala 18:18]
    f2.clock <= clock
    f2.reset <= reset
    inst f3 of FullAdder_10 @[Adder4Bit.scala 19:18]
    f3.clock <= clock
    f3.reset <= reset
    inst f0 of FullAdder_11 @[Adder4Bit.scala 20:18]
    f0.clock <= clock
    f0.reset <= reset
    node _f0_io_a_T = bits(io.a, 0, 0) @[Adder4Bit.scala 22:18]
    f0.io.a <= _f0_io_a_T @[Adder4Bit.scala 22:11]
    node _f0_io_b_T = bits(io.b, 0, 0) @[Adder4Bit.scala 23:18]
    f0.io.b <= _f0_io_b_T @[Adder4Bit.scala 23:11]
    f0.io.carryIn <= io.carryIn @[Adder4Bit.scala 24:17]
    node _f1_io_a_T = bits(io.a, 1, 1) @[Adder4Bit.scala 26:18]
    f1.io.a <= _f1_io_a_T @[Adder4Bit.scala 26:11]
    node _f1_io_b_T = bits(io.b, 1, 1) @[Adder4Bit.scala 27:18]
    f1.io.b <= _f1_io_b_T @[Adder4Bit.scala 27:11]
    f1.io.carryIn <= f0.io.carryOut @[Adder4Bit.scala 28:17]
    node _f2_io_a_T = bits(io.a, 2, 2) @[Adder4Bit.scala 30:18]
    f2.io.a <= _f2_io_a_T @[Adder4Bit.scala 30:11]
    node _f2_io_b_T = bits(io.b, 2, 2) @[Adder4Bit.scala 31:18]
    f2.io.b <= _f2_io_b_T @[Adder4Bit.scala 31:11]
    f2.io.carryIn <= f1.io.carryOut @[Adder4Bit.scala 32:17]
    node _f3_io_a_T = bits(io.a, 3, 3) @[Adder4Bit.scala 34:18]
    f3.io.a <= _f3_io_a_T @[Adder4Bit.scala 34:11]
    node _f3_io_b_T = bits(io.b, 3, 3) @[Adder4Bit.scala 35:18]
    f3.io.b <= _f3_io_b_T @[Adder4Bit.scala 35:11]
    f3.io.carryIn <= f2.io.carryOut @[Adder4Bit.scala 36:17]
    node io_sum_lo = cat(f1.io.sum, f0.io.sum) @[Cat.scala 33:92]
    node io_sum_hi = cat(f3.io.sum, f2.io.sum) @[Cat.scala 33:92]
    node _io_sum_T = cat(io_sum_hi, io_sum_lo) @[Cat.scala 33:92]
    io.sum <= _io_sum_T @[Adder4Bit.scala 38:10]
    io.carryOut <= f3.io.carryOut @[Adder4Bit.scala 39:15]

  module Multiplier4BitV2 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<4>, flip b : UInt<4>, result : UInt<8>}

    wire digit0 : UInt<4> @[Multiplier4BitV2.scala 15:20]
    wire digit1 : UInt<4> @[Multiplier4BitV2.scala 16:20]
    wire digit2 : UInt<4> @[Multiplier4BitV2.scala 17:20]
    wire digit3 : UInt<4> @[Multiplier4BitV2.scala 18:20]
    node _digit0_T = bits(io.b, 0, 0) @[Multiplier4BitV2.scala 19:30]
    node _digit0_T_1 = bits(_digit0_T, 0, 0) @[Bitwise.scala 77:15]
    node _digit0_T_2 = mux(_digit0_T_1, UInt<4>("hf"), UInt<4>("h0")) @[Bitwise.scala 77:12]
    node _digit0_T_3 = and(io.a, _digit0_T_2) @[Multiplier4BitV2.scala 19:17]
    digit0 <= _digit0_T_3 @[Multiplier4BitV2.scala 19:10]
    node _digit1_T = bits(io.b, 1, 1) @[Multiplier4BitV2.scala 20:30]
    node _digit1_T_1 = bits(_digit1_T, 0, 0) @[Bitwise.scala 77:15]
    node _digit1_T_2 = mux(_digit1_T_1, UInt<4>("hf"), UInt<4>("h0")) @[Bitwise.scala 77:12]
    node _digit1_T_3 = and(io.a, _digit1_T_2) @[Multiplier4BitV2.scala 20:17]
    digit1 <= _digit1_T_3 @[Multiplier4BitV2.scala 20:10]
    node _digit2_T = bits(io.b, 2, 2) @[Multiplier4BitV2.scala 21:30]
    node _digit2_T_1 = bits(_digit2_T, 0, 0) @[Bitwise.scala 77:15]
    node _digit2_T_2 = mux(_digit2_T_1, UInt<4>("hf"), UInt<4>("h0")) @[Bitwise.scala 77:12]
    node _digit2_T_3 = and(io.a, _digit2_T_2) @[Multiplier4BitV2.scala 21:17]
    digit2 <= _digit2_T_3 @[Multiplier4BitV2.scala 21:10]
    node _digit3_T = bits(io.b, 3, 3) @[Multiplier4BitV2.scala 22:30]
    node _digit3_T_1 = bits(_digit3_T, 0, 0) @[Bitwise.scala 77:15]
    node _digit3_T_2 = mux(_digit3_T_1, UInt<4>("hf"), UInt<4>("h0")) @[Bitwise.scala 77:12]
    node _digit3_T_3 = and(io.a, _digit3_T_2) @[Multiplier4BitV2.scala 22:17]
    digit3 <= _digit3_T_3 @[Multiplier4BitV2.scala 22:10]
    inst adder1 of Adder4Bit @[Multiplier4BitV2.scala 23:22]
    adder1.clock <= clock
    adder1.reset <= reset
    adder1.io.a <= digit1 @[Multiplier4BitV2.scala 24:15]
    node _adder1_io_b_T = bits(digit0, 3, 1) @[Multiplier4BitV2.scala 25:32]
    node _adder1_io_b_T_1 = cat(UInt<1>("h0"), _adder1_io_b_T) @[Cat.scala 33:92]
    adder1.io.b <= _adder1_io_b_T_1 @[Multiplier4BitV2.scala 25:15]
    adder1.io.carryIn <= UInt<1>("h0") @[Multiplier4BitV2.scala 26:21]
    inst adder2 of Adder4Bit_1 @[Multiplier4BitV2.scala 28:21]
    adder2.clock <= clock
    adder2.reset <= reset
    adder2.io.a <= digit2 @[Multiplier4BitV2.scala 29:15]
    node _adder2_io_b_T = bits(adder1.io.sum, 3, 1) @[Multiplier4BitV2.scala 30:39]
    node _adder2_io_b_T_1 = cat(UInt<1>("h0"), _adder2_io_b_T) @[Cat.scala 33:92]
    adder2.io.b <= _adder2_io_b_T_1 @[Multiplier4BitV2.scala 30:15]
    adder2.io.carryIn <= adder1.io.carryOut @[Multiplier4BitV2.scala 31:21]
    inst adder3 of Adder4Bit_2 @[Multiplier4BitV2.scala 33:21]
    adder3.clock <= clock
    adder3.reset <= reset
    adder3.io.a <= digit3 @[Multiplier4BitV2.scala 34:15]
    node _adder3_io_b_T = bits(adder2.io.sum, 3, 1) @[Multiplier4BitV2.scala 35:39]
    node _adder3_io_b_T_1 = cat(UInt<1>("h0"), _adder3_io_b_T) @[Cat.scala 33:92]
    adder3.io.b <= _adder3_io_b_T_1 @[Multiplier4BitV2.scala 35:15]
    adder3.io.carryIn <= adder2.io.carryOut @[Multiplier4BitV2.scala 36:21]
    node _io_result_T = bits(adder2.io.sum, 0, 0) @[Multiplier4BitV2.scala 38:65]
    node _io_result_T_1 = bits(adder1.io.sum, 0, 0) @[Multiplier4BitV2.scala 38:82]
    node _io_result_T_2 = bits(digit0, 0, 0) @[Multiplier4BitV2.scala 38:92]
    node io_result_lo = cat(_io_result_T_1, _io_result_T_2) @[Cat.scala 33:92]
    node io_result_hi_hi = cat(adder3.io.carryOut, adder3.io.sum) @[Cat.scala 33:92]
    node io_result_hi = cat(io_result_hi_hi, _io_result_T) @[Cat.scala 33:92]
    node _io_result_T_3 = cat(io_result_hi, io_result_lo) @[Cat.scala 33:92]
    io.result <= _io_result_T_3 @[Multiplier4BitV2.scala 38:13]

