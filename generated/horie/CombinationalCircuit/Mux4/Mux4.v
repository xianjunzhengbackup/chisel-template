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
  wire  out_0_1_mux2_io_selector; // @[Mux2.scala 19:22]
  wire  out_0_1_mux2_io_in_0; // @[Mux2.scala 19:22]
  wire  out_0_1_mux2_io_in_1; // @[Mux2.scala 19:22]
  wire  out_0_1_mux2_io_out; // @[Mux2.scala 19:22]
  wire  out_2_3_mux2_io_selector; // @[Mux2.scala 19:22]
  wire  out_2_3_mux2_io_in_0; // @[Mux2.scala 19:22]
  wire  out_2_3_mux2_io_in_1; // @[Mux2.scala 19:22]
  wire  out_2_3_mux2_io_out; // @[Mux2.scala 19:22]
  wire  io_out_mux2_io_selector; // @[Mux2.scala 19:22]
  wire  io_out_mux2_io_in_0; // @[Mux2.scala 19:22]
  wire  io_out_mux2_io_in_1; // @[Mux2.scala 19:22]
  wire  io_out_mux2_io_out; // @[Mux2.scala 19:22]
  Mux2 out_0_1_mux2 ( // @[Mux2.scala 19:22]
    .io_selector(out_0_1_mux2_io_selector),
    .io_in_0(out_0_1_mux2_io_in_0),
    .io_in_1(out_0_1_mux2_io_in_1),
    .io_out(out_0_1_mux2_io_out)
  );
  Mux2 out_2_3_mux2 ( // @[Mux2.scala 19:22]
    .io_selector(out_2_3_mux2_io_selector),
    .io_in_0(out_2_3_mux2_io_in_0),
    .io_in_1(out_2_3_mux2_io_in_1),
    .io_out(out_2_3_mux2_io_out)
  );
  Mux2 io_out_mux2 ( // @[Mux2.scala 19:22]
    .io_selector(io_out_mux2_io_selector),
    .io_in_0(io_out_mux2_io_in_0),
    .io_in_1(io_out_mux2_io_in_1),
    .io_out(io_out_mux2_io_out)
  );
  assign io_out = io_out_mux2_io_out; // @[Mux4.scala 33:9]
  assign out_0_1_mux2_io_selector = io_selector[0]; // @[Mux4.scala 31:32]
  assign out_0_1_mux2_io_in_0 = io_in_0; // @[Mux2.scala 21:18]
  assign out_0_1_mux2_io_in_1 = io_in_1; // @[Mux2.scala 22:18]
  assign out_2_3_mux2_io_selector = io_selector[0]; // @[Mux4.scala 32:32]
  assign out_2_3_mux2_io_in_0 = io_in_2; // @[Mux2.scala 21:18]
  assign out_2_3_mux2_io_in_1 = io_in_3; // @[Mux2.scala 22:18]
  assign io_out_mux2_io_selector = io_selector[1]; // @[Mux4.scala 33:28]
  assign io_out_mux2_io_in_0 = out_0_1_mux2_io_out; // @[Mux2.scala 21:18]
  assign io_out_mux2_io_in_1 = out_2_3_mux2_io_out; // @[Mux2.scala 22:18]
endmodule
