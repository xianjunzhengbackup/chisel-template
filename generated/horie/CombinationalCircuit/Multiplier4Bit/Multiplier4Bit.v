module LeftShifter(
  input  [3:0] io_in,
  input  [1:0] io_shiftAmount,
  output [6:0] io_out
);
  wire [6:0] _GEN_0 = {{3'd0}, io_in}; // @[LeftShifter.scala 13:19]
  assign io_out = _GEN_0 << io_shiftAmount; // @[LeftShifter.scala 13:19]
endmodule
module HalfAdder(
  input   io_a,
  input   io_b,
  output  io_sum,
  output  io_carryOut
);
  assign io_sum = io_a ^ io_b; // @[HalfAdder.scala 11:18]
  assign io_carryOut = io_a & io_b; // @[HalfAdder.scala 12:23]
endmodule
module FullAdder(
  input   io_a,
  input   io_b,
  input   io_carryIn,
  output  io_sum,
  output  io_carryOut
);
  wire  h1_io_a; // @[FullAdder.scala 15:17]
  wire  h1_io_b; // @[FullAdder.scala 15:17]
  wire  h1_io_sum; // @[FullAdder.scala 15:17]
  wire  h1_io_carryOut; // @[FullAdder.scala 15:17]
  wire  h2_io_a; // @[FullAdder.scala 16:18]
  wire  h2_io_b; // @[FullAdder.scala 16:18]
  wire  h2_io_sum; // @[FullAdder.scala 16:18]
  wire  h2_io_carryOut; // @[FullAdder.scala 16:18]
  HalfAdder h1 ( // @[FullAdder.scala 15:17]
    .io_a(h1_io_a),
    .io_b(h1_io_b),
    .io_sum(h1_io_sum),
    .io_carryOut(h1_io_carryOut)
  );
  HalfAdder h2 ( // @[FullAdder.scala 16:18]
    .io_a(h2_io_a),
    .io_b(h2_io_b),
    .io_sum(h2_io_sum),
    .io_carryOut(h2_io_carryOut)
  );
  assign io_sum = h2_io_sum; // @[FullAdder.scala 25:10]
  assign io_carryOut = h1_io_carryOut | h2_io_carryOut; // @[FullAdder.scala 26:33]
  assign h1_io_a = io_a; // @[FullAdder.scala 21:11]
  assign h1_io_b = io_b; // @[FullAdder.scala 22:11]
  assign h2_io_a = h1_io_sum; // @[FullAdder.scala 23:11]
  assign h2_io_b = io_carryIn; // @[FullAdder.scala 24:11]
endmodule
module AdderNBit(
  input  [7:0] io_a,
  input  [7:0] io_b,
  output [7:0] io_sum
);
  wire  FullAdder_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_1_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_1_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_1_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_1_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_1_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_2_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_2_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_2_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_2_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_2_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_3_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_3_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_3_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_3_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_3_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_4_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_4_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_4_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_4_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_4_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_5_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_5_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_5_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_5_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_5_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_6_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_6_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_6_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_6_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_6_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_7_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_7_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_7_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_7_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_7_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  f_1_sum = FullAdder_1_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_0_sum = FullAdder_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_3_sum = FullAdder_3_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_2_sum = FullAdder_2_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire [3:0] io_sum_lo = {f_3_sum,f_2_sum,f_1_sum,f_0_sum}; // @[AdderNBit.scala 31:17]
  wire  f_5_sum = FullAdder_5_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_4_sum = FullAdder_4_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_7_sum = FullAdder_7_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_6_sum = FullAdder_6_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire [3:0] io_sum_hi = {f_7_sum,f_6_sum,f_5_sum,f_4_sum}; // @[AdderNBit.scala 31:17]
  FullAdder FullAdder ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_io_a),
    .io_b(FullAdder_io_b),
    .io_carryIn(FullAdder_io_carryIn),
    .io_sum(FullAdder_io_sum),
    .io_carryOut(FullAdder_io_carryOut)
  );
  FullAdder FullAdder_1 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_1_io_a),
    .io_b(FullAdder_1_io_b),
    .io_carryIn(FullAdder_1_io_carryIn),
    .io_sum(FullAdder_1_io_sum),
    .io_carryOut(FullAdder_1_io_carryOut)
  );
  FullAdder FullAdder_2 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_2_io_a),
    .io_b(FullAdder_2_io_b),
    .io_carryIn(FullAdder_2_io_carryIn),
    .io_sum(FullAdder_2_io_sum),
    .io_carryOut(FullAdder_2_io_carryOut)
  );
  FullAdder FullAdder_3 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_3_io_a),
    .io_b(FullAdder_3_io_b),
    .io_carryIn(FullAdder_3_io_carryIn),
    .io_sum(FullAdder_3_io_sum),
    .io_carryOut(FullAdder_3_io_carryOut)
  );
  FullAdder FullAdder_4 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_4_io_a),
    .io_b(FullAdder_4_io_b),
    .io_carryIn(FullAdder_4_io_carryIn),
    .io_sum(FullAdder_4_io_sum),
    .io_carryOut(FullAdder_4_io_carryOut)
  );
  FullAdder FullAdder_5 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_5_io_a),
    .io_b(FullAdder_5_io_b),
    .io_carryIn(FullAdder_5_io_carryIn),
    .io_sum(FullAdder_5_io_sum),
    .io_carryOut(FullAdder_5_io_carryOut)
  );
  FullAdder FullAdder_6 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_6_io_a),
    .io_b(FullAdder_6_io_b),
    .io_carryIn(FullAdder_6_io_carryIn),
    .io_sum(FullAdder_6_io_sum),
    .io_carryOut(FullAdder_6_io_carryOut)
  );
  FullAdder FullAdder_7 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_7_io_a),
    .io_b(FullAdder_7_io_b),
    .io_carryIn(FullAdder_7_io_carryIn),
    .io_sum(FullAdder_7_io_sum),
    .io_carryOut(FullAdder_7_io_carryOut)
  );
  assign io_sum = {io_sum_hi,io_sum_lo}; // @[AdderNBit.scala 31:17]
  assign FullAdder_io_a = io_a[0]; // @[AdderNBit.scala 24:18]
  assign FullAdder_io_b = io_b[0]; // @[AdderNBit.scala 25:19]
  assign FullAdder_io_carryIn = 1'h0; // @[AdderNBit.scala 19:20 22:13]
  assign FullAdder_1_io_a = io_a[1]; // @[AdderNBit.scala 24:18]
  assign FullAdder_1_io_b = io_b[1]; // @[AdderNBit.scala 25:19]
  assign FullAdder_1_io_carryIn = FullAdder_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_2_io_a = io_a[2]; // @[AdderNBit.scala 24:18]
  assign FullAdder_2_io_b = io_b[2]; // @[AdderNBit.scala 25:19]
  assign FullAdder_2_io_carryIn = FullAdder_1_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_3_io_a = io_a[3]; // @[AdderNBit.scala 24:18]
  assign FullAdder_3_io_b = io_b[3]; // @[AdderNBit.scala 25:19]
  assign FullAdder_3_io_carryIn = FullAdder_2_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_4_io_a = io_a[4]; // @[AdderNBit.scala 24:18]
  assign FullAdder_4_io_b = io_b[4]; // @[AdderNBit.scala 25:19]
  assign FullAdder_4_io_carryIn = FullAdder_3_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_5_io_a = io_a[5]; // @[AdderNBit.scala 24:18]
  assign FullAdder_5_io_b = io_b[5]; // @[AdderNBit.scala 25:19]
  assign FullAdder_5_io_carryIn = FullAdder_4_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_6_io_a = io_a[6]; // @[AdderNBit.scala 24:18]
  assign FullAdder_6_io_b = io_b[6]; // @[AdderNBit.scala 25:19]
  assign FullAdder_6_io_carryIn = FullAdder_5_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_7_io_a = io_a[7]; // @[AdderNBit.scala 24:18]
  assign FullAdder_7_io_b = io_b[7]; // @[AdderNBit.scala 25:19]
  assign FullAdder_7_io_carryIn = FullAdder_6_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
