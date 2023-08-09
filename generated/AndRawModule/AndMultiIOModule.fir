circuit AndMultiIOModule :
  module AndMultiIOModule :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<1>, c : UInt<1>}
    input iob : UInt<1>

    node _io_c_T = and(io.a, iob) @[ModuleExample.scala 21:16]
    io.c <= _io_c_T @[ModuleExample.scala 21:8]

