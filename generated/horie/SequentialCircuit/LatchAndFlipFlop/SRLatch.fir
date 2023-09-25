circuit SRLatch :
  module SRLatch :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip set : UInt<1>, flip reset : UInt<1>, q : UInt<1>, notQ : UInt<1>}

    node _io_q_T = or(io.reset, io.notQ) @[SRLatch.scala 13:22]
    node _io_q_T_1 = not(_io_q_T) @[SRLatch.scala 13:11]
    io.q <= _io_q_T_1 @[SRLatch.scala 13:8]
    node _io_notQ_T = or(io.set, io.q) @[SRLatch.scala 14:23]
    node _io_notQ_T_1 = not(_io_notQ_T) @[SRLatch.scala 14:14]
    io.notQ <= _io_notQ_T_1 @[SRLatch.scala 14:11]