endmodule
module Multiplier4Bit(
  input        clock,
  input        reset,
  input  [3:0] io_a,
  input  [3:0] io_b,
  output [7:0] io_result
);
  wire [3:0] LeftShifter_io_in; // @[Multiplier4Bit.scala 13:33]
  wire [1:0] LeftShifter_io_shiftAmount; // @[Multiplier4Bit.scala 13:33]
  wire [6:0] LeftShifter_io_out; // @[Multiplier4Bit.scala 13:33]
  wire [3:0] LeftShifter_1_io_in; // @[Multiplier4Bit.scala 13:33]
  wire [1:0] LeftShifter_1_io_shiftAmount; // @[Multiplier4Bit.scala 13:33]
  wire [6:0] LeftShifter_1_io_out; // @[Multiplier4Bit.scala 13:33]
  wire [3:0] LeftShifter_2_io_in; // @[Multiplier4Bit.scala 13:33]
  wire [1:0] LeftShifter_2_io_shiftAmount; // @[Multiplier4Bit.scala 13:33]
  wire [6:0] LeftShifter_2_io_out; // @[Multiplier4Bit.scala 13:33]
  wire [3:0] LeftShifter_3_io_in; // @[Multiplier4Bit.scala 13:33]
  wire [1:0] LeftShifter_3_io_shiftAmount; // @[Multiplier4Bit.scala 13:33]
  wire [6:0] LeftShifter_3_io_out; // @[Multiplier4Bit.scala 13:33]
  wire [7:0] AdderNBit_io_a; // @[Multiplier4Bit.scala 19:38]
  wire [7:0] AdderNBit_io_b; // @[Multiplier4Bit.scala 19:38]
  wire [7:0] AdderNBit_io_sum; // @[Multiplier4Bit.scala 19:38]
  wire [7:0] AdderNBit_1_io_a; // @[Multiplier4Bit.scala 19:38]
  wire [7:0] AdderNBit_1_io_b; // @[Multiplier4Bit.scala 19:38]
  wire [7:0] AdderNBit_1_io_sum; // @[Multiplier4Bit.scala 19:38]
  wire [7:0] AdderNBit_2_io_a; // @[Multiplier4Bit.scala 19:38]
  wire [7:0] AdderNBit_2_io_b; // @[Multiplier4Bit.scala 19:38]
  wire [7:0] AdderNBit_2_io_sum; // @[Multiplier4Bit.scala 19:38]
  wire [6:0] s_0_out = LeftShifter_io_out; // @[Multiplier4Bit.scala 13:{26,26}]
  wire [6:0] s_1_out = LeftShifter_1_io_out; // @[Multiplier4Bit.scala 13:{26,26}]
  wire [6:0] s_2_out = LeftShifter_2_io_out; // @[Multiplier4Bit.scala 13:{26,26}]
  wire [6:0] s_3_out = LeftShifter_3_io_out; // @[Multiplier4Bit.scala 13:{26,26}]
  LeftShifter LeftShifter ( // @[Multiplier4Bit.scala 13:33]
    .io_in(LeftShifter_io_in),
    .io_shiftAmount(LeftShifter_io_shiftAmount),
    .io_out(LeftShifter_io_out)
  );
  LeftShifter LeftShifter_1 ( // @[Multiplier4Bit.scala 13:33]
    .io_in(LeftShifter_1_io_in),
    .io_shiftAmount(LeftShifter_1_io_shiftAmount),
    .io_out(LeftShifter_1_io_out)
  );
  LeftShifter LeftShifter_2 ( // @[Multiplier4Bit.scala 13:33]
    .io_in(LeftShifter_2_io_in),
    .io_shiftAmount(LeftShifter_2_io_shiftAmount),
    .io_out(LeftShifter_2_io_out)
  );
  LeftShifter LeftShifter_3 ( // @[Multiplier4Bit.scala 13:33]
    .io_in(LeftShifter_3_io_in),
    .io_shiftAmount(LeftShifter_3_io_shiftAmount),
    .io_out(LeftShifter_3_io_out)
  );
  AdderNBit AdderNBit ( // @[Multiplier4Bit.scala 19:38]
    .io_a(AdderNBit_io_a),
    .io_b(AdderNBit_io_b),
    .io_sum(AdderNBit_io_sum)
  );
  AdderNBit AdderNBit_1 ( // @[Multiplier4Bit.scala 19:38]
    .io_a(AdderNBit_1_io_a),
    .io_b(AdderNBit_1_io_b),
    .io_sum(AdderNBit_1_io_sum)
  );
  AdderNBit AdderNBit_2 ( // @[Multiplier4Bit.scala 19:38]
    .io_a(AdderNBit_2_io_a),
    .io_b(AdderNBit_2_io_b),
    .io_sum(AdderNBit_2_io_sum)
  );
  assign io_result = AdderNBit_2_io_sum; // @[Multiplier4Bit.scala 19:{31,31}]
  assign LeftShifter_io_in = io_b[0] ? io_a : 4'h0; // @[Multiplier4Bit.scala 16:19]
  assign LeftShifter_io_shiftAmount = 2'h0; // @[Multiplier4Bit.scala 17:28]
  assign LeftShifter_1_io_in = io_b[1] ? io_a : 4'h0; // @[Multiplier4Bit.scala 16:19]
  assign LeftShifter_1_io_shiftAmount = io_b[1] ? 2'h1 : 2'h0; // @[Multiplier4Bit.scala 17:28]
  assign LeftShifter_2_io_in = io_b[2] ? io_a : 4'h0; // @[Multiplier4Bit.scala 16:19]
  assign LeftShifter_2_io_shiftAmount = io_b[2] ? 2'h2 : 2'h0; // @[Multiplier4Bit.scala 17:28]
  assign LeftShifter_3_io_in = io_b[3] ? io_a : 4'h0; // @[Multiplier4Bit.scala 16:19]
  assign LeftShifter_3_io_shiftAmount = io_b[3] ? 2'h3 : 2'h0; // @[Multiplier4Bit.scala 17:28]
  assign AdderNBit_io_a = {1'h0,s_0_out}; // @[Cat.scala 33:92]
  assign AdderNBit_io_b = {1'h0,s_1_out}; // @[Cat.scala 33:92]
  assign AdderNBit_1_io_a = {1'h0,s_2_out}; // @[Cat.scala 33:92]
  assign AdderNBit_1_io_b = {1'h0,s_3_out}; // @[Cat.scala 33:92]
  assign AdderNBit_2_io_a = AdderNBit_io_sum; // @[Multiplier4Bit.scala 19:{31,31}]
  assign AdderNBit_2_io_b = AdderNBit_1_io_sum; // @[Multiplier4Bit.scala 19:{31,31}]
endmodule
