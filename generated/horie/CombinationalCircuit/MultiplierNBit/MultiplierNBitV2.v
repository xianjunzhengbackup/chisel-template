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
  output [7:0] io_sum,
  output       io_carryOut
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
  assign io_carryOut = FullAdder_7_io_carryOut; // @[AdderNBit.scala 17:{26,26}]
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
module MultiplierNBitV2(
  input         clock,
  input         reset,
  input  [7:0]  io_a,
  input  [7:0]  io_b,
  output [15:0] io_result
);
  wire [7:0] AdderNBit_io_a; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] AdderNBit_io_b; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] AdderNBit_io_sum; // @[MultiplierNBitV2.scala 16:40]
  wire  AdderNBit_io_carryOut; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] AdderNBit_1_io_a; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] AdderNBit_1_io_b; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] AdderNBit_1_io_sum; // @[MultiplierNBitV2.scala 16:40]
  wire  AdderNBit_1_io_carryOut; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] AdderNBit_2_io_a; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] AdderNBit_2_io_b; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] AdderNBit_2_io_sum; // @[MultiplierNBitV2.scala 16:40]
  wire  AdderNBit_2_io_carryOut; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] AdderNBit_3_io_a; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] AdderNBit_3_io_b; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] AdderNBit_3_io_sum; // @[MultiplierNBitV2.scala 16:40]
  wire  AdderNBit_3_io_carryOut; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] AdderNBit_4_io_a; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] AdderNBit_4_io_b; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] AdderNBit_4_io_sum; // @[MultiplierNBitV2.scala 16:40]
  wire  AdderNBit_4_io_carryOut; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] AdderNBit_5_io_a; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] AdderNBit_5_io_b; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] AdderNBit_5_io_sum; // @[MultiplierNBitV2.scala 16:40]
  wire  AdderNBit_5_io_carryOut; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] AdderNBit_6_io_a; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] AdderNBit_6_io_b; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] AdderNBit_6_io_sum; // @[MultiplierNBitV2.scala 16:40]
  wire  AdderNBit_6_io_carryOut; // @[MultiplierNBitV2.scala 16:40]
  wire [7:0] _digits_T_2 = io_b[0] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] digits_0 = io_a & _digits_T_2; // @[MultiplierNBitV2.scala 14:8]
  wire [7:0] _digits_T_6 = io_b[1] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _digits_T_10 = io_b[2] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _digits_T_14 = io_b[3] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _digits_T_18 = io_b[4] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _digits_T_22 = io_b[5] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _digits_T_26 = io_b[6] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _digits_T_30 = io_b[7] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] adders_0_sum = AdderNBit_io_sum; // @[MultiplierNBitV2.scala 16:{33,33}]
  wire  adders_0_carryOut = AdderNBit_io_carryOut; // @[MultiplierNBitV2.scala 16:{33,33}]
  wire [7:0] adders_1_sum = AdderNBit_1_io_sum; // @[MultiplierNBitV2.scala 16:{33,33}]
  wire  adders_1_carryOut = AdderNBit_1_io_carryOut; // @[MultiplierNBitV2.scala 16:{33,33}]
  wire [7:0] adders_2_sum = AdderNBit_2_io_sum; // @[MultiplierNBitV2.scala 16:{33,33}]
  wire  adders_2_carryOut = AdderNBit_2_io_carryOut; // @[MultiplierNBitV2.scala 16:{33,33}]
  wire [7:0] adders_3_sum = AdderNBit_3_io_sum; // @[MultiplierNBitV2.scala 16:{33,33}]
  wire  adders_3_carryOut = AdderNBit_3_io_carryOut; // @[MultiplierNBitV2.scala 16:{33,33}]
  wire [7:0] adders_4_sum = AdderNBit_4_io_sum; // @[MultiplierNBitV2.scala 16:{33,33}]
  wire  adders_4_carryOut = AdderNBit_4_io_carryOut; // @[MultiplierNBitV2.scala 16:{33,33}]
  wire [7:0] adders_5_sum = AdderNBit_5_io_sum; // @[MultiplierNBitV2.scala 16:{33,33}]
  wire  adders_5_carryOut = AdderNBit_5_io_carryOut; // @[MultiplierNBitV2.scala 16:{33,33}]
  wire  adders_6_carryOut = AdderNBit_6_io_carryOut; // @[MultiplierNBitV2.scala 16:{33,33}]
  wire [7:0] adders_6_sum = AdderNBit_6_io_sum; // @[MultiplierNBitV2.scala 16:{33,33}]
  wire [14:0] io_result_hi = {adders_6_carryOut,adders_6_sum,adders_5_sum[0],adders_4_sum[0],adders_3_sum[0],
    adders_2_sum[0],adders_1_sum[0],adders_0_sum[0]}; // @[Cat.scala 33:92]
  AdderNBit AdderNBit ( // @[MultiplierNBitV2.scala 16:40]
    .io_a(AdderNBit_io_a),
    .io_b(AdderNBit_io_b),
    .io_sum(AdderNBit_io_sum),
    .io_carryOut(AdderNBit_io_carryOut)
  );
  AdderNBit AdderNBit_1 ( // @[MultiplierNBitV2.scala 16:40]
    .io_a(AdderNBit_1_io_a),
    .io_b(AdderNBit_1_io_b),
    .io_sum(AdderNBit_1_io_sum),
    .io_carryOut(AdderNBit_1_io_carryOut)
  );
  AdderNBit AdderNBit_2 ( // @[MultiplierNBitV2.scala 16:40]
    .io_a(AdderNBit_2_io_a),
    .io_b(AdderNBit_2_io_b),
    .io_sum(AdderNBit_2_io_sum),
    .io_carryOut(AdderNBit_2_io_carryOut)
  );
  AdderNBit AdderNBit_3 ( // @[MultiplierNBitV2.scala 16:40]
    .io_a(AdderNBit_3_io_a),
    .io_b(AdderNBit_3_io_b),
    .io_sum(AdderNBit_3_io_sum),
    .io_carryOut(AdderNBit_3_io_carryOut)
  );
  AdderNBit AdderNBit_4 ( // @[MultiplierNBitV2.scala 16:40]
    .io_a(AdderNBit_4_io_a),
    .io_b(AdderNBit_4_io_b),
    .io_sum(AdderNBit_4_io_sum),
    .io_carryOut(AdderNBit_4_io_carryOut)
  );
  AdderNBit AdderNBit_5 ( // @[MultiplierNBitV2.scala 16:40]
    .io_a(AdderNBit_5_io_a),
    .io_b(AdderNBit_5_io_b),
    .io_sum(AdderNBit_5_io_sum),
    .io_carryOut(AdderNBit_5_io_carryOut)
  );
  AdderNBit AdderNBit_6 ( // @[MultiplierNBitV2.scala 16:40]
    .io_a(AdderNBit_6_io_a),
    .io_b(AdderNBit_6_io_b),
    .io_sum(AdderNBit_6_io_sum),
    .io_carryOut(AdderNBit_6_io_carryOut)
  );
  assign io_result = {io_result_hi,digits_0[0]}; // @[Cat.scala 33:92]
  assign AdderNBit_io_a = io_a & _digits_T_6; // @[MultiplierNBitV2.scala 14:8]
  assign AdderNBit_io_b = {1'h0,digits_0[7:1]}; // @[Cat.scala 33:92]
  assign AdderNBit_1_io_a = io_a & _digits_T_10; // @[MultiplierNBitV2.scala 14:8]
  assign AdderNBit_1_io_b = {adders_0_carryOut,adders_0_sum[7:1]}; // @[Cat.scala 33:92]
  assign AdderNBit_2_io_a = io_a & _digits_T_14; // @[MultiplierNBitV2.scala 14:8]
  assign AdderNBit_2_io_b = {adders_1_carryOut,adders_1_sum[7:1]}; // @[Cat.scala 33:92]
  assign AdderNBit_3_io_a = io_a & _digits_T_18; // @[MultiplierNBitV2.scala 14:8]
  assign AdderNBit_3_io_b = {adders_2_carryOut,adders_2_sum[7:1]}; // @[Cat.scala 33:92]
  assign AdderNBit_4_io_a = io_a & _digits_T_22; // @[MultiplierNBitV2.scala 14:8]
  assign AdderNBit_4_io_b = {adders_3_carryOut,adders_3_sum[7:1]}; // @[Cat.scala 33:92]
  assign AdderNBit_5_io_a = io_a & _digits_T_26; // @[MultiplierNBitV2.scala 14:8]
  assign AdderNBit_5_io_b = {adders_4_carryOut,adders_4_sum[7:1]}; // @[Cat.scala 33:92]
  assign AdderNBit_6_io_a = io_a & _digits_T_30; // @[MultiplierNBitV2.scala 14:8]
  assign AdderNBit_6_io_b = {adders_5_carryOut,adders_5_sum[7:1]}; // @[Cat.scala 33:92]
endmodule
