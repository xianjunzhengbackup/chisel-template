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
module Adder4BitV2(
  input        clock,
  input        reset,
  input  [3:0] io_a,
  input  [3:0] io_b,
  input        io_carryIn,
  output [3:0] io_sum,
  output       io_carryOut
);
  wire  FullAdder_io_a; // @[Adder4BitV2.scala 23:33]
  wire  FullAdder_io_b; // @[Adder4BitV2.scala 23:33]
  wire  FullAdder_io_carryIn; // @[Adder4BitV2.scala 23:33]
  wire  FullAdder_io_sum; // @[Adder4BitV2.scala 23:33]
  wire  FullAdder_io_carryOut; // @[Adder4BitV2.scala 23:33]
  wire  FullAdder_1_io_a; // @[Adder4BitV2.scala 23:33]
  wire  FullAdder_1_io_b; // @[Adder4BitV2.scala 23:33]
  wire  FullAdder_1_io_carryIn; // @[Adder4BitV2.scala 23:33]
  wire  FullAdder_1_io_sum; // @[Adder4BitV2.scala 23:33]
  wire  FullAdder_1_io_carryOut; // @[Adder4BitV2.scala 23:33]
  wire  FullAdder_2_io_a; // @[Adder4BitV2.scala 23:33]
  wire  FullAdder_2_io_b; // @[Adder4BitV2.scala 23:33]
  wire  FullAdder_2_io_carryIn; // @[Adder4BitV2.scala 23:33]
  wire  FullAdder_2_io_sum; // @[Adder4BitV2.scala 23:33]
  wire  FullAdder_2_io_carryOut; // @[Adder4BitV2.scala 23:33]
  wire  FullAdder_3_io_a; // @[Adder4BitV2.scala 23:33]
  wire  FullAdder_3_io_b; // @[Adder4BitV2.scala 23:33]
  wire  FullAdder_3_io_carryIn; // @[Adder4BitV2.scala 23:33]
  wire  FullAdder_3_io_sum; // @[Adder4BitV2.scala 23:33]
  wire  FullAdder_3_io_carryOut; // @[Adder4BitV2.scala 23:33]
  wire  f_1_sum = FullAdder_1_io_sum; // @[Adder4BitV2.scala 23:{26,26}]
  wire  f_0_sum = FullAdder_io_sum; // @[Adder4BitV2.scala 23:{26,26}]
  wire [1:0] io_sum_lo = {f_1_sum,f_0_sum}; // @[Cat.scala 33:92]
  wire  f_3_sum = FullAdder_3_io_sum; // @[Adder4BitV2.scala 23:{26,26}]
  wire  f_2_sum = FullAdder_2_io_sum; // @[Adder4BitV2.scala 23:{26,26}]
  wire [1:0] io_sum_hi = {f_3_sum,f_2_sum}; // @[Cat.scala 33:92]
  FullAdder FullAdder ( // @[Adder4BitV2.scala 23:33]
    .io_a(FullAdder_io_a),
    .io_b(FullAdder_io_b),
    .io_carryIn(FullAdder_io_carryIn),
    .io_sum(FullAdder_io_sum),
    .io_carryOut(FullAdder_io_carryOut)
  );
  FullAdder FullAdder_1 ( // @[Adder4BitV2.scala 23:33]
    .io_a(FullAdder_1_io_a),
    .io_b(FullAdder_1_io_b),
    .io_carryIn(FullAdder_1_io_carryIn),
    .io_sum(FullAdder_1_io_sum),
    .io_carryOut(FullAdder_1_io_carryOut)
  );
  FullAdder FullAdder_2 ( // @[Adder4BitV2.scala 23:33]
    .io_a(FullAdder_2_io_a),
    .io_b(FullAdder_2_io_b),
    .io_carryIn(FullAdder_2_io_carryIn),
    .io_sum(FullAdder_2_io_sum),
    .io_carryOut(FullAdder_2_io_carryOut)
  );
  FullAdder FullAdder_3 ( // @[Adder4BitV2.scala 23:33]
    .io_a(FullAdder_3_io_a),
    .io_b(FullAdder_3_io_b),
    .io_carryIn(FullAdder_3_io_carryIn),
    .io_sum(FullAdder_3_io_sum),
    .io_carryOut(FullAdder_3_io_carryOut)
  );
  assign io_sum = {io_sum_hi,io_sum_lo}; // @[Cat.scala 33:92]
  assign io_carryOut = FullAdder_3_io_carryOut; // @[Adder4BitV2.scala 23:{26,26}]
  assign FullAdder_io_a = io_a[0]; // @[Adder4BitV2.scala 43:21]
  assign FullAdder_io_b = io_b[0]; // @[Adder4BitV2.scala 44:21]
  assign FullAdder_io_carryIn = io_carryIn; // @[Adder4BitV2.scala 23:26 45:20]
  assign FullAdder_1_io_a = io_a[1]; // @[Adder4BitV2.scala 47:21]
  assign FullAdder_1_io_b = io_b[1]; // @[Adder4BitV2.scala 48:21]
  assign FullAdder_1_io_carryIn = FullAdder_io_carryOut; // @[Adder4BitV2.scala 23:{26,26}]
  assign FullAdder_2_io_a = io_a[2]; // @[Adder4BitV2.scala 47:21]
  assign FullAdder_2_io_b = io_b[2]; // @[Adder4BitV2.scala 48:21]
  assign FullAdder_2_io_carryIn = FullAdder_1_io_carryOut; // @[Adder4BitV2.scala 23:{26,26}]
  assign FullAdder_3_io_a = io_a[3]; // @[Adder4BitV2.scala 47:21]
  assign FullAdder_3_io_b = io_b[3]; // @[Adder4BitV2.scala 48:21]
  assign FullAdder_3_io_carryIn = FullAdder_2_io_carryOut; // @[Adder4BitV2.scala 23:{26,26}]
endmodule
