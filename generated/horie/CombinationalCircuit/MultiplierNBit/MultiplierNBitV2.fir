circuit MultiplierNBitV2 :
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

  module HalfAdder_32 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_33 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_16 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_32 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_33 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_34 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_35 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_17 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_34 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_35 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_36 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_37 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_18 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_36 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_37 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_38 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_39 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_19 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_38 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_39 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_40 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_41 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_20 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_40 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_41 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_42 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_43 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_21 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_42 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_43 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_44 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_45 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_22 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_44 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_45 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_46 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_47 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_23 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_46 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_47 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module AdderNBit_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<8>, flip b : UInt<8>, flip carryIn : UInt<1>, sum : UInt<8>, carryOut : UInt<1>}

    inst FullAdder of FullAdder_16 @[AdderNBit.scala 17:33]
    FullAdder.clock <= clock
    FullAdder.reset <= reset
    inst FullAdder_1 of FullAdder_17 @[AdderNBit.scala 17:33]
    FullAdder_1.clock <= clock
    FullAdder_1.reset <= reset
    inst FullAdder_2 of FullAdder_18 @[AdderNBit.scala 17:33]
    FullAdder_2.clock <= clock
    FullAdder_2.reset <= reset
    inst FullAdder_3 of FullAdder_19 @[AdderNBit.scala 17:33]
    FullAdder_3.clock <= clock
    FullAdder_3.reset <= reset
    inst FullAdder_4 of FullAdder_20 @[AdderNBit.scala 17:33]
    FullAdder_4.clock <= clock
    FullAdder_4.reset <= reset
    inst FullAdder_5 of FullAdder_21 @[AdderNBit.scala 17:33]
    FullAdder_5.clock <= clock
    FullAdder_5.reset <= reset
    inst FullAdder_6 of FullAdder_22 @[AdderNBit.scala 17:33]
    FullAdder_6.clock <= clock
    FullAdder_6.reset <= reset
    inst FullAdder_7 of FullAdder_23 @[AdderNBit.scala 17:33]
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

  module HalfAdder_48 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_49 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_24 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_48 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_49 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_50 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_51 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_25 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_50 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_51 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_52 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_53 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_26 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_52 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_53 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_54 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_55 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_27 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_54 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_55 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_56 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_57 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_28 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_56 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_57 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_58 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_59 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_29 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_58 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_59 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_60 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_61 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_30 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_60 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_61 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_62 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_63 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_31 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_62 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_63 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module AdderNBit_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<8>, flip b : UInt<8>, flip carryIn : UInt<1>, sum : UInt<8>, carryOut : UInt<1>}

    inst FullAdder of FullAdder_24 @[AdderNBit.scala 17:33]
    FullAdder.clock <= clock
    FullAdder.reset <= reset
    inst FullAdder_1 of FullAdder_25 @[AdderNBit.scala 17:33]
    FullAdder_1.clock <= clock
    FullAdder_1.reset <= reset
    inst FullAdder_2 of FullAdder_26 @[AdderNBit.scala 17:33]
    FullAdder_2.clock <= clock
    FullAdder_2.reset <= reset
    inst FullAdder_3 of FullAdder_27 @[AdderNBit.scala 17:33]
    FullAdder_3.clock <= clock
    FullAdder_3.reset <= reset
    inst FullAdder_4 of FullAdder_28 @[AdderNBit.scala 17:33]
    FullAdder_4.clock <= clock
    FullAdder_4.reset <= reset
    inst FullAdder_5 of FullAdder_29 @[AdderNBit.scala 17:33]
    FullAdder_5.clock <= clock
    FullAdder_5.reset <= reset
    inst FullAdder_6 of FullAdder_30 @[AdderNBit.scala 17:33]
    FullAdder_6.clock <= clock
    FullAdder_6.reset <= reset
    inst FullAdder_7 of FullAdder_31 @[AdderNBit.scala 17:33]
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

  module HalfAdder_64 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_65 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_32 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_64 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_65 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_66 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_67 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_33 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_66 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_67 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_68 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_69 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_34 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_68 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_69 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_70 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_71 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_35 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_70 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_71 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_72 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_73 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_36 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_72 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_73 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_74 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_75 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_37 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_74 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_75 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_76 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_77 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_38 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_76 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_77 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_78 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_79 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_39 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_78 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_79 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module AdderNBit_4 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<8>, flip b : UInt<8>, flip carryIn : UInt<1>, sum : UInt<8>, carryOut : UInt<1>}

    inst FullAdder of FullAdder_32 @[AdderNBit.scala 17:33]
    FullAdder.clock <= clock
    FullAdder.reset <= reset
    inst FullAdder_1 of FullAdder_33 @[AdderNBit.scala 17:33]
    FullAdder_1.clock <= clock
    FullAdder_1.reset <= reset
    inst FullAdder_2 of FullAdder_34 @[AdderNBit.scala 17:33]
    FullAdder_2.clock <= clock
    FullAdder_2.reset <= reset
    inst FullAdder_3 of FullAdder_35 @[AdderNBit.scala 17:33]
    FullAdder_3.clock <= clock
    FullAdder_3.reset <= reset
    inst FullAdder_4 of FullAdder_36 @[AdderNBit.scala 17:33]
    FullAdder_4.clock <= clock
    FullAdder_4.reset <= reset
    inst FullAdder_5 of FullAdder_37 @[AdderNBit.scala 17:33]
    FullAdder_5.clock <= clock
    FullAdder_5.reset <= reset
    inst FullAdder_6 of FullAdder_38 @[AdderNBit.scala 17:33]
    FullAdder_6.clock <= clock
    FullAdder_6.reset <= reset
    inst FullAdder_7 of FullAdder_39 @[AdderNBit.scala 17:33]
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

  module HalfAdder_80 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_81 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_40 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_80 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_81 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_82 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_83 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_41 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_82 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_83 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_84 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_85 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_42 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_84 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_85 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_86 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_87 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_43 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_86 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_87 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_88 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_89 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_44 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_88 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_89 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_90 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_91 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_45 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_90 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_91 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_92 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_93 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_46 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_92 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_93 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_94 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_95 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_47 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_94 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_95 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module AdderNBit_5 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<8>, flip b : UInt<8>, flip carryIn : UInt<1>, sum : UInt<8>, carryOut : UInt<1>}

    inst FullAdder of FullAdder_40 @[AdderNBit.scala 17:33]
    FullAdder.clock <= clock
    FullAdder.reset <= reset
    inst FullAdder_1 of FullAdder_41 @[AdderNBit.scala 17:33]
    FullAdder_1.clock <= clock
    FullAdder_1.reset <= reset
    inst FullAdder_2 of FullAdder_42 @[AdderNBit.scala 17:33]
    FullAdder_2.clock <= clock
    FullAdder_2.reset <= reset
    inst FullAdder_3 of FullAdder_43 @[AdderNBit.scala 17:33]
    FullAdder_3.clock <= clock
    FullAdder_3.reset <= reset
    inst FullAdder_4 of FullAdder_44 @[AdderNBit.scala 17:33]
    FullAdder_4.clock <= clock
    FullAdder_4.reset <= reset
    inst FullAdder_5 of FullAdder_45 @[AdderNBit.scala 17:33]
    FullAdder_5.clock <= clock
    FullAdder_5.reset <= reset
    inst FullAdder_6 of FullAdder_46 @[AdderNBit.scala 17:33]
    FullAdder_6.clock <= clock
    FullAdder_6.reset <= reset
    inst FullAdder_7 of FullAdder_47 @[AdderNBit.scala 17:33]
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

  module HalfAdder_96 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_97 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_48 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_96 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_97 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_98 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_99 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_49 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_98 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_99 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_100 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_101 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_50 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_100 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_101 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_102 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_103 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_51 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_102 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_103 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_104 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_105 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_52 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_104 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_105 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_106 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_107 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_53 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_106 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_107 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_108 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_109 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_54 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_108 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_109 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module HalfAdder_110 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module HalfAdder_111 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    node _io_sum_T = xor(io.a, io.b) @[HalfAdder.scala 11:18]
    io.sum <= _io_sum_T @[HalfAdder.scala 11:10]
    node _io_carryOut_T = and(io.a, io.b) @[HalfAdder.scala 12:23]
    io.carryOut <= _io_carryOut_T @[HalfAdder.scala 12:15]

  module FullAdder_55 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}

    inst h1 of HalfAdder_110 @[FullAdder.scala 15:17]
    h1.clock <= clock
    h1.reset <= reset
    inst h2 of HalfAdder_111 @[FullAdder.scala 16:18]
    h2.clock <= clock
    h2.reset <= reset
    h1.io.a <= io.a @[FullAdder.scala 21:11]
    h1.io.b <= io.b @[FullAdder.scala 22:11]
    h2.io.a <= h1.io.sum @[FullAdder.scala 23:11]
    h2.io.b <= io.carryIn @[FullAdder.scala 24:11]
    io.sum <= h2.io.sum @[FullAdder.scala 25:10]
    node _io_carryOut_T = or(h1.io.carryOut, h2.io.carryOut) @[FullAdder.scala 26:33]
    io.carryOut <= _io_carryOut_T @[FullAdder.scala 26:15]

  module AdderNBit_6 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<8>, flip b : UInt<8>, flip carryIn : UInt<1>, sum : UInt<8>, carryOut : UInt<1>}

    inst FullAdder of FullAdder_48 @[AdderNBit.scala 17:33]
    FullAdder.clock <= clock
    FullAdder.reset <= reset
    inst FullAdder_1 of FullAdder_49 @[AdderNBit.scala 17:33]
    FullAdder_1.clock <= clock
    FullAdder_1.reset <= reset
    inst FullAdder_2 of FullAdder_50 @[AdderNBit.scala 17:33]
    FullAdder_2.clock <= clock
    FullAdder_2.reset <= reset
    inst FullAdder_3 of FullAdder_51 @[AdderNBit.scala 17:33]
    FullAdder_3.clock <= clock
    FullAdder_3.reset <= reset
    inst FullAdder_4 of FullAdder_52 @[AdderNBit.scala 17:33]
    FullAdder_4.clock <= clock
    FullAdder_4.reset <= reset
    inst FullAdder_5 of FullAdder_53 @[AdderNBit.scala 17:33]
    FullAdder_5.clock <= clock
    FullAdder_5.reset <= reset
    inst FullAdder_6 of FullAdder_54 @[AdderNBit.scala 17:33]
    FullAdder_6.clock <= clock
    FullAdder_6.reset <= reset
    inst FullAdder_7 of FullAdder_55 @[AdderNBit.scala 17:33]
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

  module MultiplierNBitV2 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<8>, flip b : UInt<8>, result : UInt<16>}

    node _digits_T = bits(io.b, 0, 0) @[MultiplierNBitV2.scala 14:21]
    node _digits_T_1 = bits(_digits_T, 0, 0) @[Bitwise.scala 77:15]
    node _digits_T_2 = mux(_digits_T_1, UInt<8>("hff"), UInt<8>("h0")) @[Bitwise.scala 77:12]
    node _digits_T_3 = and(io.a, _digits_T_2) @[MultiplierNBitV2.scala 14:8]
    node _digits_T_4 = bits(io.b, 1, 1) @[MultiplierNBitV2.scala 14:21]
    node _digits_T_5 = bits(_digits_T_4, 0, 0) @[Bitwise.scala 77:15]
    node _digits_T_6 = mux(_digits_T_5, UInt<8>("hff"), UInt<8>("h0")) @[Bitwise.scala 77:12]
    node _digits_T_7 = and(io.a, _digits_T_6) @[MultiplierNBitV2.scala 14:8]
    node _digits_T_8 = bits(io.b, 2, 2) @[MultiplierNBitV2.scala 14:21]
    node _digits_T_9 = bits(_digits_T_8, 0, 0) @[Bitwise.scala 77:15]
    node _digits_T_10 = mux(_digits_T_9, UInt<8>("hff"), UInt<8>("h0")) @[Bitwise.scala 77:12]
    node _digits_T_11 = and(io.a, _digits_T_10) @[MultiplierNBitV2.scala 14:8]
    node _digits_T_12 = bits(io.b, 3, 3) @[MultiplierNBitV2.scala 14:21]
    node _digits_T_13 = bits(_digits_T_12, 0, 0) @[Bitwise.scala 77:15]
    node _digits_T_14 = mux(_digits_T_13, UInt<8>("hff"), UInt<8>("h0")) @[Bitwise.scala 77:12]
    node _digits_T_15 = and(io.a, _digits_T_14) @[MultiplierNBitV2.scala 14:8]
    node _digits_T_16 = bits(io.b, 4, 4) @[MultiplierNBitV2.scala 14:21]
    node _digits_T_17 = bits(_digits_T_16, 0, 0) @[Bitwise.scala 77:15]
    node _digits_T_18 = mux(_digits_T_17, UInt<8>("hff"), UInt<8>("h0")) @[Bitwise.scala 77:12]
    node _digits_T_19 = and(io.a, _digits_T_18) @[MultiplierNBitV2.scala 14:8]
    node _digits_T_20 = bits(io.b, 5, 5) @[MultiplierNBitV2.scala 14:21]
    node _digits_T_21 = bits(_digits_T_20, 0, 0) @[Bitwise.scala 77:15]
    node _digits_T_22 = mux(_digits_T_21, UInt<8>("hff"), UInt<8>("h0")) @[Bitwise.scala 77:12]
    node _digits_T_23 = and(io.a, _digits_T_22) @[MultiplierNBitV2.scala 14:8]
    node _digits_T_24 = bits(io.b, 6, 6) @[MultiplierNBitV2.scala 14:21]
    node _digits_T_25 = bits(_digits_T_24, 0, 0) @[Bitwise.scala 77:15]
    node _digits_T_26 = mux(_digits_T_25, UInt<8>("hff"), UInt<8>("h0")) @[Bitwise.scala 77:12]
    node _digits_T_27 = and(io.a, _digits_T_26) @[MultiplierNBitV2.scala 14:8]
    node _digits_T_28 = bits(io.b, 7, 7) @[MultiplierNBitV2.scala 14:21]
    node _digits_T_29 = bits(_digits_T_28, 0, 0) @[Bitwise.scala 77:15]
    node _digits_T_30 = mux(_digits_T_29, UInt<8>("hff"), UInt<8>("h0")) @[Bitwise.scala 77:12]
    node _digits_T_31 = and(io.a, _digits_T_30) @[MultiplierNBitV2.scala 14:8]
    wire digits : UInt<8>[8] @[MultiplierNBitV2.scala 13:22]
    digits[0] <= _digits_T_3 @[MultiplierNBitV2.scala 13:22]
    digits[1] <= _digits_T_7 @[MultiplierNBitV2.scala 13:22]
    digits[2] <= _digits_T_11 @[MultiplierNBitV2.scala 13:22]
    digits[3] <= _digits_T_15 @[MultiplierNBitV2.scala 13:22]
    digits[4] <= _digits_T_19 @[MultiplierNBitV2.scala 13:22]
    digits[5] <= _digits_T_23 @[MultiplierNBitV2.scala 13:22]
    digits[6] <= _digits_T_27 @[MultiplierNBitV2.scala 13:22]
    digits[7] <= _digits_T_31 @[MultiplierNBitV2.scala 13:22]
    inst AdderNBit of AdderNBit @[MultiplierNBitV2.scala 16:40]
    AdderNBit.clock <= clock
    AdderNBit.reset <= reset
    inst AdderNBit_1 of AdderNBit_1 @[MultiplierNBitV2.scala 16:40]
    AdderNBit_1.clock <= clock
    AdderNBit_1.reset <= reset
    inst AdderNBit_2 of AdderNBit_2 @[MultiplierNBitV2.scala 16:40]
    AdderNBit_2.clock <= clock
    AdderNBit_2.reset <= reset
    inst AdderNBit_3 of AdderNBit_3 @[MultiplierNBitV2.scala 16:40]
    AdderNBit_3.clock <= clock
    AdderNBit_3.reset <= reset
    inst AdderNBit_4 of AdderNBit_4 @[MultiplierNBitV2.scala 16:40]
    AdderNBit_4.clock <= clock
    AdderNBit_4.reset <= reset
    inst AdderNBit_5 of AdderNBit_5 @[MultiplierNBitV2.scala 16:40]
    AdderNBit_5.clock <= clock
    AdderNBit_5.reset <= reset
    inst AdderNBit_6 of AdderNBit_6 @[MultiplierNBitV2.scala 16:40]
    AdderNBit_6.clock <= clock
    AdderNBit_6.reset <= reset
    wire adders : { flip a : UInt<8>, flip b : UInt<8>, flip carryIn : UInt<1>, sum : UInt<8>, carryOut : UInt<1>}[7] @[MultiplierNBitV2.scala 16:33]
    adders[0].carryOut <= AdderNBit.io.carryOut @[MultiplierNBitV2.scala 16:33]
    adders[0].sum <= AdderNBit.io.sum @[MultiplierNBitV2.scala 16:33]
    AdderNBit.io.carryIn <= adders[0].carryIn @[MultiplierNBitV2.scala 16:33]
    AdderNBit.io.b <= adders[0].b @[MultiplierNBitV2.scala 16:33]
    AdderNBit.io.a <= adders[0].a @[MultiplierNBitV2.scala 16:33]
    adders[1].carryOut <= AdderNBit_1.io.carryOut @[MultiplierNBitV2.scala 16:33]
    adders[1].sum <= AdderNBit_1.io.sum @[MultiplierNBitV2.scala 16:33]
    AdderNBit_1.io.carryIn <= adders[1].carryIn @[MultiplierNBitV2.scala 16:33]
    AdderNBit_1.io.b <= adders[1].b @[MultiplierNBitV2.scala 16:33]
    AdderNBit_1.io.a <= adders[1].a @[MultiplierNBitV2.scala 16:33]
    adders[2].carryOut <= AdderNBit_2.io.carryOut @[MultiplierNBitV2.scala 16:33]
    adders[2].sum <= AdderNBit_2.io.sum @[MultiplierNBitV2.scala 16:33]
    AdderNBit_2.io.carryIn <= adders[2].carryIn @[MultiplierNBitV2.scala 16:33]
    AdderNBit_2.io.b <= adders[2].b @[MultiplierNBitV2.scala 16:33]
    AdderNBit_2.io.a <= adders[2].a @[MultiplierNBitV2.scala 16:33]
    adders[3].carryOut <= AdderNBit_3.io.carryOut @[MultiplierNBitV2.scala 16:33]
    adders[3].sum <= AdderNBit_3.io.sum @[MultiplierNBitV2.scala 16:33]
    AdderNBit_3.io.carryIn <= adders[3].carryIn @[MultiplierNBitV2.scala 16:33]
    AdderNBit_3.io.b <= adders[3].b @[MultiplierNBitV2.scala 16:33]
    AdderNBit_3.io.a <= adders[3].a @[MultiplierNBitV2.scala 16:33]
    adders[4].carryOut <= AdderNBit_4.io.carryOut @[MultiplierNBitV2.scala 16:33]
    adders[4].sum <= AdderNBit_4.io.sum @[MultiplierNBitV2.scala 16:33]
    AdderNBit_4.io.carryIn <= adders[4].carryIn @[MultiplierNBitV2.scala 16:33]
    AdderNBit_4.io.b <= adders[4].b @[MultiplierNBitV2.scala 16:33]
    AdderNBit_4.io.a <= adders[4].a @[MultiplierNBitV2.scala 16:33]
    adders[5].carryOut <= AdderNBit_5.io.carryOut @[MultiplierNBitV2.scala 16:33]
    adders[5].sum <= AdderNBit_5.io.sum @[MultiplierNBitV2.scala 16:33]
    AdderNBit_5.io.carryIn <= adders[5].carryIn @[MultiplierNBitV2.scala 16:33]
    AdderNBit_5.io.b <= adders[5].b @[MultiplierNBitV2.scala 16:33]
    AdderNBit_5.io.a <= adders[5].a @[MultiplierNBitV2.scala 16:33]
    adders[6].carryOut <= AdderNBit_6.io.carryOut @[MultiplierNBitV2.scala 16:33]
    adders[6].sum <= AdderNBit_6.io.sum @[MultiplierNBitV2.scala 16:33]
    AdderNBit_6.io.carryIn <= adders[6].carryIn @[MultiplierNBitV2.scala 16:33]
    AdderNBit_6.io.b <= adders[6].b @[MultiplierNBitV2.scala 16:33]
    AdderNBit_6.io.a <= adders[6].a @[MultiplierNBitV2.scala 16:33]
    adders[0].a <= digits[1] @[MultiplierNBitV2.scala 18:17]
    node _adders_0_b_T = bits(digits[0], 7, 1) @[MultiplierNBitV2.scala 19:45]
    node _adders_0_b_T_1 = cat(UInt<1>("h0"), _adders_0_b_T) @[Cat.scala 33:92]
    adders[0].b <= _adders_0_b_T_1 @[MultiplierNBitV2.scala 19:26]
    adders[0].carryIn <= UInt<1>("h0") @[MultiplierNBitV2.scala 21:23]
    adders[1].a <= digits[2] @[MultiplierNBitV2.scala 18:17]
    node _adders_1_b_T = bits(adders[0].sum, 7, 1) @[MultiplierNBitV2.scala 20:65]
    node _adders_1_b_T_1 = cat(adders[0].carryOut, _adders_1_b_T) @[Cat.scala 33:92]
    adders[1].b <= _adders_1_b_T_1 @[MultiplierNBitV2.scala 20:22]
    adders[1].carryIn <= UInt<1>("h0") @[MultiplierNBitV2.scala 21:23]
    adders[2].a <= digits[3] @[MultiplierNBitV2.scala 18:17]
    node _adders_2_b_T = bits(adders[1].sum, 7, 1) @[MultiplierNBitV2.scala 20:65]
    node _adders_2_b_T_1 = cat(adders[1].carryOut, _adders_2_b_T) @[Cat.scala 33:92]
    adders[2].b <= _adders_2_b_T_1 @[MultiplierNBitV2.scala 20:22]
    adders[2].carryIn <= UInt<1>("h0") @[MultiplierNBitV2.scala 21:23]
    adders[3].a <= digits[4] @[MultiplierNBitV2.scala 18:17]
    node _adders_3_b_T = bits(adders[2].sum, 7, 1) @[MultiplierNBitV2.scala 20:65]
    node _adders_3_b_T_1 = cat(adders[2].carryOut, _adders_3_b_T) @[Cat.scala 33:92]
    adders[3].b <= _adders_3_b_T_1 @[MultiplierNBitV2.scala 20:22]
    adders[3].carryIn <= UInt<1>("h0") @[MultiplierNBitV2.scala 21:23]
    adders[4].a <= digits[5] @[MultiplierNBitV2.scala 18:17]
    node _adders_4_b_T = bits(adders[3].sum, 7, 1) @[MultiplierNBitV2.scala 20:65]
    node _adders_4_b_T_1 = cat(adders[3].carryOut, _adders_4_b_T) @[Cat.scala 33:92]
    adders[4].b <= _adders_4_b_T_1 @[MultiplierNBitV2.scala 20:22]
    adders[4].carryIn <= UInt<1>("h0") @[MultiplierNBitV2.scala 21:23]
    adders[5].a <= digits[6] @[MultiplierNBitV2.scala 18:17]
    node _adders_5_b_T = bits(adders[4].sum, 7, 1) @[MultiplierNBitV2.scala 20:65]
    node _adders_5_b_T_1 = cat(adders[4].carryOut, _adders_5_b_T) @[Cat.scala 33:92]
    adders[5].b <= _adders_5_b_T_1 @[MultiplierNBitV2.scala 20:22]
    adders[5].carryIn <= UInt<1>("h0") @[MultiplierNBitV2.scala 21:23]
    adders[6].a <= digits[7] @[MultiplierNBitV2.scala 18:17]
    node _adders_6_b_T = bits(adders[5].sum, 7, 1) @[MultiplierNBitV2.scala 20:65]
    node _adders_6_b_T_1 = cat(adders[5].carryOut, _adders_6_b_T) @[Cat.scala 33:92]
    adders[6].b <= _adders_6_b_T_1 @[MultiplierNBitV2.scala 20:22]
    adders[6].carryIn <= UInt<1>("h0") @[MultiplierNBitV2.scala 21:23]
    node res_n_plus_1 = cat(adders[6].carryOut, adders[6].sum) @[Cat.scala 33:92]
    node _res_n_minus_2_T = bits(adders[5].sum, 0, 0) @[MultiplierNBitV2.scala 24:70]
    node _res_n_minus_2_T_1 = bits(adders[4].sum, 0, 0) @[MultiplierNBitV2.scala 24:70]
    node _res_n_minus_2_T_2 = bits(adders[3].sum, 0, 0) @[MultiplierNBitV2.scala 24:70]
    node _res_n_minus_2_T_3 = bits(adders[2].sum, 0, 0) @[MultiplierNBitV2.scala 24:70]
    node _res_n_minus_2_T_4 = bits(adders[1].sum, 0, 0) @[MultiplierNBitV2.scala 24:70]
    node _res_n_minus_2_T_5 = bits(adders[0].sum, 0, 0) @[MultiplierNBitV2.scala 24:70]
    node res_n_minus_2_lo_hi = cat(_res_n_minus_2_T_3, _res_n_minus_2_T_4) @[Cat.scala 33:92]
    node res_n_minus_2_lo = cat(res_n_minus_2_lo_hi, _res_n_minus_2_T_5) @[Cat.scala 33:92]
    node res_n_minus_2_hi_hi = cat(_res_n_minus_2_T, _res_n_minus_2_T_1) @[Cat.scala 33:92]
    node res_n_minus_2_hi = cat(res_n_minus_2_hi_hi, _res_n_minus_2_T_2) @[Cat.scala 33:92]
    node res_n_minus_2 = cat(res_n_minus_2_hi, res_n_minus_2_lo) @[Cat.scala 33:92]
    node _io_result_T = bits(digits[0], 0, 0) @[MultiplierNBitV2.scala 25:56]
    node io_result_hi = cat(res_n_plus_1, res_n_minus_2) @[Cat.scala 33:92]
    node _io_result_T_1 = cat(io_result_hi, _io_result_T) @[Cat.scala 33:92]
    io.result <= _io_result_T_1 @[MultiplierNBitV2.scala 25:13]

