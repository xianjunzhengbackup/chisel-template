module Adder(
  input        clock,
  input        reset,
  input  [7:0] io_a,
  input  [7:0] io_b,
  output [7:0] io_s,
  output       io_cout
);
  wire [8:0] _io_s_T = io_a + io_b; // @[chapter5_\uFFE7\uFF94\uFF9F\uFFE6\uFF88\uFF90Verilog\uFFE4\uFFB8\uFF8E\uFFE5\uFF9F\uFFBA\uFFE6\uFF9C\uFFAC\uFFE6\uFFB5\uFF8B\uFFE8\uFFAF\uFF95.scala 172:21]
  assign io_s = _io_s_T[7:0]; // @[chapter5_\uFFE7\uFF94\uFF9F\uFFE6\uFF88\uFF90Verilog\uFFE4\uFFB8\uFF8E\uFFE5\uFF9F\uFFBA\uFFE6\uFF9C\uFFAC\uFFE6\uFFB5\uFF8B\uFFE8\uFFAF\uFF95.scala 172:29]
  assign io_cout = _io_s_T[8]; // @[chapter5_\uFFE7\uFF94\uFF9F\uFFE6\uFF88\uFF90Verilog\uFFE4\uFFB8\uFF8E\uFFE5\uFF9F\uFFBA\uFFE6\uFF9C\uFFAC\uFFE6\uFFB5\uFF8B\uFFE8\uFFAF\uFF95.scala 173:32]
endmodule
