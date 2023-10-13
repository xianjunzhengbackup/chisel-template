module SearchVec(
  input        clock,
  input        reset,
  input  [7:0] io_vec_0,
  input  [7:0] io_vec_1,
  input  [7:0] io_vec_2,
  input  [7:0] io_vec_3,
  input  [7:0] io_vec_4,
  input  [7:0] io_vec_5,
  input  [7:0] io_vec_6,
  input  [7:0] io_vec_7,
  input  [7:0] io_vec_8,
  input  [7:0] io_vec_9,
  output [7:0] io_out_v,
  output [7:0] io_out_idx
);
  wire [7:0] _io_out_T_1_v = io_vec_6 < io_vec_7 ? io_vec_6 : io_vec_7; // @[SearchVec.scala 18:41]
  wire [7:0] _io_out_T_1_idx = io_vec_6 < io_vec_7 ? 8'h6 : 8'h7; // @[SearchVec.scala 18:41]
  wire [7:0] _io_out_T_3_v = io_vec_8 < io_vec_9 ? io_vec_8 : io_vec_9; // @[SearchVec.scala 18:41]
  wire [7:0] _io_out_T_3_idx = io_vec_8 < io_vec_9 ? 8'h8 : 8'h9; // @[SearchVec.scala 18:41]
  wire [7:0] _io_out_T_5_v = io_vec_0 < io_vec_1 ? io_vec_0 : io_vec_1; // @[SearchVec.scala 18:41]
  wire [7:0] _io_out_T_5_idx = io_vec_0 < io_vec_1 ? 8'h0 : 8'h1; // @[SearchVec.scala 18:41]
  wire [7:0] _io_out_T_7_v = io_vec_2 < io_vec_3 ? io_vec_2 : io_vec_3; // @[SearchVec.scala 18:41]
  wire [7:0] _io_out_T_7_idx = io_vec_2 < io_vec_3 ? 8'h2 : 8'h3; // @[SearchVec.scala 18:41]
  wire [7:0] _io_out_T_9_v = io_vec_4 < io_vec_5 ? io_vec_4 : io_vec_5; // @[SearchVec.scala 18:41]
  wire [7:0] _io_out_T_9_idx = io_vec_4 < io_vec_5 ? 8'h4 : 8'h5; // @[SearchVec.scala 18:41]
  wire [7:0] _io_out_T_11_v = _io_out_T_1_v < _io_out_T_3_v ? _io_out_T_1_v : _io_out_T_3_v; // @[SearchVec.scala 18:41]
  wire [7:0] _io_out_T_11_idx = _io_out_T_1_v < _io_out_T_3_v ? _io_out_T_1_idx : _io_out_T_3_idx; // @[SearchVec.scala 18:41]
  wire [7:0] _io_out_T_13_v = _io_out_T_5_v < _io_out_T_7_v ? _io_out_T_5_v : _io_out_T_7_v; // @[SearchVec.scala 18:41]
  wire [7:0] _io_out_T_13_idx = _io_out_T_5_v < _io_out_T_7_v ? _io_out_T_5_idx : _io_out_T_7_idx; // @[SearchVec.scala 18:41]
  wire [7:0] _io_out_T_15_v = _io_out_T_9_v < _io_out_T_11_v ? _io_out_T_9_v : _io_out_T_11_v; // @[SearchVec.scala 18:41]
  wire [7:0] _io_out_T_15_idx = _io_out_T_9_v < _io_out_T_11_v ? _io_out_T_9_idx : _io_out_T_11_idx; // @[SearchVec.scala 18:41]
  assign io_out_v = _io_out_T_13_v < _io_out_T_15_v ? _io_out_T_13_v : _io_out_T_15_v; // @[SearchVec.scala 18:41]
  assign io_out_idx = _io_out_T_13_v < _io_out_T_15_v ? _io_out_T_13_idx : _io_out_T_15_idx; // @[SearchVec.scala 18:41]
endmodule
