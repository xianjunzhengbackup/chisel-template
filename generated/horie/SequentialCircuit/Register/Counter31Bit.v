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
  input  [30:0] io_a,
  output [30:0] io_sum
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
  wire  FullAdder_8_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_8_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_8_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_8_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_8_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_9_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_9_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_9_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_9_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_9_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_10_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_10_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_10_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_10_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_10_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_11_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_11_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_11_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_11_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_11_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_12_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_12_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_12_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_12_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_12_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_13_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_13_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_13_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_13_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_13_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_14_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_14_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_14_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_14_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_14_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_15_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_15_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_15_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_15_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_15_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_16_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_16_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_16_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_16_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_16_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_17_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_17_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_17_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_17_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_17_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_18_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_18_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_18_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_18_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_18_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_19_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_19_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_19_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_19_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_19_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_20_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_20_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_20_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_20_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_20_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_21_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_21_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_21_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_21_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_21_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_22_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_22_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_22_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_22_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_22_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_23_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_23_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_23_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_23_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_23_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_24_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_24_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_24_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_24_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_24_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_25_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_25_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_25_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_25_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_25_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_26_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_26_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_26_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_26_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_26_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_27_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_27_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_27_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_27_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_27_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_28_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_28_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_28_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_28_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_28_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_29_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_29_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_29_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_29_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_29_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  FullAdder_30_io_a; // @[AdderNBit.scala 17:33]
  wire  FullAdder_30_io_b; // @[AdderNBit.scala 17:33]
  wire  FullAdder_30_io_carryIn; // @[AdderNBit.scala 17:33]
  wire  FullAdder_30_io_sum; // @[AdderNBit.scala 17:33]
  wire  FullAdder_30_io_carryOut; // @[AdderNBit.scala 17:33]
  wire  f_2_sum = FullAdder_2_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_1_sum = FullAdder_1_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_0_sum = FullAdder_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_4_sum = FullAdder_4_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_3_sum = FullAdder_3_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_6_sum = FullAdder_6_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_5_sum = FullAdder_5_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire [6:0] io_sum_lo_lo = {f_6_sum,f_5_sum,f_4_sum,f_3_sum,f_2_sum,f_1_sum,f_0_sum}; // @[AdderNBit.scala 31:17]
  wire  f_8_sum = FullAdder_8_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_7_sum = FullAdder_7_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_10_sum = FullAdder_10_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_9_sum = FullAdder_9_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_12_sum = FullAdder_12_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_11_sum = FullAdder_11_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_14_sum = FullAdder_14_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_13_sum = FullAdder_13_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire [14:0] io_sum_lo = {f_14_sum,f_13_sum,f_12_sum,f_11_sum,f_10_sum,f_9_sum,f_8_sum,f_7_sum,io_sum_lo_lo}; // @[AdderNBit.scala 31:17]
  wire  f_16_sum = FullAdder_16_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_15_sum = FullAdder_15_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_18_sum = FullAdder_18_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_17_sum = FullAdder_17_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_20_sum = FullAdder_20_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_19_sum = FullAdder_19_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_22_sum = FullAdder_22_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_21_sum = FullAdder_21_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire [7:0] io_sum_hi_lo = {f_22_sum,f_21_sum,f_20_sum,f_19_sum,f_18_sum,f_17_sum,f_16_sum,f_15_sum}; // @[AdderNBit.scala 31:17]
  wire  f_24_sum = FullAdder_24_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_23_sum = FullAdder_23_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_26_sum = FullAdder_26_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_25_sum = FullAdder_25_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_28_sum = FullAdder_28_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_27_sum = FullAdder_27_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_30_sum = FullAdder_30_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire  f_29_sum = FullAdder_29_io_sum; // @[AdderNBit.scala 17:{26,26}]
  wire [15:0] io_sum_hi = {f_30_sum,f_29_sum,f_28_sum,f_27_sum,f_26_sum,f_25_sum,f_24_sum,f_23_sum,io_sum_hi_lo}; // @[AdderNBit.scala 31:17]
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
  FullAdder FullAdder_8 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_8_io_a),
    .io_b(FullAdder_8_io_b),
    .io_carryIn(FullAdder_8_io_carryIn),
    .io_sum(FullAdder_8_io_sum),
    .io_carryOut(FullAdder_8_io_carryOut)
  );
  FullAdder FullAdder_9 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_9_io_a),
    .io_b(FullAdder_9_io_b),
    .io_carryIn(FullAdder_9_io_carryIn),
    .io_sum(FullAdder_9_io_sum),
    .io_carryOut(FullAdder_9_io_carryOut)
  );
  FullAdder FullAdder_10 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_10_io_a),
    .io_b(FullAdder_10_io_b),
    .io_carryIn(FullAdder_10_io_carryIn),
    .io_sum(FullAdder_10_io_sum),
    .io_carryOut(FullAdder_10_io_carryOut)
  );
  FullAdder FullAdder_11 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_11_io_a),
    .io_b(FullAdder_11_io_b),
    .io_carryIn(FullAdder_11_io_carryIn),
    .io_sum(FullAdder_11_io_sum),
    .io_carryOut(FullAdder_11_io_carryOut)
  );
  FullAdder FullAdder_12 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_12_io_a),
    .io_b(FullAdder_12_io_b),
    .io_carryIn(FullAdder_12_io_carryIn),
    .io_sum(FullAdder_12_io_sum),
    .io_carryOut(FullAdder_12_io_carryOut)
  );
  FullAdder FullAdder_13 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_13_io_a),
    .io_b(FullAdder_13_io_b),
    .io_carryIn(FullAdder_13_io_carryIn),
    .io_sum(FullAdder_13_io_sum),
    .io_carryOut(FullAdder_13_io_carryOut)
  );
  FullAdder FullAdder_14 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_14_io_a),
    .io_b(FullAdder_14_io_b),
    .io_carryIn(FullAdder_14_io_carryIn),
    .io_sum(FullAdder_14_io_sum),
    .io_carryOut(FullAdder_14_io_carryOut)
  );
  FullAdder FullAdder_15 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_15_io_a),
    .io_b(FullAdder_15_io_b),
    .io_carryIn(FullAdder_15_io_carryIn),
    .io_sum(FullAdder_15_io_sum),
    .io_carryOut(FullAdder_15_io_carryOut)
  );
  FullAdder FullAdder_16 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_16_io_a),
    .io_b(FullAdder_16_io_b),
    .io_carryIn(FullAdder_16_io_carryIn),
    .io_sum(FullAdder_16_io_sum),
    .io_carryOut(FullAdder_16_io_carryOut)
  );
  FullAdder FullAdder_17 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_17_io_a),
    .io_b(FullAdder_17_io_b),
    .io_carryIn(FullAdder_17_io_carryIn),
    .io_sum(FullAdder_17_io_sum),
    .io_carryOut(FullAdder_17_io_carryOut)
  );
  FullAdder FullAdder_18 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_18_io_a),
    .io_b(FullAdder_18_io_b),
    .io_carryIn(FullAdder_18_io_carryIn),
    .io_sum(FullAdder_18_io_sum),
    .io_carryOut(FullAdder_18_io_carryOut)
  );
  FullAdder FullAdder_19 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_19_io_a),
    .io_b(FullAdder_19_io_b),
    .io_carryIn(FullAdder_19_io_carryIn),
    .io_sum(FullAdder_19_io_sum),
    .io_carryOut(FullAdder_19_io_carryOut)
  );
  FullAdder FullAdder_20 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_20_io_a),
    .io_b(FullAdder_20_io_b),
    .io_carryIn(FullAdder_20_io_carryIn),
    .io_sum(FullAdder_20_io_sum),
    .io_carryOut(FullAdder_20_io_carryOut)
  );
  FullAdder FullAdder_21 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_21_io_a),
    .io_b(FullAdder_21_io_b),
    .io_carryIn(FullAdder_21_io_carryIn),
    .io_sum(FullAdder_21_io_sum),
    .io_carryOut(FullAdder_21_io_carryOut)
  );
  FullAdder FullAdder_22 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_22_io_a),
    .io_b(FullAdder_22_io_b),
    .io_carryIn(FullAdder_22_io_carryIn),
    .io_sum(FullAdder_22_io_sum),
    .io_carryOut(FullAdder_22_io_carryOut)
  );
  FullAdder FullAdder_23 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_23_io_a),
    .io_b(FullAdder_23_io_b),
    .io_carryIn(FullAdder_23_io_carryIn),
    .io_sum(FullAdder_23_io_sum),
    .io_carryOut(FullAdder_23_io_carryOut)
  );
  FullAdder FullAdder_24 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_24_io_a),
    .io_b(FullAdder_24_io_b),
    .io_carryIn(FullAdder_24_io_carryIn),
    .io_sum(FullAdder_24_io_sum),
    .io_carryOut(FullAdder_24_io_carryOut)
  );
  FullAdder FullAdder_25 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_25_io_a),
    .io_b(FullAdder_25_io_b),
    .io_carryIn(FullAdder_25_io_carryIn),
    .io_sum(FullAdder_25_io_sum),
    .io_carryOut(FullAdder_25_io_carryOut)
  );
  FullAdder FullAdder_26 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_26_io_a),
    .io_b(FullAdder_26_io_b),
    .io_carryIn(FullAdder_26_io_carryIn),
    .io_sum(FullAdder_26_io_sum),
    .io_carryOut(FullAdder_26_io_carryOut)
  );
  FullAdder FullAdder_27 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_27_io_a),
    .io_b(FullAdder_27_io_b),
    .io_carryIn(FullAdder_27_io_carryIn),
    .io_sum(FullAdder_27_io_sum),
    .io_carryOut(FullAdder_27_io_carryOut)
  );
  FullAdder FullAdder_28 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_28_io_a),
    .io_b(FullAdder_28_io_b),
    .io_carryIn(FullAdder_28_io_carryIn),
    .io_sum(FullAdder_28_io_sum),
    .io_carryOut(FullAdder_28_io_carryOut)
  );
  FullAdder FullAdder_29 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_29_io_a),
    .io_b(FullAdder_29_io_b),
    .io_carryIn(FullAdder_29_io_carryIn),
    .io_sum(FullAdder_29_io_sum),
    .io_carryOut(FullAdder_29_io_carryOut)
  );
  FullAdder FullAdder_30 ( // @[AdderNBit.scala 17:33]
    .io_a(FullAdder_30_io_a),
    .io_b(FullAdder_30_io_b),
    .io_carryIn(FullAdder_30_io_carryIn),
    .io_sum(FullAdder_30_io_sum),
    .io_carryOut(FullAdder_30_io_carryOut)
  );
  assign io_sum = {io_sum_hi,io_sum_lo}; // @[AdderNBit.scala 31:17]
  assign FullAdder_io_a = io_a[0]; // @[AdderNBit.scala 24:18]
  assign FullAdder_io_b = 1'h1; // @[AdderNBit.scala 25:19]
  assign FullAdder_io_carryIn = 1'h0; // @[AdderNBit.scala 19:20 22:13]
  assign FullAdder_1_io_a = io_a[1]; // @[AdderNBit.scala 24:18]
  assign FullAdder_1_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_1_io_carryIn = FullAdder_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_2_io_a = io_a[2]; // @[AdderNBit.scala 24:18]
  assign FullAdder_2_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_2_io_carryIn = FullAdder_1_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_3_io_a = io_a[3]; // @[AdderNBit.scala 24:18]
  assign FullAdder_3_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_3_io_carryIn = FullAdder_2_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_4_io_a = io_a[4]; // @[AdderNBit.scala 24:18]
  assign FullAdder_4_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_4_io_carryIn = FullAdder_3_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_5_io_a = io_a[5]; // @[AdderNBit.scala 24:18]
  assign FullAdder_5_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_5_io_carryIn = FullAdder_4_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_6_io_a = io_a[6]; // @[AdderNBit.scala 24:18]
  assign FullAdder_6_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_6_io_carryIn = FullAdder_5_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_7_io_a = io_a[7]; // @[AdderNBit.scala 24:18]
  assign FullAdder_7_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_7_io_carryIn = FullAdder_6_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_8_io_a = io_a[8]; // @[AdderNBit.scala 24:18]
  assign FullAdder_8_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_8_io_carryIn = FullAdder_7_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_9_io_a = io_a[9]; // @[AdderNBit.scala 24:18]
  assign FullAdder_9_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_9_io_carryIn = FullAdder_8_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_10_io_a = io_a[10]; // @[AdderNBit.scala 24:18]
  assign FullAdder_10_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_10_io_carryIn = FullAdder_9_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_11_io_a = io_a[11]; // @[AdderNBit.scala 24:18]
  assign FullAdder_11_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_11_io_carryIn = FullAdder_10_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_12_io_a = io_a[12]; // @[AdderNBit.scala 24:18]
  assign FullAdder_12_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_12_io_carryIn = FullAdder_11_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_13_io_a = io_a[13]; // @[AdderNBit.scala 24:18]
  assign FullAdder_13_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_13_io_carryIn = FullAdder_12_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_14_io_a = io_a[14]; // @[AdderNBit.scala 24:18]
  assign FullAdder_14_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_14_io_carryIn = FullAdder_13_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_15_io_a = io_a[15]; // @[AdderNBit.scala 24:18]
  assign FullAdder_15_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_15_io_carryIn = FullAdder_14_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_16_io_a = io_a[16]; // @[AdderNBit.scala 24:18]
  assign FullAdder_16_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_16_io_carryIn = FullAdder_15_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_17_io_a = io_a[17]; // @[AdderNBit.scala 24:18]
  assign FullAdder_17_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_17_io_carryIn = FullAdder_16_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_18_io_a = io_a[18]; // @[AdderNBit.scala 24:18]
  assign FullAdder_18_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_18_io_carryIn = FullAdder_17_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_19_io_a = io_a[19]; // @[AdderNBit.scala 24:18]
  assign FullAdder_19_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_19_io_carryIn = FullAdder_18_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_20_io_a = io_a[20]; // @[AdderNBit.scala 24:18]
  assign FullAdder_20_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_20_io_carryIn = FullAdder_19_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_21_io_a = io_a[21]; // @[AdderNBit.scala 24:18]
  assign FullAdder_21_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_21_io_carryIn = FullAdder_20_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_22_io_a = io_a[22]; // @[AdderNBit.scala 24:18]
  assign FullAdder_22_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_22_io_carryIn = FullAdder_21_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_23_io_a = io_a[23]; // @[AdderNBit.scala 24:18]
  assign FullAdder_23_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_23_io_carryIn = FullAdder_22_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_24_io_a = io_a[24]; // @[AdderNBit.scala 24:18]
  assign FullAdder_24_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_24_io_carryIn = FullAdder_23_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_25_io_a = io_a[25]; // @[AdderNBit.scala 24:18]
  assign FullAdder_25_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_25_io_carryIn = FullAdder_24_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_26_io_a = io_a[26]; // @[AdderNBit.scala 24:18]
  assign FullAdder_26_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_26_io_carryIn = FullAdder_25_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_27_io_a = io_a[27]; // @[AdderNBit.scala 24:18]
  assign FullAdder_27_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_27_io_carryIn = FullAdder_26_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_28_io_a = io_a[28]; // @[AdderNBit.scala 24:18]
  assign FullAdder_28_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_28_io_carryIn = FullAdder_27_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_29_io_a = io_a[29]; // @[AdderNBit.scala 24:18]
  assign FullAdder_29_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_29_io_carryIn = FullAdder_28_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
  assign FullAdder_30_io_a = io_a[30]; // @[AdderNBit.scala 24:18]
  assign FullAdder_30_io_b = 1'h0; // @[AdderNBit.scala 25:19]
  assign FullAdder_30_io_carryIn = FullAdder_29_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
