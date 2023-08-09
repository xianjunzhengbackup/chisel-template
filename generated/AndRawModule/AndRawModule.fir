circuit AndRawModule :
  module AndRawModule :
    output ioBundle : { flip a : UInt<1>, flip b : UInt<1>}
    output c : UInt<1>

    node _c_T = and(ioBundle.a, ioBundle.b) @[ModuleExample.scala 11:19]
    c <= _c_T @[ModuleExample.scala 11:5]

