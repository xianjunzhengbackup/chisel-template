module Mux2(
  input   io_sel,
  input   io_in0,
  input   io_in1,
  output  io_out
);
  assign io_out = io_sel & io_in1 | ~io_sel & io_in0; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 92:35]
endmodule
module Mux4_2(
  input        clock,
  input        reset,
  input        io_in0,
  input        io_in1,
  input        io_in2,
  input        io_in3,
  input  [1:0] io_sel,
  output       io_out
);
  wire  Mux2_io_sel; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:41]
  wire  Mux2_io_in0; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:41]
  wire  Mux2_io_in1; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:41]
  wire  Mux2_io_out; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:41]
  wire  Mux2_1_io_sel; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:41]
  wire  Mux2_1_io_in0; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:41]
  wire  Mux2_1_io_in1; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:41]
  wire  Mux2_1_io_out; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:41]
  wire  Mux2_2_io_sel; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:41]
  wire  Mux2_2_io_in0; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:41]
  wire  Mux2_2_io_in1; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:41]
  wire  Mux2_2_io_out; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:41]
  Mux2 Mux2 ( // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:41]
    .io_sel(Mux2_io_sel),
    .io_in0(Mux2_io_in0),
    .io_in1(Mux2_io_in1),
    .io_out(Mux2_io_out)
  );
  Mux2 Mux2_1 ( // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:41]
    .io_sel(Mux2_1_io_sel),
    .io_in0(Mux2_1_io_in0),
    .io_in1(Mux2_1_io_in1),
    .io_out(Mux2_1_io_out)
  );
  Mux2 Mux2_2 ( // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:41]
    .io_sel(Mux2_2_io_sel),
    .io_in0(Mux2_2_io_in0),
    .io_in1(Mux2_2_io_in1),
    .io_out(Mux2_2_io_out)
  );
  assign io_out = Mux2_2_io_out; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:{22,22}]
  assign Mux2_io_sel = io_sel[0]; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 154:25]
  assign Mux2_io_in0 = io_in0; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:22 155:16]
  assign Mux2_io_in1 = io_in1; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:22 156:16]
  assign Mux2_1_io_sel = io_sel[0]; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 158:25]
  assign Mux2_1_io_in0 = io_in2; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:22 159:16]
  assign Mux2_1_io_in1 = io_in3; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:22 160:16]
  assign Mux2_2_io_sel = io_sel[1]; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 162:25]
  assign Mux2_2_io_in0 = Mux2_io_out; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:{22,22}]
  assign Mux2_2_io_in1 = Mux2_1_io_out; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 153:{22,22}]
endmodule
