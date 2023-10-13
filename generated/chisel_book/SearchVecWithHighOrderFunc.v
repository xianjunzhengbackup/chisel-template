module SearchVecWithHighOrderFunc(
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
  wire  _T = io_vec_0 > io_vec_1; // @[SearchVec.scala 48:67]
  wire [7:0] _T_1 = _T ? io_vec_0 : io_vec_1; // @[SearchVec.scala 42:75]
  wire  _T_3 = _T ? 1'h0 : 1'h1; // @[SearchVec.scala 42:103]
  wire  _T_4 = _T_1 > io_vec_2; // @[SearchVec.scala 48:67]
  wire [7:0] _T_5 = _T_4 ? _T_1 : io_vec_2; // @[SearchVec.scala 42:75]
  wire [1:0] _T_7 = _T_4 ? {{1'd0}, _T_3} : 2'h2; // @[SearchVec.scala 42:103]
  wire  _T_8 = _T_5 > io_vec_3; // @[SearchVec.scala 48:67]
  wire [7:0] _T_9 = _T_8 ? _T_5 : io_vec_3; // @[SearchVec.scala 42:75]
  wire [1:0] _T_11 = _T_8 ? _T_7 : 2'h3; // @[SearchVec.scala 42:103]
  wire  _T_12 = _T_9 > io_vec_4; // @[SearchVec.scala 48:67]
  wire [7:0] _T_13 = _T_12 ? _T_9 : io_vec_4; // @[SearchVec.scala 42:75]
  wire [2:0] _T_15 = _T_12 ? {{1'd0}, _T_11} : 3'h4; // @[SearchVec.scala 42:103]
  wire  _T_16 = _T_13 > io_vec_5; // @[SearchVec.scala 48:67]
  wire [7:0] _T_17 = _T_16 ? _T_13 : io_vec_5; // @[SearchVec.scala 42:75]
  wire [2:0] _T_19 = _T_16 ? _T_15 : 3'h5; // @[SearchVec.scala 42:103]
  wire  _T_20 = _T_17 > io_vec_6; // @[SearchVec.scala 48:67]
  wire [7:0] _T_21 = _T_20 ? _T_17 : io_vec_6; // @[SearchVec.scala 42:75]
  wire [2:0] _T_23 = _T_20 ? _T_19 : 3'h6; // @[SearchVec.scala 42:103]
  wire  _T_24 = _T_21 > io_vec_7; // @[SearchVec.scala 48:67]
  wire [7:0] _T_25 = _T_24 ? _T_21 : io_vec_7; // @[SearchVec.scala 42:75]
  wire [2:0] _T_27 = _T_24 ? _T_23 : 3'h7; // @[SearchVec.scala 42:103]
  wire  _T_28 = _T_25 > io_vec_8; // @[SearchVec.scala 48:67]
  wire [7:0] _T_29 = _T_28 ? _T_25 : io_vec_8; // @[SearchVec.scala 42:75]
  wire [3:0] _T_31 = _T_28 ? {{1'd0}, _T_27} : 4'h8; // @[SearchVec.scala 42:103]
  wire  _T_32 = _T_29 > io_vec_9; // @[SearchVec.scala 48:67]
  wire [3:0] _T_35 = _T_32 ? _T_31 : 4'h9; // @[SearchVec.scala 42:103]
  assign io_out_v = _T_32 ? _T_29 : io_vec_9; // @[SearchVec.scala 42:75]
  assign io_out_idx = {{4'd0}, _T_35}; // @[SearchVec.scala 44:13]
endmodule
