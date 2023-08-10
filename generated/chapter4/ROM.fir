circuit ROM :
  module ROM :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip sel : UInt<2>, out : UInt<8>}

    wire rom : UInt<3>[4] @[chapter4_常用的硬件原语.scala 37:24]
    rom[0] <= UInt<1>("h1") @[chapter4_常用的硬件原语.scala 37:24]
    rom[1] <= UInt<2>("h2") @[chapter4_常用的硬件原语.scala 37:24]
    rom[2] <= UInt<2>("h3") @[chapter4_常用的硬件原语.scala 37:24]
    rom[3] <= UInt<3>("h4") @[chapter4_常用的硬件原语.scala 37:24]
    io.out <= rom[io.sel] @[chapter4_常用的硬件原语.scala 39:14]

