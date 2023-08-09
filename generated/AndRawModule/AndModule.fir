circuit AndModule :
  module AndModule :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<1>, flip b : UInt<1>, c : UInt<1>}

    node _io_c_T = and(io.a, io.b) @[ModuleExample.scala 30:16]
    io.c <= _io_c_T @[ModuleExample.scala 30:8]