endmodule
module Seg7LED1Digit(
  input  [3:0] io_num,
  output [6:0] io_seg7led_cathodes
);
  wire  _io_seg7led_cathodes_T = io_num == 4'h0; // @[Seg7LED.scala 19:15]
  wire  _io_seg7led_cathodes_T_1 = io_num == 4'h1; // @[Seg7LED.scala 20:15]
  wire  _io_seg7led_cathodes_T_2 = io_num == 4'h2; // @[Seg7LED.scala 21:15]
  wire  _io_seg7led_cathodes_T_3 = io_num == 4'h3; // @[Seg7LED.scala 22:15]
  wire  _io_seg7led_cathodes_T_4 = io_num == 4'h4; // @[Seg7LED.scala 23:15]
  wire  _io_seg7led_cathodes_T_5 = io_num == 4'h5; // @[Seg7LED.scala 24:15]
  wire  _io_seg7led_cathodes_T_6 = io_num == 4'h6; // @[Seg7LED.scala 25:15]
  wire  _io_seg7led_cathodes_T_7 = io_num == 4'h7; // @[Seg7LED.scala 26:15]
  wire  _io_seg7led_cathodes_T_8 = io_num == 4'h8; // @[Seg7LED.scala 27:15]
  wire  _io_seg7led_cathodes_T_9 = io_num == 4'h9; // @[Seg7LED.scala 28:15]
  wire  _io_seg7led_cathodes_T_10 = io_num == 4'ha; // @[Seg7LED.scala 29:15]
  wire  _io_seg7led_cathodes_T_11 = io_num == 4'hb; // @[Seg7LED.scala 30:15]
  wire  _io_seg7led_cathodes_T_12 = io_num == 4'hc; // @[Seg7LED.scala 31:15]
  wire  _io_seg7led_cathodes_T_13 = io_num == 4'hd; // @[Seg7LED.scala 32:15]
  wire  _io_seg7led_cathodes_T_14 = io_num == 4'he; // @[Seg7LED.scala 33:15]
  wire  _io_seg7led_cathodes_T_15 = io_num == 4'hf; // @[Seg7LED.scala 34:15]
  wire [6:0] _io_seg7led_cathodes_T_16 = _io_seg7led_cathodes_T_15 ? 7'he : 7'h7f; // @[Mux.scala 101:16]
  wire [6:0] _io_seg7led_cathodes_T_17 = _io_seg7led_cathodes_T_14 ? 7'h6 : _io_seg7led_cathodes_T_16; // @[Mux.scala 101:16]
  wire [6:0] _io_seg7led_cathodes_T_18 = _io_seg7led_cathodes_T_13 ? 7'h21 : _io_seg7led_cathodes_T_17; // @[Mux.scala 101:16]
  wire [6:0] _io_seg7led_cathodes_T_19 = _io_seg7led_cathodes_T_12 ? 7'h46 : _io_seg7led_cathodes_T_18; // @[Mux.scala 101:16]
  wire [6:0] _io_seg7led_cathodes_T_20 = _io_seg7led_cathodes_T_11 ? 7'h3 : _io_seg7led_cathodes_T_19; // @[Mux.scala 101:16]
  wire [6:0] _io_seg7led_cathodes_T_21 = _io_seg7led_cathodes_T_10 ? 7'h8 : _io_seg7led_cathodes_T_20; // @[Mux.scala 101:16]
  wire [6:0] _io_seg7led_cathodes_T_22 = _io_seg7led_cathodes_T_9 ? 7'h10 : _io_seg7led_cathodes_T_21; // @[Mux.scala 101:16]
  wire [6:0] _io_seg7led_cathodes_T_23 = _io_seg7led_cathodes_T_8 ? 7'h0 : _io_seg7led_cathodes_T_22; // @[Mux.scala 101:16]
  wire [6:0] _io_seg7led_cathodes_T_24 = _io_seg7led_cathodes_T_7 ? 7'h58 : _io_seg7led_cathodes_T_23; // @[Mux.scala 101:16]
  wire [6:0] _io_seg7led_cathodes_T_25 = _io_seg7led_cathodes_T_6 ? 7'h2 : _io_seg7led_cathodes_T_24; // @[Mux.scala 101:16]
  wire [6:0] _io_seg7led_cathodes_T_26 = _io_seg7led_cathodes_T_5 ? 7'h12 : _io_seg7led_cathodes_T_25; // @[Mux.scala 101:16]
  wire [6:0] _io_seg7led_cathodes_T_27 = _io_seg7led_cathodes_T_4 ? 7'h19 : _io_seg7led_cathodes_T_26; // @[Mux.scala 101:16]
  wire [6:0] _io_seg7led_cathodes_T_28 = _io_seg7led_cathodes_T_3 ? 7'h30 : _io_seg7led_cathodes_T_27; // @[Mux.scala 101:16]
  wire [6:0] _io_seg7led_cathodes_T_29 = _io_seg7led_cathodes_T_2 ? 7'h24 : _io_seg7led_cathodes_T_28; // @[Mux.scala 101:16]
  wire [6:0] _io_seg7led_cathodes_T_30 = _io_seg7led_cathodes_T_1 ? 7'h79 : _io_seg7led_cathodes_T_29; // @[Mux.scala 101:16]
  assign io_seg7led_cathodes = _io_seg7led_cathodes_T ? 7'h40 : _io_seg7led_cathodes_T_30; // @[Mux.scala 101:16]
