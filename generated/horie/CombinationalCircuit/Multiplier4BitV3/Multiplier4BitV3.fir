circuit Multiplier4BitV3 :
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

  module Multiplier4BitV3 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<4>, flip b : UInt<4>, result : UInt<8>}

    wire digits : UInt<4>[4] @[Multiplier4BitV3.scala 22:19]
    node _digits_0_T = bits(io.b, 0, 0) @[Multiplier4BitV3.scala 24:36]
    node _digits_0_T_1 = bits(_digits_0_T, 0, 0) @[Bitwise.scala 77:15]
    node _digits_0_T_2 = mux(_digits_0_T_1, UInt<4>("hf"), UInt<4>("h0")) @[Bitwise.scala 77:12]
    node _digits_0_T_3 = and(io.a, _digits_0_T_2) @[Multiplier4BitV3.scala 24:23]
    digits[0] <= _digits_0_T_3 @[Multiplier4BitV3.scala 24:15]
    node _digits_1_T = bits(io.b, 1, 1) @[Multiplier4BitV3.scala 24:36]
    node _digits_1_T_1 = bits(_digits_1_T, 0, 0) @[Bitwise.scala 77:15]
    node _digits_1_T_2 = mux(_digits_1_T_1, UInt<4>("hf"), UInt<4>("h0")) @[Bitwise.scala 77:12]
    node _digits_1_T_3 = and(io.a, _digits_1_T_2) @[Multiplier4BitV3.scala 24:23]
    digits[1] <= _digits_1_T_3 @[Multiplier4BitV3.scala 24:15]
    node _digits_2_T = bits(io.b, 2, 2) @[Multiplier4BitV3.scala 24:36]
    node _digits_2_T_1 = bits(_digits_2_T, 0, 0) @[Bitwise.scala 77:15]
    node _digits_2_T_2 = mux(_digits_2_T_1, UInt<4>("hf"), UInt<4>("h0")) @[Bitwise.scala 77:12]
    node _digits_2_T_3 = and(io.a, _digits_2_T_2) @[Multiplier4BitV3.scala 24:23]
    digits[2] <= _digits_2_T_3 @[Multiplier4BitV3.scala 24:15]
    node _digits_3_T = bits(io.b, 3, 3) @[Multiplier4BitV3.scala 24:36]
    node _digits_3_T_1 = bits(_digits_3_T, 0, 0) @[Bitwise.scala 77:15]
    node _digits_3_T_2 = mux(_digits_3_T_1, UInt<4>("hf"), UInt<4>("h0")) @[Bitwise.scala 77:12]
    node _digits_3_T_3 = and(io.a, _digits_3_T_2) @[Multiplier4BitV3.scala 24:23]
    digits[3] <= _digits_3_T_3 @[Multiplier4BitV3.scala 24:15]
    inst Adder4Bit of Adder4Bit @[Multiplier4BitV3.scala 26:38]
    Adder4Bit.clock <= clock
    Adder4Bit.reset <= reset
    inst Adder4Bit_1 of Adder4Bit_1 @[Multiplier4BitV3.scala 26:38]
    Adder4Bit_1.clock <= clock
    Adder4Bit_1.reset <= reset
    inst Adder4Bit_2 of Adder4Bit_2 @[Multiplier4BitV3.scala 26:38]
    Adder4Bit_2.clock <= clock
    Adder4Bit_2.reset <= reset
    wire adders : { flip a : UInt<4>, flip b : UInt<4>, flip carryIn : UInt<1>, sum : UInt<4>, carryOut : UInt<1>}[3] @[Multiplier4BitV3.scala 26:31]
    adders[0].carryOut <= Adder4Bit.io.carryOut @[Multiplier4BitV3.scala 26:31]
    adders[0].sum <= Adder4Bit.io.sum @[Multiplier4BitV3.scala 26:31]
    Adder4Bit.io.carryIn <= adders[0].carryIn @[Multiplier4BitV3.scala 26:31]
    Adder4Bit.io.b <= adders[0].b @[Multiplier4BitV3.scala 26:31]
    Adder4Bit.io.a <= adders[0].a @[Multiplier4BitV3.scala 26:31]
    adders[1].carryOut <= Adder4Bit_1.io.carryOut @[Multiplier4BitV3.scala 26:31]
    adders[1].sum <= Adder4Bit_1.io.sum @[Multiplier4BitV3.scala 26:31]
    Adder4Bit_1.io.carryIn <= adders[1].carryIn @[Multiplier4BitV3.scala 26:31]
    Adder4Bit_1.io.b <= adders[1].b @[Multiplier4BitV3.scala 26:31]
    Adder4Bit_1.io.a <= adders[1].a @[Multiplier4BitV3.scala 26:31]
    adders[2].carryOut <= Adder4Bit_2.io.carryOut @[Multiplier4BitV3.scala 26:31]
    adders[2].sum <= Adder4Bit_2.io.sum @[Multiplier4BitV3.scala 26:31]
    Adder4Bit_2.io.carryIn <= adders[2].carryIn @[Multiplier4BitV3.scala 26:31]
    Adder4Bit_2.io.b <= adders[2].b @[Multiplier4BitV3.scala 26:31]
    Adder4Bit_2.io.a <= adders[2].a @[Multiplier4BitV3.scala 26:31]
    adders[0].a <= digits[1] @[Multiplier4BitV3.scala 28:17]
    node _adders_0_b_T = bits(digits[0], 3, 1) @[Multiplier4BitV3.scala 29:45]
    node _adders_0_b_T_1 = cat(UInt<1>("h0"), _adders_0_b_T) @[Cat.scala 33:92]
    adders[0].b <= _adders_0_b_T_1 @[Multiplier4BitV3.scala 29:26]
    adders[0].carryIn <= UInt<1>("h0") @[Multiplier4BitV3.scala 31:23]
    adders[1].a <= digits[2] @[Multiplier4BitV3.scala 28:17]
    node _adders_1_b_T = bits(adders[0].sum, 3, 1) @[Multiplier4BitV3.scala 30:65]
    node _adders_1_b_T_1 = cat(adders[0].carryOut, _adders_1_b_T) @[Cat.scala 33:92]
    adders[1].b <= _adders_1_b_T_1 @[Multiplier4BitV3.scala 30:22]
    adders[1].carryIn <= UInt<1>("h0") @[Multiplier4BitV3.scala 31:23]
    adders[2].a <= digits[3] @[Multiplier4BitV3.scala 28:17]
    node _adders_2_b_T = bits(adders[1].sum, 3, 1) @[Multiplier4BitV3.scala 30:65]
    node _adders_2_b_T_1 = cat(adders[1].carryOut, _adders_2_b_T) @[Cat.scala 33:92]
    adders[2].b <= _adders_2_b_T_1 @[Multiplier4BitV3.scala 30:22]
    adders[2].carryIn <= UInt<1>("h0") @[Multiplier4BitV3.scala 31:23]
    node _io_result_T = bits(adders[1].sum, 0, 0) @[Multiplier4BitV3.scala 33:66]
    node _io_result_T_1 = bits(adders[0].sum, 0, 0) @[Multiplier4BitV3.scala 33:83]
    node _io_result_T_2 = bits(digits[0], 0, 0) @[Multiplier4BitV3.scala 33:96]
    node io_result_lo = cat(_io_result_T_1, _io_result_T_2) @[Cat.scala 33:92]
    node io_result_hi_hi = cat(adders[2].carryOut, adders[2].sum) @[Cat.scala 33:92]
    node io_result_hi = cat(io_result_hi_hi, _io_result_T) @[Cat.scala 33:92]
    node _io_result_T_3 = cat(io_result_hi, io_result_lo) @[Cat.scala 33:92]
    io.result <= _io_result_T_3 @[Multiplier4BitV3.scala 33:13]

