FIRRTL version 1.1.0
circuit Adder :
  module Adder :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<8>
    input io_b : UInt<8>
    output io_s : UInt<8>
    output io_cout : UInt<1>

    node _io_s_T = add(io_a, io_b) @[chapter5_生成Verilog与基本测试.scala 172:21]
    node _io_s_T_1 = bits(_io_s_T, 7, 0) @[chapter5_生成Verilog与基本测试.scala 172:29]
    node _io_cout_T = add(io_a, io_b) @[chapter5_生成Verilog与基本测试.scala 173:24]
    node _io_cout_T_1 = bits(_io_cout_T, 8, 8) @[chapter5_生成Verilog与基本测试.scala 173:32]
    io_s <= _io_s_T_1 @[chapter5_生成Verilog与基本测试.scala 172:12]
    io_cout <= _io_cout_T_1 @[chapter5_生成Verilog与基本测试.scala 173:15]