endmodule
module Counter31Bit(
  input        clock,
  input        reset,
  output [6:0] io_seg7led_cathodes,
  output       io_seg7led_decimalPoint,
  output [7:0] io_seg7led_anodes
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [30:0] adder31Bit_io_a; // @[Counter31Bit.scala 12:26]
  wire [30:0] adder31Bit_io_sum; // @[Counter31Bit.scala 12:26]
  wire [3:0] seg_io_num; // @[Counter31Bit.scala 19:19]
  wire [6:0] seg_io_seg7led_cathodes; // @[Counter31Bit.scala 19:19]
  reg [30:0] reg31Bit; // @[Counter31Bit.scala 13:25]
  AdderNBit adder31Bit ( // @[Counter31Bit.scala 12:26]
    .io_a(adder31Bit_io_a),
    .io_sum(adder31Bit_io_sum)
  );
  Seg7LED1Digit seg ( // @[Counter31Bit.scala 19:19]
    .io_num(seg_io_num),
    .io_seg7led_cathodes(seg_io_seg7led_cathodes)
  );
  assign io_seg7led_cathodes = seg_io_seg7led_cathodes; // @[Counter31Bit.scala 21:14]
  assign io_seg7led_decimalPoint = 1'h1; // @[Counter31Bit.scala 21:14]
  assign io_seg7led_anodes = 8'hfe; // @[Counter31Bit.scala 21:14]
  assign adder31Bit_io_a = reg31Bit; // @[Counter31Bit.scala 14:19]
  assign seg_io_num = reg31Bit[3:0]; // @[Counter31Bit.scala 20:25]
  always @(posedge clock) begin
    if (reset) begin // @[Counter31Bit.scala 13:25]
      reg31Bit <= 31'h0; // @[Counter31Bit.scala 13:25]
    end else begin
      reg31Bit <= adder31Bit_io_sum; // @[Counter31Bit.scala 17:12]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg31Bit = _RAND_0[30:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
