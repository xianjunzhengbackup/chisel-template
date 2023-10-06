circuit BlackBoxWrapper :
  extmodule InlineBlackBoxAdder :
    input a : UInt<32>
    input b : UInt<32>
    input cin : UInt<1>
    output c : UInt<32>
    output cout : UInt<1>
    defname = InlineBlackBoxAdder

  module BlackBoxWrapper :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<32>, flip b : UInt<32>, flip cin : UInt<1>, c : UInt<32>, cout : UInt<1>}

    inst bb of InlineBlackBoxAdder @[BlackBox.scala 54:18]
    io.cout <= bb.cout @[BlackBox.scala 55:6]
    io.c <= bb.c @[BlackBox.scala 55:6]
    bb.cin <= io.cin @[BlackBox.scala 55:6]
    bb.b <= io.b @[BlackBox.scala 55:6]
    bb.a <= io.a @[BlackBox.scala 55:6]

