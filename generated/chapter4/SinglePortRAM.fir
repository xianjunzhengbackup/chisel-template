circuit SinglePortRAM :
  module SinglePortRAM :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip addr : UInt<10>, flip dataIn : UInt<32>, flip en : UInt<1>, flip we : UInt<1>, dataOut : UInt<32>}

    smem syncRAM : UInt<32> [1024] @[chapter4_常用的硬件原语.scala 104:32]
    when io.en : @[chapter4_常用的硬件原语.scala 106:19]
      when io.we : @[chapter4_常用的硬件原语.scala 107:21]
        write mport MPORT = syncRAM[io.addr], clock
        MPORT <= io.dataIn
        io.dataOut is invalid @[chapter4_常用的硬件原语.scala 109:22]
      else :
        wire _io_dataOut_WIRE : UInt @[chapter4_常用的硬件原语.scala 111:37]
        _io_dataOut_WIRE is invalid @[chapter4_常用的硬件原语.scala 111:37]
        when UInt<1>("h1") : @[chapter4_常用的硬件原语.scala 111:37]
          _io_dataOut_WIRE <= io.addr @[chapter4_常用的硬件原语.scala 111:37]
          node _io_dataOut_T = or(_io_dataOut_WIRE, UInt<10>("h0")) @[chapter4_常用的硬件原语.scala 111:37]
          node _io_dataOut_T_1 = bits(_io_dataOut_T, 9, 0) @[chapter4_常用的硬件原语.scala 111:37]
          read mport io_dataOut_MPORT = syncRAM[_io_dataOut_T_1], clock @[chapter4_常用的硬件原语.scala 111:37]
        io.dataOut <= io_dataOut_MPORT @[chapter4_常用的硬件原语.scala 111:22]
    else :
      io.dataOut is invalid @[chapter4_常用的硬件原语.scala 114:20]

