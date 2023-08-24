circuit Multiplier4Bit :
  module LeftShifter :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<4>, flip shiftAmount : UInt<2>, out : UInt<6>}

    node _io_out_T = dshl(io.in, io.shiftAmount) @[LeftShifter.scala 13:19]
    io.out <= _io_out_T @[LeftShifter.scala 13:10]

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

  module AdderNBit :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<8>, flip b : UInt<8>, flip carryIn : UInt<1>, sum : UInt<8>, carryOut : UInt<1>}

    inst FullAdder of FullAdder @[AdderNBit.scala 17:33]
    FullAdder.clock <= clock
    FullAdder.reset <= reset
    inst FullAdder_1 of FullAdder_1 @[AdderNBit.scala 17:33]
    FullAdder_1.clock <= clock
    FullAdder_1.reset <= reset
    inst FullAdder_2 of FullAdder_2 @[AdderNBit.scala 17:33]
    FullAdder_2.clock <= clock
    FullAdder_2.reset <= reset
    inst FullAdder_3 of FullAdder_3 @[AdderNBit.scala 17:33]
    FullAdder_3.clock <= clock
    FullAdder_3.reset <= reset
    inst FullAdder_4 of FullAdder_4 @[AdderNBit.scala 17:33]
    FullAdder_4.clock <= clock
    FullAdder_4.reset <= reset
    inst FullAdder_5 of FullAdder_5 @[AdderNBit.scala 17:33]
    FullAdder_5.clock <= clock
    FullAdder_5.reset <= reset
    inst FullAdder_6 of FullAdder_6 @[AdderNBit.scala 17:33]
    FullAdder_6.clock <= clock
    FullAdder_6.reset <= reset
    inst FullAdder_7 of FullAdder_7 @[AdderNBit.scala 17:33]
    FullAdder_7.clock <= clock
    FullAdder_7.reset <= reset
    wire f : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}[8] @[AdderNBit.scala 17:26]
    f[0].carryOut <= FullAdder.io.carryOut @[AdderNBit.scala 17:26]
    f[0].sum <= FullAdder.io.sum @[AdderNBit.scala 17:26]
    FullAdder.io.carryIn <= f[0].carryIn @[AdderNBit.scala 17:26]
    FullAdder.io.b <= f[0].b @[AdderNBit.scala 17:26]
    FullAdder.io.a <= f[0].a @[AdderNBit.scala 17:26]
    f[1].carryOut <= FullAdder_1.io.carryOut @[AdderNBit.scala 17:26]
    f[1].sum <= FullAdder_1.io.sum @[AdderNBit.scala 17:26]
    FullAdder_1.io.carryIn <= f[1].carryIn @[AdderNBit.scala 17:26]
    FullAdder_1.io.b <= f[1].b @[AdderNBit.scala 17:26]
    FullAdder_1.io.a <= f[1].a @[AdderNBit.scala 17:26]
    f[2].carryOut <= FullAdder_2.io.carryOut @[AdderNBit.scala 17:26]
    f[2].sum <= FullAdder_2.io.sum @[AdderNBit.scala 17:26]
    FullAdder_2.io.carryIn <= f[2].carryIn @[AdderNBit.scala 17:26]
    FullAdder_2.io.b <= f[2].b @[AdderNBit.scala 17:26]
    FullAdder_2.io.a <= f[2].a @[AdderNBit.scala 17:26]
    f[3].carryOut <= FullAdder_3.io.carryOut @[AdderNBit.scala 17:26]
    f[3].sum <= FullAdder_3.io.sum @[AdderNBit.scala 17:26]
    FullAdder_3.io.carryIn <= f[3].carryIn @[AdderNBit.scala 17:26]
    FullAdder_3.io.b <= f[3].b @[AdderNBit.scala 17:26]
    FullAdder_3.io.a <= f[3].a @[AdderNBit.scala 17:26]
    f[4].carryOut <= FullAdder_4.io.carryOut @[AdderNBit.scala 17:26]
    f[4].sum <= FullAdder_4.io.sum @[AdderNBit.scala 17:26]
    FullAdder_4.io.carryIn <= f[4].carryIn @[AdderNBit.scala 17:26]
    FullAdder_4.io.b <= f[4].b @[AdderNBit.scala 17:26]
    FullAdder_4.io.a <= f[4].a @[AdderNBit.scala 17:26]
    f[5].carryOut <= FullAdder_5.io.carryOut @[AdderNBit.scala 17:26]
    f[5].sum <= FullAdder_5.io.sum @[AdderNBit.scala 17:26]
    FullAdder_5.io.carryIn <= f[5].carryIn @[AdderNBit.scala 17:26]
    FullAdder_5.io.b <= f[5].b @[AdderNBit.scala 17:26]
    FullAdder_5.io.a <= f[5].a @[AdderNBit.scala 17:26]
    f[6].carryOut <= FullAdder_6.io.carryOut @[AdderNBit.scala 17:26]
    f[6].sum <= FullAdder_6.io.sum @[AdderNBit.scala 17:26]
    FullAdder_6.io.carryIn <= f[6].carryIn @[AdderNBit.scala 17:26]
    FullAdder_6.io.b <= f[6].b @[AdderNBit.scala 17:26]
    FullAdder_6.io.a <= f[6].a @[AdderNBit.scala 17:26]
    f[7].carryOut <= FullAdder_7.io.carryOut @[AdderNBit.scala 17:26]
    f[7].sum <= FullAdder_7.io.sum @[AdderNBit.scala 17:26]
    FullAdder_7.io.carryIn <= f[7].carryIn @[AdderNBit.scala 17:26]
    FullAdder_7.io.b <= f[7].b @[AdderNBit.scala 17:26]
    FullAdder_7.io.a <= f[7].a @[AdderNBit.scala 17:26]
    wire carries : UInt<1>[9] @[AdderNBit.scala 19:20]
    wire sum : UInt<1>[8] @[AdderNBit.scala 20:16]
    carries[0] <= io.carryIn @[AdderNBit.scala 22:13]
    node _f_0_a_T = bits(io.a, 0, 0) @[AdderNBit.scala 24:18]
    f[0].a <= _f_0_a_T @[AdderNBit.scala 24:12]
    node _f_0_b_T = bits(io.b, 0, 0) @[AdderNBit.scala 25:19]
    f[0].b <= _f_0_b_T @[AdderNBit.scala 25:12]
    f[0].carryIn <= carries[0] @[AdderNBit.scala 26:18]
    sum[0] <= f[0].sum @[AdderNBit.scala 27:12]
    carries[1] <= f[0].carryOut @[AdderNBit.scala 28:18]
    node _f_1_a_T = bits(io.a, 1, 1) @[AdderNBit.scala 24:18]
    f[1].a <= _f_1_a_T @[AdderNBit.scala 24:12]
    node _f_1_b_T = bits(io.b, 1, 1) @[AdderNBit.scala 25:19]
    f[1].b <= _f_1_b_T @[AdderNBit.scala 25:12]
    f[1].carryIn <= carries[1] @[AdderNBit.scala 26:18]
    sum[1] <= f[1].sum @[AdderNBit.scala 27:12]
    carries[2] <= f[1].carryOut @[AdderNBit.scala 28:18]
    node _f_2_a_T = bits(io.a, 2, 2) @[AdderNBit.scala 24:18]
    f[2].a <= _f_2_a_T @[AdderNBit.scala 24:12]
    node _f_2_b_T = bits(io.b, 2, 2) @[AdderNBit.scala 25:19]
    f[2].b <= _f_2_b_T @[AdderNBit.scala 25:12]
    f[2].carryIn <= carries[2] @[AdderNBit.scala 26:18]
    sum[2] <= f[2].sum @[AdderNBit.scala 27:12]
    carries[3] <= f[2].carryOut @[AdderNBit.scala 28:18]
    node _f_3_a_T = bits(io.a, 3, 3) @[AdderNBit.scala 24:18]
    f[3].a <= _f_3_a_T @[AdderNBit.scala 24:12]
    node _f_3_b_T = bits(io.b, 3, 3) @[AdderNBit.scala 25:19]
    f[3].b <= _f_3_b_T @[AdderNBit.scala 25:12]
    f[3].carryIn <= carries[3] @[AdderNBit.scala 26:18]
    sum[3] <= f[3].sum @[AdderNBit.scala 27:12]
    carries[4] <= f[3].carryOut @[AdderNBit.scala 28:18]
    node _f_4_a_T = bits(io.a, 4, 4) @[AdderNBit.scala 24:18]
    f[4].a <= _f_4_a_T @[AdderNBit.scala 24:12]
    node _f_4_b_T = bits(io.b, 4, 4) @[AdderNBit.scala 25:19]
    f[4].b <= _f_4_b_T @[AdderNBit.scala 25:12]
    f[4].carryIn <= carries[4] @[AdderNBit.scala 26:18]
    sum[4] <= f[4].sum @[AdderNBit.scala 27:12]
    carries[5] <= f[4].carryOut @[AdderNBit.scala 28:18]
    node _f_5_a_T = bits(io.a, 5, 5) @[AdderNBit.scala 24:18]
    f[5].a <= _f_5_a_T @[AdderNBit.scala 24:12]
    node _f_5_b_T = bits(io.b, 5, 5) @[AdderNBit.scala 25:19]
    f[5].b <= _f_5_b_T @[AdderNBit.scala 25:12]
    f[5].carryIn <= carries[5] @[AdderNBit.scala 26:18]
    sum[5] <= f[5].sum @[AdderNBit.scala 27:12]
    carries[6] <= f[5].carryOut @[AdderNBit.scala 28:18]
    node _f_6_a_T = bits(io.a, 6, 6) @[AdderNBit.scala 24:18]
    f[6].a <= _f_6_a_T @[AdderNBit.scala 24:12]
    node _f_6_b_T = bits(io.b, 6, 6) @[AdderNBit.scala 25:19]
    f[6].b <= _f_6_b_T @[AdderNBit.scala 25:12]
    f[6].carryIn <= carries[6] @[AdderNBit.scala 26:18]
    sum[6] <= f[6].sum @[AdderNBit.scala 27:12]
    carries[7] <= f[6].carryOut @[AdderNBit.scala 28:18]
    node _f_7_a_T = bits(io.a, 7, 7) @[AdderNBit.scala 24:18]
    f[7].a <= _f_7_a_T @[AdderNBit.scala 24:12]
    node _f_7_b_T = bits(io.b, 7, 7) @[AdderNBit.scala 25:19]
    f[7].b <= _f_7_b_T @[AdderNBit.scala 25:12]
    f[7].carryIn <= carries[7] @[AdderNBit.scala 26:18]
    sum[7] <= f[7].sum @[AdderNBit.scala 27:12]
    carries[8] <= f[7].carryOut @[AdderNBit.scala 28:18]
    node io_sum_lo_lo = cat(sum[1], sum[0]) @[AdderNBit.scala 31:17]
    node io_sum_lo_hi = cat(sum[3], sum[2]) @[AdderNBit.scala 31:17]
    node io_sum_lo = cat(io_sum_lo_hi, io_sum_lo_lo) @[AdderNBit.scala 31:17]
    node io_sum_hi_lo = cat(sum[5], sum[4]) @[AdderNBit.scala 31:17]
    node io_sum_hi_hi = cat(sum[7], sum[6]) @[AdderNBit.scala 31:17]
    node io_sum_hi = cat(io_sum_hi_hi, io_sum_hi_lo) @[AdderNBit.scala 31:17]
    node _io_sum_T = cat(io_sum_hi, io_sum_lo) @[AdderNBit.scala 31:17]
    io.sum <= _io_sum_T @[AdderNBit.scala 31:10]
    io.carryOut <= f[7].carryOut @[AdderNBit.scala 32:15]

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

  module HalfAdder_24 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_25 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_12 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_24 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_25 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_26 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_27 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_13 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_26 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_27 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_28 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_29 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_14 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_28 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_29 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_30 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_31 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_15 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_30 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_31 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module AdderNBit_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<8>, flip b : UInt<8>, flip carryIn : UInt<1>, sum : UInt<8>, carryOut : UInt<1>}

    inst FullAdder of FullAdder_8 @[AdderNBit.scala 17:33]
    FullAdder.clock <= clock
    FullAdder.reset <= reset
    inst FullAdder_1 of FullAdder_9 @[AdderNBit.scala 17:33]
    FullAdder_1.clock <= clock
    FullAdder_1.reset <= reset
    inst FullAdder_2 of FullAdder_10 @[AdderNBit.scala 17:33]
    FullAdder_2.clock <= clock
    FullAdder_2.reset <= reset
    inst FullAdder_3 of FullAdder_11 @[AdderNBit.scala 17:33]
    FullAdder_3.clock <= clock
    FullAdder_3.reset <= reset
    inst FullAdder_4 of FullAdder_12 @[AdderNBit.scala 17:33]
    FullAdder_4.clock <= clock
    FullAdder_4.reset <= reset
    inst FullAdder_5 of FullAdder_13 @[AdderNBit.scala 17:33]
    FullAdder_5.clock <= clock
    FullAdder_5.reset <= reset
    inst FullAdder_6 of FullAdder_14 @[AdderNBit.scala 17:33]
    FullAdder_6.clock <= clock
    FullAdder_6.reset <= reset
    inst FullAdder_7 of FullAdder_15 @[AdderNBit.scala 17:33]
    FullAdder_7.clock <= clock
    FullAdder_7.reset <= reset
    wire f : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}[8] @[AdderNBit.scala 17:26]
    f[0].carryOut <= FullAdder.io.carryOut @[AdderNBit.scala 17:26]
    f[0].sum <= FullAdder.io.sum @[AdderNBit.scala 17:26]
    FullAdder.io.carryIn <= f[0].carryIn @[AdderNBit.scala 17:26]
    FullAdder.io.b <= f[0].b @[AdderNBit.scala 17:26]
    FullAdder.io.a <= f[0].a @[AdderNBit.scala 17:26]
    f[1].carryOut <= FullAdder_1.io.carryOut @[AdderNBit.scala 17:26]
    f[1].sum <= FullAdder_1.io.sum @[AdderNBit.scala 17:26]
    FullAdder_1.io.carryIn <= f[1].carryIn @[AdderNBit.scala 17:26]
    FullAdder_1.io.b <= f[1].b @[AdderNBit.scala 17:26]
    FullAdder_1.io.a <= f[1].a @[AdderNBit.scala 17:26]
    f[2].carryOut <= FullAdder_2.io.carryOut @[AdderNBit.scala 17:26]
    f[2].sum <= FullAdder_2.io.sum @[AdderNBit.scala 17:26]
    FullAdder_2.io.carryIn <= f[2].carryIn @[AdderNBit.scala 17:26]
    FullAdder_2.io.b <= f[2].b @[AdderNBit.scala 17:26]
    FullAdder_2.io.a <= f[2].a @[AdderNBit.scala 17:26]
    f[3].carryOut <= FullAdder_3.io.carryOut @[AdderNBit.scala 17:26]
    f[3].sum <= FullAdder_3.io.sum @[AdderNBit.scala 17:26]
    FullAdder_3.io.carryIn <= f[3].carryIn @[AdderNBit.scala 17:26]
    FullAdder_3.io.b <= f[3].b @[AdderNBit.scala 17:26]
    FullAdder_3.io.a <= f[3].a @[AdderNBit.scala 17:26]
    f[4].carryOut <= FullAdder_4.io.carryOut @[AdderNBit.scala 17:26]
    f[4].sum <= FullAdder_4.io.sum @[AdderNBit.scala 17:26]
    FullAdder_4.io.carryIn <= f[4].carryIn @[AdderNBit.scala 17:26]
    FullAdder_4.io.b <= f[4].b @[AdderNBit.scala 17:26]
    FullAdder_4.io.a <= f[4].a @[AdderNBit.scala 17:26]
    f[5].carryOut <= FullAdder_5.io.carryOut @[AdderNBit.scala 17:26]
    f[5].sum <= FullAdder_5.io.sum @[AdderNBit.scala 17:26]
    FullAdder_5.io.carryIn <= f[5].carryIn @[AdderNBit.scala 17:26]
    FullAdder_5.io.b <= f[5].b @[AdderNBit.scala 17:26]
    FullAdder_5.io.a <= f[5].a @[AdderNBit.scala 17:26]
    f[6].carryOut <= FullAdder_6.io.carryOut @[AdderNBit.scala 17:26]
    f[6].sum <= FullAdder_6.io.sum @[AdderNBit.scala 17:26]
    FullAdder_6.io.carryIn <= f[6].carryIn @[AdderNBit.scala 17:26]
    FullAdder_6.io.b <= f[6].b @[AdderNBit.scala 17:26]
    FullAdder_6.io.a <= f[6].a @[AdderNBit.scala 17:26]
    f[7].carryOut <= FullAdder_7.io.carryOut @[AdderNBit.scala 17:26]
    f[7].sum <= FullAdder_7.io.sum @[AdderNBit.scala 17:26]
    FullAdder_7.io.carryIn <= f[7].carryIn @[AdderNBit.scala 17:26]
    FullAdder_7.io.b <= f[7].b @[AdderNBit.scala 17:26]
    FullAdder_7.io.a <= f[7].a @[AdderNBit.scala 17:26]
    wire carries : UInt<1>[9] @[AdderNBit.scala 19:20]
    wire sum : UInt<1>[8] @[AdderNBit.scala 20:16]
    carries[0] <= io.carryIn @[AdderNBit.scala 22:13]
    node _f_0_a_T = bits(io.a, 0, 0) @[AdderNBit.scala 24:18]
    f[0].a <= _f_0_a_T @[AdderNBit.scala 24:12]
    node _f_0_b_T = bits(io.b, 0, 0) @[AdderNBit.scala 25:19]
    f[0].b <= _f_0_b_T @[AdderNBit.scala 25:12]
    f[0].carryIn <= carries[0] @[AdderNBit.scala 26:18]
    sum[0] <= f[0].sum @[AdderNBit.scala 27:12]
    carries[1] <= f[0].carryOut @[AdderNBit.scala 28:18]
    node _f_1_a_T = bits(io.a, 1, 1) @[AdderNBit.scala 24:18]
    f[1].a <= _f_1_a_T @[AdderNBit.scala 24:12]
    node _f_1_b_T = bits(io.b, 1, 1) @[AdderNBit.scala 25:19]
    f[1].b <= _f_1_b_T @[AdderNBit.scala 25:12]
    f[1].carryIn <= carries[1] @[AdderNBit.scala 26:18]
    sum[1] <= f[1].sum @[AdderNBit.scala 27:12]
    carries[2] <= f[1].carryOut @[AdderNBit.scala 28:18]
    node _f_2_a_T = bits(io.a, 2, 2) @[AdderNBit.scala 24:18]
    f[2].a <= _f_2_a_T @[AdderNBit.scala 24:12]
    node _f_2_b_T = bits(io.b, 2, 2) @[AdderNBit.scala 25:19]
    f[2].b <= _f_2_b_T @[AdderNBit.scala 25:12]
    f[2].carryIn <= carries[2] @[AdderNBit.scala 26:18]
    sum[2] <= f[2].sum @[AdderNBit.scala 27:12]
    carries[3] <= f[2].carryOut @[AdderNBit.scala 28:18]
    node _f_3_a_T = bits(io.a, 3, 3) @[AdderNBit.scala 24:18]
    f[3].a <= _f_3_a_T @[AdderNBit.scala 24:12]
    node _f_3_b_T = bits(io.b, 3, 3) @[AdderNBit.scala 25:19]
    f[3].b <= _f_3_b_T @[AdderNBit.scala 25:12]
    f[3].carryIn <= carries[3] @[AdderNBit.scala 26:18]
    sum[3] <= f[3].sum @[AdderNBit.scala 27:12]
    carries[4] <= f[3].carryOut @[AdderNBit.scala 28:18]
    node _f_4_a_T = bits(io.a, 4, 4) @[AdderNBit.scala 24:18]
    f[4].a <= _f_4_a_T @[AdderNBit.scala 24:12]
    node _f_4_b_T = bits(io.b, 4, 4) @[AdderNBit.scala 25:19]
    f[4].b <= _f_4_b_T @[AdderNBit.scala 25:12]
    f[4].carryIn <= carries[4] @[AdderNBit.scala 26:18]
    sum[4] <= f[4].sum @[AdderNBit.scala 27:12]
    carries[5] <= f[4].carryOut @[AdderNBit.scala 28:18]
    node _f_5_a_T = bits(io.a, 5, 5) @[AdderNBit.scala 24:18]
    f[5].a <= _f_5_a_T @[AdderNBit.scala 24:12]
    node _f_5_b_T = bits(io.b, 5, 5) @[AdderNBit.scala 25:19]
    f[5].b <= _f_5_b_T @[AdderNBit.scala 25:12]
    f[5].carryIn <= carries[5] @[AdderNBit.scala 26:18]
    sum[5] <= f[5].sum @[AdderNBit.scala 27:12]
    carries[6] <= f[5].carryOut @[AdderNBit.scala 28:18]
    node _f_6_a_T = bits(io.a, 6, 6) @[AdderNBit.scala 24:18]
    f[6].a <= _f_6_a_T @[AdderNBit.scala 24:12]
    node _f_6_b_T = bits(io.b, 6, 6) @[AdderNBit.scala 25:19]
    f[6].b <= _f_6_b_T @[AdderNBit.scala 25:12]
    f[6].carryIn <= carries[6] @[AdderNBit.scala 26:18]
    sum[6] <= f[6].sum @[AdderNBit.scala 27:12]
    carries[7] <= f[6].carryOut @[AdderNBit.scala 28:18]
    node _f_7_a_T = bits(io.a, 7, 7) @[AdderNBit.scala 24:18]
    f[7].a <= _f_7_a_T @[AdderNBit.scala 24:12]
    node _f_7_b_T = bits(io.b, 7, 7) @[AdderNBit.scala 25:19]
    f[7].b <= _f_7_b_T @[AdderNBit.scala 25:12]
    f[7].carryIn <= carries[7] @[AdderNBit.scala 26:18]
    sum[7] <= f[7].sum @[AdderNBit.scala 27:12]
    carries[8] <= f[7].carryOut @[AdderNBit.scala 28:18]
    node io_sum_lo_lo = cat(sum[1], sum[0]) @[AdderNBit.scala 31:17]
    node io_sum_lo_hi = cat(sum[3], sum[2]) @[AdderNBit.scala 31:17]
    node io_sum_lo = cat(io_sum_lo_hi, io_sum_lo_lo) @[AdderNBit.scala 31:17]
    node io_sum_hi_lo = cat(sum[5], sum[4]) @[AdderNBit.scala 31:17]
    node io_sum_hi_hi = cat(sum[7], sum[6]) @[AdderNBit.scala 31:17]
    node io_sum_hi = cat(io_sum_hi_hi, io_sum_hi_lo) @[AdderNBit.scala 31:17]
    node _io_sum_T = cat(io_sum_hi, io_sum_lo) @[AdderNBit.scala 31:17]
    io.sum <= _io_sum_T @[AdderNBit.scala 31:10]
    io.carryOut <= f[7].carryOut @[AdderNBit.scala 32:15]

  module Multiplier4Bit :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<4>, flip b : UInt<4>, result : UInt<8>}

    inst s1 of LeftShifter @[Multiplier4Bit.scala 14:18]
    s1.clock <= clock
    s1.reset <= reset
    s1.io.in <= io.a @[Multiplier4Bit.scala 16:12]
    node _s1_io_shiftAmount_T = bits(io.b, 2, 1) @[Multiplier4Bit.scala 17:27]
    s1.io.shiftAmount <= _s1_io_shiftAmount_T @[Multiplier4Bit.scala 17:21]
    inst adder8bit_1 of AdderNBit @[Multiplier4Bit.scala 20:27]
    adder8bit_1.clock <= clock
    adder8bit_1.reset <= reset
    adder8bit_1.io.carryIn <= UInt<1>("h0") @[Multiplier4Bit.scala 21:26]
    node _adder8bit_1_io_b_T = cat(UInt<2>("h0"), s1.io.out) @[Cat.scala 33:92]
    adder8bit_1.io.b <= _adder8bit_1_io_b_T @[Multiplier4Bit.scala 22:20]
    node _adder8bit_1_io_a_T = bits(io.b, 0, 0) @[Multiplier4Bit.scala 23:30]
    node _adder8bit_1_io_a_T_1 = cat(UInt<4>("h0"), io.a) @[Cat.scala 33:92]
    node _adder8bit_1_io_a_T_2 = mux(_adder8bit_1_io_a_T, _adder8bit_1_io_a_T_1, UInt<8>("h0")) @[Multiplier4Bit.scala 23:25]
    adder8bit_1.io.a <= _adder8bit_1_io_a_T_2 @[Multiplier4Bit.scala 23:20]
    inst adder8bit_2 of AdderNBit_1 @[Multiplier4Bit.scala 25:27]
    adder8bit_2.clock <= clock
    adder8bit_2.reset <= reset
    adder8bit_2.io.carryIn <= UInt<1>("h0") @[Multiplier4Bit.scala 26:26]
    adder8bit_2.io.a <= adder8bit_1.io.sum @[Multiplier4Bit.scala 27:20]
    node _adder8bit_2_io_b_T = bits(io.b, 3, 3) @[Multiplier4Bit.scala 28:30]
    node adder8bit_2_io_b_hi = cat(UInt<1>("h0"), io.a) @[Cat.scala 33:92]
    node _adder8bit_2_io_b_T_1 = cat(adder8bit_2_io_b_hi, UInt<3>("h0")) @[Cat.scala 33:92]
    node _adder8bit_2_io_b_T_2 = mux(_adder8bit_2_io_b_T, _adder8bit_2_io_b_T_1, UInt<8>("h0")) @[Multiplier4Bit.scala 28:25]
    adder8bit_2.io.b <= _adder8bit_2_io_b_T_2 @[Multiplier4Bit.scala 28:20]
    io.result <= adder8bit_2.io.sum @[Multiplier4Bit.scala 30:13]

