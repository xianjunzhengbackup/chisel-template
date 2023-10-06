module BlackBoxWrapper(
  input         clock,
  input         reset,
  input  [31:0] io_a,
  input  [31:0] io_b,
  input         io_cin,
  output [31:0] io_c,
  output        io_cout
);
  wire [31:0] bb_a; // @[BlackBox.scala 54:18]
  wire [31:0] bb_b; // @[BlackBox.scala 54:18]
  wire  bb_cin; // @[BlackBox.scala 54:18]
  wire [31:0] bb_c; // @[BlackBox.scala 54:18]
  wire  bb_cout; // @[BlackBox.scala 54:18]
  InlineBlackBoxAdder bb ( // @[BlackBox.scala 54:18]
    .a(bb_a),
    .b(bb_b),
    .cin(bb_cin),
    .c(bb_c),
    .cout(bb_cout)
  );
  assign io_c = bb_c; // @[BlackBox.scala 55:6]
  assign io_cout = bb_cout; // @[BlackBox.scala 55:6]
  assign bb_a = io_a; // @[BlackBox.scala 55:6]
  assign bb_b = io_b; // @[BlackBox.scala 55:6]
  assign bb_cin = io_cin; // @[BlackBox.scala 55:6]
endmodule
