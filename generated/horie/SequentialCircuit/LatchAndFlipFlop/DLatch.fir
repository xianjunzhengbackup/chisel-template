circuit DLatch :
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
    input reset : UInt<1>
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

