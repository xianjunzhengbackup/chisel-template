circuit Subtract4Bit :
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

  module Subtract4Bit :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<4>, flip b : UInt<4>, result : UInt<4>}

    inst adder of Adder4Bit @[Subtract4Bit.scala 13:21]
    adder.clock <= clock
    adder.reset <= reset
    node _b_complement_T = not(io.b) @[Subtract4Bit.scala 14:22]
    node _b_complement_T_1 = add(_b_complement_T, UInt<1>("h1")) @[Subtract4Bit.scala 14:28]
    node b_complement = tail(_b_complement_T_1, 1) @[Subtract4Bit.scala 14:28]
    adder.io.b <= b_complement @[Subtract4Bit.scala 15:14]
    adder.io.a <= io.a @[Subtract4Bit.scala 16:14]
    adder.io.carryIn <= UInt<1>("h0") @[Subtract4Bit.scala 17:20]
    io.result <= adder.io.sum @[Subtract4Bit.scala 18:13]

