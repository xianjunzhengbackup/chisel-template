circuit Counter31Bit :
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

  module AdderNBit :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<31>, flip b : UInt<31>, flip carryIn : UInt<1>, sum : UInt<31>, carryOut : UInt<1>}

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
    inst FullAdder_8 of FullAdder_8 @[AdderNBit.scala 17:33]
    FullAdder_8.clock <= clock
    FullAdder_8.reset <= reset
    inst FullAdder_9 of FullAdder_9 @[AdderNBit.scala 17:33]
    FullAdder_9.clock <= clock
    FullAdder_9.reset <= reset
    inst FullAdder_10 of FullAdder_10 @[AdderNBit.scala 17:33]
    FullAdder_10.clock <= clock
    FullAdder_10.reset <= reset
    inst FullAdder_11 of FullAdder_11 @[AdderNBit.scala 17:33]
    FullAdder_11.clock <= clock
    FullAdder_11.reset <= reset
    inst FullAdder_12 of FullAdder_12 @[AdderNBit.scala 17:33]
    FullAdder_12.clock <= clock
    FullAdder_12.reset <= reset
    inst FullAdder_13 of FullAdder_13 @[AdderNBit.scala 17:33]
    FullAdder_13.clock <= clock
    FullAdder_13.reset <= reset
    inst FullAdder_14 of FullAdder_14 @[AdderNBit.scala 17:33]
    FullAdder_14.clock <= clock
    FullAdder_14.reset <= reset
    inst FullAdder_15 of FullAdder_15 @[AdderNBit.scala 17:33]
    FullAdder_15.clock <= clock
    FullAdder_15.reset <= reset
    inst FullAdder_16 of FullAdder_16 @[AdderNBit.scala 17:33]
    FullAdder_16.clock <= clock
    FullAdder_16.reset <= reset
    inst FullAdder_17 of FullAdder_17 @[AdderNBit.scala 17:33]
    FullAdder_17.clock <= clock
    FullAdder_17.reset <= reset
    inst FullAdder_18 of FullAdder_18 @[AdderNBit.scala 17:33]
    FullAdder_18.clock <= clock
    FullAdder_18.reset <= reset
    inst FullAdder_19 of FullAdder_19 @[AdderNBit.scala 17:33]
    FullAdder_19.clock <= clock
    FullAdder_19.reset <= reset
    inst FullAdder_20 of FullAdder_20 @[AdderNBit.scala 17:33]
    FullAdder_20.clock <= clock
    FullAdder_20.reset <= reset
    inst FullAdder_21 of FullAdder_21 @[AdderNBit.scala 17:33]
    FullAdder_21.clock <= clock
    FullAdder_21.reset <= reset
    inst FullAdder_22 of FullAdder_22 @[AdderNBit.scala 17:33]
    FullAdder_22.clock <= clock
    FullAdder_22.reset <= reset
    inst FullAdder_23 of FullAdder_23 @[AdderNBit.scala 17:33]
    FullAdder_23.clock <= clock
    FullAdder_23.reset <= reset
    inst FullAdder_24 of FullAdder_24 @[AdderNBit.scala 17:33]
    FullAdder_24.clock <= clock
    FullAdder_24.reset <= reset
    inst FullAdder_25 of FullAdder_25 @[AdderNBit.scala 17:33]
    FullAdder_25.clock <= clock
    FullAdder_25.reset <= reset
    inst FullAdder_26 of FullAdder_26 @[AdderNBit.scala 17:33]
    FullAdder_26.clock <= clock
    FullAdder_26.reset <= reset
    inst FullAdder_27 of FullAdder_27 @[AdderNBit.scala 17:33]
    FullAdder_27.clock <= clock
    FullAdder_27.reset <= reset
    inst FullAdder_28 of FullAdder_28 @[AdderNBit.scala 17:33]
    FullAdder_28.clock <= clock
    FullAdder_28.reset <= reset
    inst FullAdder_29 of FullAdder_29 @[AdderNBit.scala 17:33]
    FullAdder_29.clock <= clock
    FullAdder_29.reset <= reset
    inst FullAdder_30 of FullAdder_30 @[AdderNBit.scala 17:33]
    FullAdder_30.clock <= clock
    FullAdder_30.reset <= reset
    wire f : { flip a : UInt<1>, flip b : UInt<1>, flip carryIn : UInt<1>, sum : UInt<1>, carryOut : UInt<1>}[31] @[AdderNBit.scala 17:26]
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
    f[8].carryOut <= FullAdder_8.io.carryOut @[AdderNBit.scala 17:26]
    f[8].sum <= FullAdder_8.io.sum @[AdderNBit.scala 17:26]
    FullAdder_8.io.carryIn <= f[8].carryIn @[AdderNBit.scala 17:26]
    FullAdder_8.io.b <= f[8].b @[AdderNBit.scala 17:26]
    FullAdder_8.io.a <= f[8].a @[AdderNBit.scala 17:26]
    f[9].carryOut <= FullAdder_9.io.carryOut @[AdderNBit.scala 17:26]
    f[9].sum <= FullAdder_9.io.sum @[AdderNBit.scala 17:26]
    FullAdder_9.io.carryIn <= f[9].carryIn @[AdderNBit.scala 17:26]
    FullAdder_9.io.b <= f[9].b @[AdderNBit.scala 17:26]
    FullAdder_9.io.a <= f[9].a @[AdderNBit.scala 17:26]
    f[10].carryOut <= FullAdder_10.io.carryOut @[AdderNBit.scala 17:26]
    f[10].sum <= FullAdder_10.io.sum @[AdderNBit.scala 17:26]
    FullAdder_10.io.carryIn <= f[10].carryIn @[AdderNBit.scala 17:26]
    FullAdder_10.io.b <= f[10].b @[AdderNBit.scala 17:26]
    FullAdder_10.io.a <= f[10].a @[AdderNBit.scala 17:26]
    f[11].carryOut <= FullAdder_11.io.carryOut @[AdderNBit.scala 17:26]
    f[11].sum <= FullAdder_11.io.sum @[AdderNBit.scala 17:26]
    FullAdder_11.io.carryIn <= f[11].carryIn @[AdderNBit.scala 17:26]
    FullAdder_11.io.b <= f[11].b @[AdderNBit.scala 17:26]
    FullAdder_11.io.a <= f[11].a @[AdderNBit.scala 17:26]
    f[12].carryOut <= FullAdder_12.io.carryOut @[AdderNBit.scala 17:26]
    f[12].sum <= FullAdder_12.io.sum @[AdderNBit.scala 17:26]
    FullAdder_12.io.carryIn <= f[12].carryIn @[AdderNBit.scala 17:26]
    FullAdder_12.io.b <= f[12].b @[AdderNBit.scala 17:26]
    FullAdder_12.io.a <= f[12].a @[AdderNBit.scala 17:26]
    f[13].carryOut <= FullAdder_13.io.carryOut @[AdderNBit.scala 17:26]
    f[13].sum <= FullAdder_13.io.sum @[AdderNBit.scala 17:26]
    FullAdder_13.io.carryIn <= f[13].carryIn @[AdderNBit.scala 17:26]
    FullAdder_13.io.b <= f[13].b @[AdderNBit.scala 17:26]
    FullAdder_13.io.a <= f[13].a @[AdderNBit.scala 17:26]
    f[14].carryOut <= FullAdder_14.io.carryOut @[AdderNBit.scala 17:26]
    f[14].sum <= FullAdder_14.io.sum @[AdderNBit.scala 17:26]
    FullAdder_14.io.carryIn <= f[14].carryIn @[AdderNBit.scala 17:26]
    FullAdder_14.io.b <= f[14].b @[AdderNBit.scala 17:26]
    FullAdder_14.io.a <= f[14].a @[AdderNBit.scala 17:26]
    f[15].carryOut <= FullAdder_15.io.carryOut @[AdderNBit.scala 17:26]
    f[15].sum <= FullAdder_15.io.sum @[AdderNBit.scala 17:26]
    FullAdder_15.io.carryIn <= f[15].carryIn @[AdderNBit.scala 17:26]
    FullAdder_15.io.b <= f[15].b @[AdderNBit.scala 17:26]
    FullAdder_15.io.a <= f[15].a @[AdderNBit.scala 17:26]
    f[16].carryOut <= FullAdder_16.io.carryOut @[AdderNBit.scala 17:26]
    f[16].sum <= FullAdder_16.io.sum @[AdderNBit.scala 17:26]
    FullAdder_16.io.carryIn <= f[16].carryIn @[AdderNBit.scala 17:26]
    FullAdder_16.io.b <= f[16].b @[AdderNBit.scala 17:26]
    FullAdder_16.io.a <= f[16].a @[AdderNBit.scala 17:26]
    f[17].carryOut <= FullAdder_17.io.carryOut @[AdderNBit.scala 17:26]
    f[17].sum <= FullAdder_17.io.sum @[AdderNBit.scala 17:26]
    FullAdder_17.io.carryIn <= f[17].carryIn @[AdderNBit.scala 17:26]
    FullAdder_17.io.b <= f[17].b @[AdderNBit.scala 17:26]
    FullAdder_17.io.a <= f[17].a @[AdderNBit.scala 17:26]
    f[18].carryOut <= FullAdder_18.io.carryOut @[AdderNBit.scala 17:26]
    f[18].sum <= FullAdder_18.io.sum @[AdderNBit.scala 17:26]
    FullAdder_18.io.carryIn <= f[18].carryIn @[AdderNBit.scala 17:26]
    FullAdder_18.io.b <= f[18].b @[AdderNBit.scala 17:26]
    FullAdder_18.io.a <= f[18].a @[AdderNBit.scala 17:26]
    f[19].carryOut <= FullAdder_19.io.carryOut @[AdderNBit.scala 17:26]
    f[19].sum <= FullAdder_19.io.sum @[AdderNBit.scala 17:26]
    FullAdder_19.io.carryIn <= f[19].carryIn @[AdderNBit.scala 17:26]
    FullAdder_19.io.b <= f[19].b @[AdderNBit.scala 17:26]
    FullAdder_19.io.a <= f[19].a @[AdderNBit.scala 17:26]
    f[20].carryOut <= FullAdder_20.io.carryOut @[AdderNBit.scala 17:26]
    f[20].sum <= FullAdder_20.io.sum @[AdderNBit.scala 17:26]
    FullAdder_20.io.carryIn <= f[20].carryIn @[AdderNBit.scala 17:26]
    FullAdder_20.io.b <= f[20].b @[AdderNBit.scala 17:26]
    FullAdder_20.io.a <= f[20].a @[AdderNBit.scala 17:26]
    f[21].carryOut <= FullAdder_21.io.carryOut @[AdderNBit.scala 17:26]
    f[21].sum <= FullAdder_21.io.sum @[AdderNBit.scala 17:26]
    FullAdder_21.io.carryIn <= f[21].carryIn @[AdderNBit.scala 17:26]
    FullAdder_21.io.b <= f[21].b @[AdderNBit.scala 17:26]
    FullAdder_21.io.a <= f[21].a @[AdderNBit.scala 17:26]
    f[22].carryOut <= FullAdder_22.io.carryOut @[AdderNBit.scala 17:26]
    f[22].sum <= FullAdder_22.io.sum @[AdderNBit.scala 17:26]
    FullAdder_22.io.carryIn <= f[22].carryIn @[AdderNBit.scala 17:26]
    FullAdder_22.io.b <= f[22].b @[AdderNBit.scala 17:26]
    FullAdder_22.io.a <= f[22].a @[AdderNBit.scala 17:26]
    f[23].carryOut <= FullAdder_23.io.carryOut @[AdderNBit.scala 17:26]
    f[23].sum <= FullAdder_23.io.sum @[AdderNBit.scala 17:26]
    FullAdder_23.io.carryIn <= f[23].carryIn @[AdderNBit.scala 17:26]
    FullAdder_23.io.b <= f[23].b @[AdderNBit.scala 17:26]
    FullAdder_23.io.a <= f[23].a @[AdderNBit.scala 17:26]
    f[24].carryOut <= FullAdder_24.io.carryOut @[AdderNBit.scala 17:26]
    f[24].sum <= FullAdder_24.io.sum @[AdderNBit.scala 17:26]
    FullAdder_24.io.carryIn <= f[24].carryIn @[AdderNBit.scala 17:26]
    FullAdder_24.io.b <= f[24].b @[AdderNBit.scala 17:26]
    FullAdder_24.io.a <= f[24].a @[AdderNBit.scala 17:26]
    f[25].carryOut <= FullAdder_25.io.carryOut @[AdderNBit.scala 17:26]
    f[25].sum <= FullAdder_25.io.sum @[AdderNBit.scala 17:26]
    FullAdder_25.io.carryIn <= f[25].carryIn @[AdderNBit.scala 17:26]
    FullAdder_25.io.b <= f[25].b @[AdderNBit.scala 17:26]
    FullAdder_25.io.a <= f[25].a @[AdderNBit.scala 17:26]
    f[26].carryOut <= FullAdder_26.io.carryOut @[AdderNBit.scala 17:26]
    f[26].sum <= FullAdder_26.io.sum @[AdderNBit.scala 17:26]
    FullAdder_26.io.carryIn <= f[26].carryIn @[AdderNBit.scala 17:26]
    FullAdder_26.io.b <= f[26].b @[AdderNBit.scala 17:26]
    FullAdder_26.io.a <= f[26].a @[AdderNBit.scala 17:26]
    f[27].carryOut <= FullAdder_27.io.carryOut @[AdderNBit.scala 17:26]
    f[27].sum <= FullAdder_27.io.sum @[AdderNBit.scala 17:26]
    FullAdder_27.io.carryIn <= f[27].carryIn @[AdderNBit.scala 17:26]
    FullAdder_27.io.b <= f[27].b @[AdderNBit.scala 17:26]
    FullAdder_27.io.a <= f[27].a @[AdderNBit.scala 17:26]
    f[28].carryOut <= FullAdder_28.io.carryOut @[AdderNBit.scala 17:26]
    f[28].sum <= FullAdder_28.io.sum @[AdderNBit.scala 17:26]
    FullAdder_28.io.carryIn <= f[28].carryIn @[AdderNBit.scala 17:26]
    FullAdder_28.io.b <= f[28].b @[AdderNBit.scala 17:26]
    FullAdder_28.io.a <= f[28].a @[AdderNBit.scala 17:26]
    f[29].carryOut <= FullAdder_29.io.carryOut @[AdderNBit.scala 17:26]
    f[29].sum <= FullAdder_29.io.sum @[AdderNBit.scala 17:26]
    FullAdder_29.io.carryIn <= f[29].carryIn @[AdderNBit.scala 17:26]
    FullAdder_29.io.b <= f[29].b @[AdderNBit.scala 17:26]
    FullAdder_29.io.a <= f[29].a @[AdderNBit.scala 17:26]
    f[30].carryOut <= FullAdder_30.io.carryOut @[AdderNBit.scala 17:26]
    f[30].sum <= FullAdder_30.io.sum @[AdderNBit.scala 17:26]
    FullAdder_30.io.carryIn <= f[30].carryIn @[AdderNBit.scala 17:26]
    FullAdder_30.io.b <= f[30].b @[AdderNBit.scala 17:26]
    FullAdder_30.io.a <= f[30].a @[AdderNBit.scala 17:26]
    wire carries : UInt<1>[32] @[AdderNBit.scala 19:20]
    wire sum : UInt<1>[31] @[AdderNBit.scala 20:16]
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
    node _f_8_a_T = bits(io.a, 8, 8) @[AdderNBit.scala 24:18]
    f[8].a <= _f_8_a_T @[AdderNBit.scala 24:12]
    node _f_8_b_T = bits(io.b, 8, 8) @[AdderNBit.scala 25:19]
    f[8].b <= _f_8_b_T @[AdderNBit.scala 25:12]
    f[8].carryIn <= carries[8] @[AdderNBit.scala 26:18]
    sum[8] <= f[8].sum @[AdderNBit.scala 27:12]
    carries[9] <= f[8].carryOut @[AdderNBit.scala 28:18]
    node _f_9_a_T = bits(io.a, 9, 9) @[AdderNBit.scala 24:18]
    f[9].a <= _f_9_a_T @[AdderNBit.scala 24:12]
    node _f_9_b_T = bits(io.b, 9, 9) @[AdderNBit.scala 25:19]
    f[9].b <= _f_9_b_T @[AdderNBit.scala 25:12]
    f[9].carryIn <= carries[9] @[AdderNBit.scala 26:18]
    sum[9] <= f[9].sum @[AdderNBit.scala 27:12]
    carries[10] <= f[9].carryOut @[AdderNBit.scala 28:18]
    node _f_10_a_T = bits(io.a, 10, 10) @[AdderNBit.scala 24:18]
    f[10].a <= _f_10_a_T @[AdderNBit.scala 24:12]
    node _f_10_b_T = bits(io.b, 10, 10) @[AdderNBit.scala 25:19]
    f[10].b <= _f_10_b_T @[AdderNBit.scala 25:12]
    f[10].carryIn <= carries[10] @[AdderNBit.scala 26:18]
    sum[10] <= f[10].sum @[AdderNBit.scala 27:12]
    carries[11] <= f[10].carryOut @[AdderNBit.scala 28:18]
    node _f_11_a_T = bits(io.a, 11, 11) @[AdderNBit.scala 24:18]
    f[11].a <= _f_11_a_T @[AdderNBit.scala 24:12]
    node _f_11_b_T = bits(io.b, 11, 11) @[AdderNBit.scala 25:19]
    f[11].b <= _f_11_b_T @[AdderNBit.scala 25:12]
    f[11].carryIn <= carries[11] @[AdderNBit.scala 26:18]
    sum[11] <= f[11].sum @[AdderNBit.scala 27:12]
    carries[12] <= f[11].carryOut @[AdderNBit.scala 28:18]
    node _f_12_a_T = bits(io.a, 12, 12) @[AdderNBit.scala 24:18]
    f[12].a <= _f_12_a_T @[AdderNBit.scala 24:12]
    node _f_12_b_T = bits(io.b, 12, 12) @[AdderNBit.scala 25:19]
    f[12].b <= _f_12_b_T @[AdderNBit.scala 25:12]
    f[12].carryIn <= carries[12] @[AdderNBit.scala 26:18]
    sum[12] <= f[12].sum @[AdderNBit.scala 27:12]
    carries[13] <= f[12].carryOut @[AdderNBit.scala 28:18]
    node _f_13_a_T = bits(io.a, 13, 13) @[AdderNBit.scala 24:18]
    f[13].a <= _f_13_a_T @[AdderNBit.scala 24:12]
    node _f_13_b_T = bits(io.b, 13, 13) @[AdderNBit.scala 25:19]
    f[13].b <= _f_13_b_T @[AdderNBit.scala 25:12]
    f[13].carryIn <= carries[13] @[AdderNBit.scala 26:18]
    sum[13] <= f[13].sum @[AdderNBit.scala 27:12]
    carries[14] <= f[13].carryOut @[AdderNBit.scala 28:18]
    node _f_14_a_T = bits(io.a, 14, 14) @[AdderNBit.scala 24:18]
    f[14].a <= _f_14_a_T @[AdderNBit.scala 24:12]
    node _f_14_b_T = bits(io.b, 14, 14) @[AdderNBit.scala 25:19]
    f[14].b <= _f_14_b_T @[AdderNBit.scala 25:12]
    f[14].carryIn <= carries[14] @[AdderNBit.scala 26:18]
    sum[14] <= f[14].sum @[AdderNBit.scala 27:12]
    carries[15] <= f[14].carryOut @[AdderNBit.scala 28:18]
    node _f_15_a_T = bits(io.a, 15, 15) @[AdderNBit.scala 24:18]
    f[15].a <= _f_15_a_T @[AdderNBit.scala 24:12]
    node _f_15_b_T = bits(io.b, 15, 15) @[AdderNBit.scala 25:19]
    f[15].b <= _f_15_b_T @[AdderNBit.scala 25:12]
    f[15].carryIn <= carries[15] @[AdderNBit.scala 26:18]
    sum[15] <= f[15].sum @[AdderNBit.scala 27:12]
    carries[16] <= f[15].carryOut @[AdderNBit.scala 28:18]
    node _f_16_a_T = bits(io.a, 16, 16) @[AdderNBit.scala 24:18]
    f[16].a <= _f_16_a_T @[AdderNBit.scala 24:12]
    node _f_16_b_T = bits(io.b, 16, 16) @[AdderNBit.scala 25:19]
    f[16].b <= _f_16_b_T @[AdderNBit.scala 25:12]
    f[16].carryIn <= carries[16] @[AdderNBit.scala 26:18]
    sum[16] <= f[16].sum @[AdderNBit.scala 27:12]
    carries[17] <= f[16].carryOut @[AdderNBit.scala 28:18]
    node _f_17_a_T = bits(io.a, 17, 17) @[AdderNBit.scala 24:18]
    f[17].a <= _f_17_a_T @[AdderNBit.scala 24:12]
    node _f_17_b_T = bits(io.b, 17, 17) @[AdderNBit.scala 25:19]
    f[17].b <= _f_17_b_T @[AdderNBit.scala 25:12]
    f[17].carryIn <= carries[17] @[AdderNBit.scala 26:18]
    sum[17] <= f[17].sum @[AdderNBit.scala 27:12]
    carries[18] <= f[17].carryOut @[AdderNBit.scala 28:18]
    node _f_18_a_T = bits(io.a, 18, 18) @[AdderNBit.scala 24:18]
    f[18].a <= _f_18_a_T @[AdderNBit.scala 24:12]
    node _f_18_b_T = bits(io.b, 18, 18) @[AdderNBit.scala 25:19]
    f[18].b <= _f_18_b_T @[AdderNBit.scala 25:12]
    f[18].carryIn <= carries[18] @[AdderNBit.scala 26:18]
    sum[18] <= f[18].sum @[AdderNBit.scala 27:12]
    carries[19] <= f[18].carryOut @[AdderNBit.scala 28:18]
    node _f_19_a_T = bits(io.a, 19, 19) @[AdderNBit.scala 24:18]
    f[19].a <= _f_19_a_T @[AdderNBit.scala 24:12]
    node _f_19_b_T = bits(io.b, 19, 19) @[AdderNBit.scala 25:19]
    f[19].b <= _f_19_b_T @[AdderNBit.scala 25:12]
    f[19].carryIn <= carries[19] @[AdderNBit.scala 26:18]
    sum[19] <= f[19].sum @[AdderNBit.scala 27:12]
    carries[20] <= f[19].carryOut @[AdderNBit.scala 28:18]
    node _f_20_a_T = bits(io.a, 20, 20) @[AdderNBit.scala 24:18]
    f[20].a <= _f_20_a_T @[AdderNBit.scala 24:12]
    node _f_20_b_T = bits(io.b, 20, 20) @[AdderNBit.scala 25:19]
    f[20].b <= _f_20_b_T @[AdderNBit.scala 25:12]
    f[20].carryIn <= carries[20] @[AdderNBit.scala 26:18]
    sum[20] <= f[20].sum @[AdderNBit.scala 27:12]
    carries[21] <= f[20].carryOut @[AdderNBit.scala 28:18]
    node _f_21_a_T = bits(io.a, 21, 21) @[AdderNBit.scala 24:18]
    f[21].a <= _f_21_a_T @[AdderNBit.scala 24:12]
    node _f_21_b_T = bits(io.b, 21, 21) @[AdderNBit.scala 25:19]
    f[21].b <= _f_21_b_T @[AdderNBit.scala 25:12]
    f[21].carryIn <= carries[21] @[AdderNBit.scala 26:18]
    sum[21] <= f[21].sum @[AdderNBit.scala 27:12]
    carries[22] <= f[21].carryOut @[AdderNBit.scala 28:18]
    node _f_22_a_T = bits(io.a, 22, 22) @[AdderNBit.scala 24:18]
    f[22].a <= _f_22_a_T @[AdderNBit.scala 24:12]
    node _f_22_b_T = bits(io.b, 22, 22) @[AdderNBit.scala 25:19]
    f[22].b <= _f_22_b_T @[AdderNBit.scala 25:12]
    f[22].carryIn <= carries[22] @[AdderNBit.scala 26:18]
    sum[22] <= f[22].sum @[AdderNBit.scala 27:12]
    carries[23] <= f[22].carryOut @[AdderNBit.scala 28:18]
    node _f_23_a_T = bits(io.a, 23, 23) @[AdderNBit.scala 24:18]
    f[23].a <= _f_23_a_T @[AdderNBit.scala 24:12]
    node _f_23_b_T = bits(io.b, 23, 23) @[AdderNBit.scala 25:19]
    f[23].b <= _f_23_b_T @[AdderNBit.scala 25:12]
    f[23].carryIn <= carries[23] @[AdderNBit.scala 26:18]
    sum[23] <= f[23].sum @[AdderNBit.scala 27:12]
    carries[24] <= f[23].carryOut @[AdderNBit.scala 28:18]
    node _f_24_a_T = bits(io.a, 24, 24) @[AdderNBit.scala 24:18]
    f[24].a <= _f_24_a_T @[AdderNBit.scala 24:12]
    node _f_24_b_T = bits(io.b, 24, 24) @[AdderNBit.scala 25:19]
    f[24].b <= _f_24_b_T @[AdderNBit.scala 25:12]
    f[24].carryIn <= carries[24] @[AdderNBit.scala 26:18]
    sum[24] <= f[24].sum @[AdderNBit.scala 27:12]
    carries[25] <= f[24].carryOut @[AdderNBit.scala 28:18]
    node _f_25_a_T = bits(io.a, 25, 25) @[AdderNBit.scala 24:18]
    f[25].a <= _f_25_a_T @[AdderNBit.scala 24:12]
    node _f_25_b_T = bits(io.b, 25, 25) @[AdderNBit.scala 25:19]
    f[25].b <= _f_25_b_T @[AdderNBit.scala 25:12]
    f[25].carryIn <= carries[25] @[AdderNBit.scala 26:18]
    sum[25] <= f[25].sum @[AdderNBit.scala 27:12]
    carries[26] <= f[25].carryOut @[AdderNBit.scala 28:18]
    node _f_26_a_T = bits(io.a, 26, 26) @[AdderNBit.scala 24:18]
    f[26].a <= _f_26_a_T @[AdderNBit.scala 24:12]
    node _f_26_b_T = bits(io.b, 26, 26) @[AdderNBit.scala 25:19]
    f[26].b <= _f_26_b_T @[AdderNBit.scala 25:12]
    f[26].carryIn <= carries[26] @[AdderNBit.scala 26:18]
    sum[26] <= f[26].sum @[AdderNBit.scala 27:12]
    carries[27] <= f[26].carryOut @[AdderNBit.scala 28:18]
    node _f_27_a_T = bits(io.a, 27, 27) @[AdderNBit.scala 24:18]
    f[27].a <= _f_27_a_T @[AdderNBit.scala 24:12]
    node _f_27_b_T = bits(io.b, 27, 27) @[AdderNBit.scala 25:19]
    f[27].b <= _f_27_b_T @[AdderNBit.scala 25:12]
    f[27].carryIn <= carries[27] @[AdderNBit.scala 26:18]
    sum[27] <= f[27].sum @[AdderNBit.scala 27:12]
    carries[28] <= f[27].carryOut @[AdderNBit.scala 28:18]
    node _f_28_a_T = bits(io.a, 28, 28) @[AdderNBit.scala 24:18]
    f[28].a <= _f_28_a_T @[AdderNBit.scala 24:12]
    node _f_28_b_T = bits(io.b, 28, 28) @[AdderNBit.scala 25:19]
    f[28].b <= _f_28_b_T @[AdderNBit.scala 25:12]
    f[28].carryIn <= carries[28] @[AdderNBit.scala 26:18]
    sum[28] <= f[28].sum @[AdderNBit.scala 27:12]
    carries[29] <= f[28].carryOut @[AdderNBit.scala 28:18]
    node _f_29_a_T = bits(io.a, 29, 29) @[AdderNBit.scala 24:18]
    f[29].a <= _f_29_a_T @[AdderNBit.scala 24:12]
    node _f_29_b_T = bits(io.b, 29, 29) @[AdderNBit.scala 25:19]
    f[29].b <= _f_29_b_T @[AdderNBit.scala 25:12]
    f[29].carryIn <= carries[29] @[AdderNBit.scala 26:18]
    sum[29] <= f[29].sum @[AdderNBit.scala 27:12]
    carries[30] <= f[29].carryOut @[AdderNBit.scala 28:18]
    node _f_30_a_T = bits(io.a, 30, 30) @[AdderNBit.scala 24:18]
    f[30].a <= _f_30_a_T @[AdderNBit.scala 24:12]
    node _f_30_b_T = bits(io.b, 30, 30) @[AdderNBit.scala 25:19]
    f[30].b <= _f_30_b_T @[AdderNBit.scala 25:12]
    f[30].carryIn <= carries[30] @[AdderNBit.scala 26:18]
    sum[30] <= f[30].sum @[AdderNBit.scala 27:12]
    carries[31] <= f[30].carryOut @[AdderNBit.scala 28:18]
    node io_sum_lo_lo_lo_hi = cat(sum[2], sum[1]) @[AdderNBit.scala 31:17]
    node io_sum_lo_lo_lo = cat(io_sum_lo_lo_lo_hi, sum[0]) @[AdderNBit.scala 31:17]
    node io_sum_lo_lo_hi_lo = cat(sum[4], sum[3]) @[AdderNBit.scala 31:17]
    node io_sum_lo_lo_hi_hi = cat(sum[6], sum[5]) @[AdderNBit.scala 31:17]
    node io_sum_lo_lo_hi = cat(io_sum_lo_lo_hi_hi, io_sum_lo_lo_hi_lo) @[AdderNBit.scala 31:17]
    node io_sum_lo_lo = cat(io_sum_lo_lo_hi, io_sum_lo_lo_lo) @[AdderNBit.scala 31:17]
    node io_sum_lo_hi_lo_lo = cat(sum[8], sum[7]) @[AdderNBit.scala 31:17]
    node io_sum_lo_hi_lo_hi = cat(sum[10], sum[9]) @[AdderNBit.scala 31:17]
    node io_sum_lo_hi_lo = cat(io_sum_lo_hi_lo_hi, io_sum_lo_hi_lo_lo) @[AdderNBit.scala 31:17]
    node io_sum_lo_hi_hi_lo = cat(sum[12], sum[11]) @[AdderNBit.scala 31:17]
    node io_sum_lo_hi_hi_hi = cat(sum[14], sum[13]) @[AdderNBit.scala 31:17]
    node io_sum_lo_hi_hi = cat(io_sum_lo_hi_hi_hi, io_sum_lo_hi_hi_lo) @[AdderNBit.scala 31:17]
    node io_sum_lo_hi = cat(io_sum_lo_hi_hi, io_sum_lo_hi_lo) @[AdderNBit.scala 31:17]
    node io_sum_lo = cat(io_sum_lo_hi, io_sum_lo_lo) @[AdderNBit.scala 31:17]
    node io_sum_hi_lo_lo_lo = cat(sum[16], sum[15]) @[AdderNBit.scala 31:17]
    node io_sum_hi_lo_lo_hi = cat(sum[18], sum[17]) @[AdderNBit.scala 31:17]
    node io_sum_hi_lo_lo = cat(io_sum_hi_lo_lo_hi, io_sum_hi_lo_lo_lo) @[AdderNBit.scala 31:17]
    node io_sum_hi_lo_hi_lo = cat(sum[20], sum[19]) @[AdderNBit.scala 31:17]
    node io_sum_hi_lo_hi_hi = cat(sum[22], sum[21]) @[AdderNBit.scala 31:17]
    node io_sum_hi_lo_hi = cat(io_sum_hi_lo_hi_hi, io_sum_hi_lo_hi_lo) @[AdderNBit.scala 31:17]
    node io_sum_hi_lo = cat(io_sum_hi_lo_hi, io_sum_hi_lo_lo) @[AdderNBit.scala 31:17]
    node io_sum_hi_hi_lo_lo = cat(sum[24], sum[23]) @[AdderNBit.scala 31:17]
    node io_sum_hi_hi_lo_hi = cat(sum[26], sum[25]) @[AdderNBit.scala 31:17]
    node io_sum_hi_hi_lo = cat(io_sum_hi_hi_lo_hi, io_sum_hi_hi_lo_lo) @[AdderNBit.scala 31:17]
    node io_sum_hi_hi_hi_lo = cat(sum[28], sum[27]) @[AdderNBit.scala 31:17]
    node io_sum_hi_hi_hi_hi = cat(sum[30], sum[29]) @[AdderNBit.scala 31:17]
    node io_sum_hi_hi_hi = cat(io_sum_hi_hi_hi_hi, io_sum_hi_hi_hi_lo) @[AdderNBit.scala 31:17]
    node io_sum_hi_hi = cat(io_sum_hi_hi_hi, io_sum_hi_hi_lo) @[AdderNBit.scala 31:17]
    node io_sum_hi = cat(io_sum_hi_hi, io_sum_hi_lo) @[AdderNBit.scala 31:17]
    node _io_sum_T = cat(io_sum_hi, io_sum_lo) @[AdderNBit.scala 31:17]
    io.sum <= _io_sum_T @[AdderNBit.scala 31:10]
    io.carryOut <= f[30].carryOut @[AdderNBit.scala 32:15]

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

  module Counter31Bit :
    input clock : Clock
    input reset : UInt<1>
    output io : { seg7led : { cathodes : UInt<7>, decimalPoint : UInt<1>, anodes : UInt<8>}}

    inst adder31Bit of AdderNBit @[Counter31Bit.scala 12:26]
    adder31Bit.clock <= clock
    adder31Bit.reset <= reset
    reg reg31Bit : UInt<31>, clock with :
      reset => (reset, UInt<31>("h0")) @[Counter31Bit.scala 13:25]
    adder31Bit.io.a <= reg31Bit @[Counter31Bit.scala 14:19]
    adder31Bit.io.b <= UInt<31>("h1") @[Counter31Bit.scala 15:19]
    adder31Bit.io.carryIn <= UInt<1>("h0") @[Counter31Bit.scala 16:25]
    reg31Bit <= adder31Bit.io.sum @[Counter31Bit.scala 17:12]
    inst seg of Seg7LED1Digit @[Counter31Bit.scala 19:19]
    seg.clock <= clock
    seg.reset <= reset
    node _seg_io_num_T = bits(reg31Bit, 3, 0) @[Counter31Bit.scala 20:25]
    seg.io.num <= _seg_io_num_T @[Counter31Bit.scala 20:14]
    io.seg7led <= seg.io.seg7led @[Counter31Bit.scala 21:14]

