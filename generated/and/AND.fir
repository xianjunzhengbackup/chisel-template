circuit AND :
  module AND :
    output io : { flip a : UInt<1>, flip b : UInt<1>, c : UInt<1>}

    node _io_c_T = and(io.a, io.b) @[AND.scala 12:16]
    io.c <= _io_c_T @[AND.scala 12:8]

