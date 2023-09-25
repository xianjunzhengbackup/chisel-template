circuit DFlipFlop :
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

  module DLatch :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<1>, flip enable : UInt<1>, q : UInt<1>}

    inst srLatch of SRLatch @[DLatch.scala 13:21]
    srLatch.clock <= clock
    srLatch.reset <= reset
    node _srLatch_io_reset_T = not(io.data) @[DLatch.scala 14:35]
    node _srLatch_io_reset_T_1 = and(io.enable, _srLatch_io_reset_T) @[DLatch.scala 14:33]
    srLatch.io.reset <= _srLatch_io_reset_T_1 @[DLatch.scala 14:20]
    node _srLatch_io_set_T = and(io.enable, io.data) @[DLatch.scala 15:31]
    srLatch.io.set <= _srLatch_io_set_T @[DLatch.scala 15:18]
    io.q <= srLatch.io.q @[DLatch.scala 17:8]

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

  module DLatch_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<1>, flip enable : UInt<1>, q : UInt<1>}

    inst srLatch of SRLatch_1 @[DLatch.scala 13:21]
    srLatch.clock <= clock
    srLatch.reset <= reset
    node _srLatch_io_reset_T = not(io.data) @[DLatch.scala 14:35]
    node _srLatch_io_reset_T_1 = and(io.enable, _srLatch_io_reset_T) @[DLatch.scala 14:33]
    srLatch.io.reset <= _srLatch_io_reset_T_1 @[DLatch.scala 14:20]
    node _srLatch_io_set_T = and(io.enable, io.data) @[DLatch.scala 15:31]
    srLatch.io.set <= _srLatch_io_set_T @[DLatch.scala 15:18]
    io.q <= srLatch.io.q @[DLatch.scala 17:8]

  module DFlipFlop :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip clock : UInt<1>, flip data : UInt<1>, q : UInt<1>}

    inst dLatch1 of DLatch @[DFlipFlop.scala 13:21]
    dLatch1.clock <= clock
    dLatch1.reset <= reset
    node _dLatch1_io_enable_T = not(io.clock) @[DFlipFlop.scala 14:24]
    dLatch1.io.enable <= _dLatch1_io_enable_T @[DFlipFlop.scala 14:21]
    dLatch1.io.data <= io.data @[DFlipFlop.scala 15:19]
    inst dLatch2 of DLatch_1 @[DFlipFlop.scala 17:21]
    dLatch2.clock <= clock
    dLatch2.reset <= reset
    dLatch2.io.enable <= io.clock @[DFlipFlop.scala 18:21]
    dLatch2.io.data <= dLatch1.io.q @[DFlipFlop.scala 19:19]
    io.q <= dLatch2.io.q @[DFlipFlop.scala 21:8]

