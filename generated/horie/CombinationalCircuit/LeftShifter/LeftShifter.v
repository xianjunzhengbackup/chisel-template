module LeftShifter(
  input        clock,
  input        reset,
  input  [3:0] io_in,
  input  [1:0] io_shiftAmount,
  output [5:0] io_out
);
  wire [6:0] _GEN_0 = {{3'd0}, io_in}; // @[LeftShifter.scala 13:19]
  wire [6:0] _io_out_T = _GEN_0 << io_shiftAmount; // @[LeftShifter.scala 13:19]
  assign io_out = _io_out_T[5:0]; // @[LeftShifter.scala 13:10]
endmodule
