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
module Adder4Bit(
  input  [3:0] io_a,
  input  [3:0] io_b,
  output [3:0] io_sum
);
  wire  f1_io_a; // @[Adder4Bit.scala 17:18]
  wire  f1_io_b; // @[Adder4Bit.scala 17:18]
  wire  f1_io_carryIn; // @[Adder4Bit.scala 17:18]
  wire  f1_io_sum; // @[Adder4Bit.scala 17:18]
  wire  f1_io_carryOut; // @[Adder4Bit.scala 17:18]
  wire  f2_io_a; // @[Adder4Bit.scala 18:18]
  wire  f2_io_b; // @[Adder4Bit.scala 18:18]
  wire  f2_io_carryIn; // @[Adder4Bit.scala 18:18]
  wire  f2_io_sum; // @[Adder4Bit.scala 18:18]
  wire  f2_io_carryOut; // @[Adder4Bit.scala 18:18]
  wire  f3_io_a; // @[Adder4Bit.scala 19:18]
  wire  f3_io_b; // @[Adder4Bit.scala 19:18]
  wire  f3_io_carryIn; // @[Adder4Bit.scala 19:18]
  wire  f3_io_sum; // @[Adder4Bit.scala 19:18]
  wire  f3_io_carryOut; // @[Adder4Bit.scala 19:18]
  wire  f0_io_a; // @[Adder4Bit.scala 20:18]
  wire  f0_io_b; // @[Adder4Bit.scala 20:18]
  wire  f0_io_carryIn; // @[Adder4Bit.scala 20:18]
  wire  f0_io_sum; // @[Adder4Bit.scala 20:18]
  wire  f0_io_carryOut; // @[Adder4Bit.scala 20:18]
  wire [1:0] io_sum_lo = {f1_io_sum,f0_io_sum}; // @[Cat.scala 33:92]
  wire [1:0] io_sum_hi = {f3_io_sum,f2_io_sum}; // @[Cat.scala 33:92]
  FullAdder f1 ( // @[Adder4Bit.scala 17:18]
    .io_a(f1_io_a),
    .io_b(f1_io_b),
    .io_carryIn(f1_io_carryIn),
    .io_sum(f1_io_sum),
    .io_carryOut(f1_io_carryOut)
  );
  FullAdder f2 ( // @[Adder4Bit.scala 18:18]
    .io_a(f2_io_a),
    .io_b(f2_io_b),
    .io_carryIn(f2_io_carryIn),
    .io_sum(f2_io_sum),
    .io_carryOut(f2_io_carryOut)
  );
  FullAdder f3 ( // @[Adder4Bit.scala 19:18]
    .io_a(f3_io_a),
    .io_b(f3_io_b),
    .io_carryIn(f3_io_carryIn),
    .io_sum(f3_io_sum),
    .io_carryOut(f3_io_carryOut)
  );
  FullAdder f0 ( // @[Adder4Bit.scala 20:18]
    .io_a(f0_io_a),
    .io_b(f0_io_b),
    .io_carryIn(f0_io_carryIn),
    .io_sum(f0_io_sum),
    .io_carryOut(f0_io_carryOut)
  );
  assign io_sum = {io_sum_hi,io_sum_lo}; // @[Cat.scala 33:92]
  assign f1_io_a = io_a[1]; // @[Adder4Bit.scala 26:18]
  assign f1_io_b = io_b[1]; // @[Adder4Bit.scala 27:18]
  assign f1_io_carryIn = f0_io_carryOut; // @[Adder4Bit.scala 28:17]
  assign f2_io_a = io_a[2]; // @[Adder4Bit.scala 30:18]
  assign f2_io_b = io_b[2]; // @[Adder4Bit.scala 31:18]
  assign f2_io_carryIn = f1_io_carryOut; // @[Adder4Bit.scala 32:17]
  assign f3_io_a = io_a[3]; // @[Adder4Bit.scala 34:18]
  assign f3_io_b = io_b[3]; // @[Adder4Bit.scala 35:18]
  assign f3_io_carryIn = f2_io_carryOut; // @[Adder4Bit.scala 36:17]
  assign f0_io_a = io_a[0]; // @[Adder4Bit.scala 22:18]
  assign f0_io_b = io_b[0]; // @[Adder4Bit.scala 23:18]
  assign f0_io_carryIn = 1'h0; // @[Adder4Bit.scala 24:17]
endmodule
module Subtract4Bit(
  input        clock,
  input        reset,
  input  [3:0] io_a,
  input  [3:0] io_b,
  output [3:0] io_result
);
  wire [3:0] adder_io_a; // @[Subtract4Bit.scala 13:21]
  wire [3:0] adder_io_b; // @[Subtract4Bit.scala 13:21]
  wire [3:0] adder_io_sum; // @[Subtract4Bit.scala 13:21]
  wire [3:0] _b_complement_T = ~io_b; // @[Subtract4Bit.scala 14:22]
  Adder4Bit adder ( // @[Subtract4Bit.scala 13:21]
    .io_a(adder_io_a),
    .io_b(adder_io_b),
    .io_sum(adder_io_sum)
  );
  assign io_result = adder_io_sum; // @[Subtract4Bit.scala 18:13]
  assign adder_io_a = io_a; // @[Subtract4Bit.scala 16:14]
  assign adder_io_b = _b_complement_T + 4'h1; // @[Subtract4Bit.scala 14:28]
endmodule
