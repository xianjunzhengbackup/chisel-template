module Mux2(
  input   io_selector,
  input   io_in_0,
  input   io_in_1,
  output  io_out
);
  assign io_out = ~io_selector & io_in_0 | io_selector & io_in_1; // @[Mux2.scala 14:38]
endmodule
module Mux4(
  input        clock,
  input        reset,
  input  [1:0] io_selector,
  input        io_in_0,
  input        io_in_1,
  input        io_in_2,
  input        io_in_3,
  output       io_out
);
  wire  mux1_io_selector; // @[Mux4.scala 17:18]
  wire  mux1_io_in_0; // @[Mux4.scala 17:18]
  wire  mux1_io_in_1; // @[Mux4.scala 17:18]
  wire  mux1_io_out; // @[Mux4.scala 17:18]
  wire  mux2_io_selector; // @[Mux4.scala 18:18]
  wire  mux2_io_in_0; // @[Mux4.scala 18:18]
  wire  mux2_io_in_1; // @[Mux4.scala 18:18]
  wire  mux2_io_out; // @[Mux4.scala 18:18]
  wire  mux3_io_selector; // @[Mux4.scala 25:18]
  wire  mux3_io_in_0; // @[Mux4.scala 25:18]
  wire  mux3_io_in_1; // @[Mux4.scala 25:18]
  wire  mux3_io_out; // @[Mux4.scala 25:18]
  Mux2 mux1 ( // @[Mux4.scala 17:18]
    .io_selector(mux1_io_selector),
    .io_in_0(mux1_io_in_0),
    .io_in_1(mux1_io_in_1),
    .io_out(mux1_io_out)
  );
  Mux2 mux2 ( // @[Mux4.scala 18:18]
    .io_selector(mux2_io_selector),
    .io_in_0(mux2_io_in_0),
    .io_in_1(mux2_io_in_1),
    .io_out(mux2_io_out)
  );
  Mux2 mux3 ( // @[Mux4.scala 25:18]
    .io_selector(mux3_io_selector),
    .io_in_0(mux3_io_in_0),
    .io_in_1(mux3_io_in_1),
    .io_out(mux3_io_out)
  );
  assign io_out = mux3_io_out; // @[Mux4.scala 29:10]
  assign mux1_io_selector = io_selector[0]; // @[Mux4.scala 19:33]
  assign mux1_io_in_0 = io_in_0; // @[Mux4.scala 20:16]
  assign mux1_io_in_1 = io_in_1; // @[Mux4.scala 21:16]
  assign mux2_io_selector = io_selector[0]; // @[Mux4.scala 22:33]
  assign mux2_io_in_0 = io_in_2; // @[Mux4.scala 23:16]
  assign mux2_io_in_1 = io_in_3; // @[Mux4.scala 24:16]
  assign mux3_io_selector = io_selector[1]; // @[Mux4.scala 26:34]
  assign mux3_io_in_0 = mux1_io_out; // @[Mux4.scala 27:16]
  assign mux3_io_in_1 = mux2_io_out; // @[Mux4.scala 28:16]
endmodule
