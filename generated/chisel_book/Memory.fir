circuit Memory :
  module Memory :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip rdAddr : UInt<11>, rdData : UInt<8>, flip wrAddr : UInt<11>, flip wrData : UInt<8>, flip wrEnable : UInt<1>}

    smem mem : UInt<8> [2048] @[Memory.scala 15:24]
    wire _io_rdData_WIRE : UInt @[Memory.scala 16:24]
    _io_rdData_WIRE is invalid @[Memory.scala 16:24]
    when UInt<1>("h1") : @[Memory.scala 16:24]
      _io_rdData_WIRE <= io.rdAddr @[Memory.scala 16:24]
      node _io_rdData_T = or(_io_rdData_WIRE, UInt<11>("h0")) @[Memory.scala 16:24]
      node _io_rdData_T_1 = bits(_io_rdData_T, 10, 0) @[Memory.scala 16:24]
      read mport io_rdData_MPORT = mem[_io_rdData_T_1], clock @[Memory.scala 16:24]
    io.rdData <= io_rdData_MPORT @[Memory.scala 16:13]
    when io.wrEnable : @[Memory.scala 18:20]
      write mport MPORT = mem[io.wrAddr], clock
      MPORT <= io.wrData


