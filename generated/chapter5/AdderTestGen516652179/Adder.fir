circuit Adder :
  module Adder :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<8>, flip b : UInt<8>, s : UInt<8>, cout : UInt<1>}

    node _io_s_T = add(io.a, io.b) @[chapter5_生成Verilog与基本测试.scala 172:21]
    node _io_s_T_1 = bits(_io_s_T, 7, 0) @[chapter5_生成Verilog与基本测试.scala 172:29]
    io.s <= _io_s_T_1 @[chapter5_生成Verilog与基本测试.scala 172:12]
    node _io_cout_T = add(io.a, io.b) @[chapter5_生成Verilog与基本测试.scala 173:24]
    node _io_cout_T_1 = bits(_io_cout_T, 8, 8) @[chapter5_生成Verilog与基本测试.scala 173:32]
    io.cout <= _io_cout_T_1 @[chapter5_生成Verilog与基本测试.scala 173:15]

