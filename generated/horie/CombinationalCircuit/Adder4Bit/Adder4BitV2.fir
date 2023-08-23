circuit Adder4BitV2 :
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

  module Adder4BitV2 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<4>, flip b : UInt<4>, flip carryIn : UInt<1>, sum : UInt<4>, carryOut : UInt<1>}

    inst FullAdder of FullAdder @[Adder4BitV2.scala 23:33]
    FullAdder.clock <= clock
    FullAdder.reset <= reset
    inst FullAdder_1 of FullAdder_1 @[Adder4BitV2.scala 23:33]
    FullAdder_1.clock <= clock
    FullAdder_1.reset <= reset
    inst FullAdder_2 of FullAdder_2 @[Adder4BitV2.scala 23:33]
    FullAdder_2.clock <= clock
    FullAdder_2.reset <= reset
    inst FullAdder_3 of FullAdder_3 @[Adder4BitV2.scala 23:33]
    FullAdder_3.clock <= clock
    FullAdder_3.reset <= reset
    wire f : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}[4] @[Adder4BitV2.scala 23:26]
    f[0].carryOut <= FullAdder.io.carryOut @[Adder4BitV2.scala 23:26]
    f[0].sum <= FullAdder.io.sum @[Adder4BitV2.scala 23:26]
    FullAdder.io.carryIn <= f[0].carryIn @[Adder4BitV2.scala 23:26]
    FullAdder.io.b <= f[0].b @[Adder4BitV2.scala 23:26]
    FullAdder.io.a <= f[0].a @[Adder4BitV2.scala 23:26]
    f[1].carryOut <= FullAdder_1.io.carryOut @[Adder4BitV2.scala 23:26]
    f[1].sum <= FullAdder_1.io.sum @[Adder4BitV2.scala 23:26]
    FullAdder_1.io.carryIn <= f[1].carryIn @[Adder4BitV2.scala 23:26]
    FullAdder_1.io.b <= f[1].b @[Adder4BitV2.scala 23:26]
    FullAdder_1.io.a <= f[1].a @[Adder4BitV2.scala 23:26]
    f[2].carryOut <= FullAdder_2.io.carryOut @[Adder4BitV2.scala 23:26]
    f[2].sum <= FullAdder_2.io.sum @[Adder4BitV2.scala 23:26]
    FullAdder_2.io.carryIn <= f[2].carryIn @[Adder4BitV2.scala 23:26]
    FullAdder_2.io.b <= f[2].b @[Adder4BitV2.scala 23:26]
    FullAdder_2.io.a <= f[2].a @[Adder4BitV2.scala 23:26]
    f[3].carryOut <= FullAdder_3.io.carryOut @[Adder4BitV2.scala 23:26]
    f[3].sum <= FullAdder_3.io.sum @[Adder4BitV2.scala 23:26]
    FullAdder_3.io.carryIn <= f[3].carryIn @[Adder4BitV2.scala 23:26]
    FullAdder_3.io.b <= f[3].b @[Adder4BitV2.scala 23:26]
    FullAdder_3.io.a <= f[3].a @[Adder4BitV2.scala 23:26]
    node _f_0_a_T = bits(io.a, 0, 0) @[Adder4BitV2.scala 43:21]
    f[0].a <= _f_0_a_T @[Adder4BitV2.scala 43:14]
    node _f_0_b_T = bits(io.b, 0, 0) @[Adder4BitV2.scala 44:21]
    f[0].b <= _f_0_b_T @[Adder4BitV2.scala 44:14]
    f[0].carryIn <= io.carryIn @[Adder4BitV2.scala 45:20]
    node _f_1_a_T = bits(io.a, 1, 1) @[Adder4BitV2.scala 47:21]
    f[1].a <= _f_1_a_T @[Adder4BitV2.scala 47:14]
    node _f_1_b_T = bits(io.b, 1, 1) @[Adder4BitV2.scala 48:21]
    f[1].b <= _f_1_b_T @[Adder4BitV2.scala 48:14]
    f[1].carryIn <= f[0].carryOut @[Adder4BitV2.scala 49:20]
    node _f_2_a_T = bits(io.a, 2, 2) @[Adder4BitV2.scala 47:21]
    f[2].a <= _f_2_a_T @[Adder4BitV2.scala 47:14]
    node _f_2_b_T = bits(io.b, 2, 2) @[Adder4BitV2.scala 48:21]
    f[2].b <= _f_2_b_T @[Adder4BitV2.scala 48:14]
    f[2].carryIn <= f[1].carryOut @[Adder4BitV2.scala 49:20]
    node _f_3_a_T = bits(io.a, 3, 3) @[Adder4BitV2.scala 47:21]
    f[3].a <= _f_3_a_T @[Adder4BitV2.scala 47:14]
    node _f_3_b_T = bits(io.b, 3, 3) @[Adder4BitV2.scala 48:21]
    f[3].b <= _f_3_b_T @[Adder4BitV2.scala 48:14]
    f[3].carryIn <= f[2].carryOut @[Adder4BitV2.scala 49:20]
    node io_sum_lo = cat(f[1].sum, f[0].sum) @[Cat.scala 33:92]
    node io_sum_hi = cat(f[3].sum, f[2].sum) @[Cat.scala 33:92]
    node _io_sum_T = cat(io_sum_hi, io_sum_lo) @[Cat.scala 33:92]
    io.sum <= _io_sum_T @[Adder4BitV2.scala 53:10]
    io.carryOut <= f[3].carryOut @[Adder4BitV2.scala 54:15]

