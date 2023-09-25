module Seg7LED(
  input        clock,
  input        reset,
  input  [3:0] io_digits_0,
  input  [3:0] io_digits_1,
  input  [3:0] io_digits_2,
  input  [3:0] io_digits_3,
  input  [3:0] io_digits_4,
  input  [3:0] io_digits_5,
  input  [3:0] io_digits_6,
  input  [3:0] io_digits_7,
  output [6:0] io_seg7led_cathodes,
  output [7:0] io_seg7led_anodes
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] digitChangeCount; // @[Counter.scala 61:40]
  wire  wrap_wrap = digitChangeCount == 4'h9; // @[Counter.scala 73:24]
  wire [3:0] _wrap_value_T_1 = digitChangeCount + 4'h1; // @[Counter.scala 77:24]
  reg [2:0] digitIndex; // @[Counter.scala 61:40]
  wire [2:0] _wrap_value_T_3 = digitIndex + 3'h1; // @[Counter.scala 77:24]
  wire [3:0] _GEN_6 = 3'h1 == digitIndex ? io_digits_1 : io_digits_0; // @[Seg7LED.scala 20:{15,15}]
  wire [3:0] _GEN_7 = 3'h2 == digitIndex ? io_digits_2 : _GEN_6; // @[Seg7LED.scala 20:{15,15}]
  wire [3:0] _GEN_8 = 3'h3 == digitIndex ? io_digits_3 : _GEN_7; // @[Seg7LED.scala 20:{15,15}]
  wire [3:0] _GEN_9 = 3'h4 == digitIndex ? io_digits_4 : _GEN_8; // @[Seg7LED.scala 20:{15,15}]
  wire [3:0] _GEN_10 = 3'h5 == digitIndex ? io_digits_5 : _GEN_9; // @[Seg7LED.scala 20:{15,15}]
  wire [3:0] _GEN_11 = 3'h6 == digitIndex ? io_digits_6 : _GEN_10; // @[Seg7LED.scala 20:{15,15}]
  wire [3:0] _GEN_12 = 3'h7 == digitIndex ? io_digits_7 : _GEN_11; // @[Seg7LED.scala 20:{15,15}]
  wire  _io_seg7led_cathodes_T = _GEN_12 == 4'h0; // @[Seg7LED.scala 20:15]
  wire  _io_seg7led_cathodes_T_1 = _GEN_12 == 4'h1; // @[Seg7LED.scala 21:15]
  wire  _io_seg7led_cathodes_T_2 = _GEN_12 == 4'h2; // @[Seg7LED.scala 22:15]
  wire  _io_seg7led_cathodes_T_3 = _GEN_12 == 4'h3; // @[Seg7LED.scala 23:15]
  wire  _io_seg7led_cathodes_T_4 = _GEN_12 == 4'h4; // @[Seg7LED.scala 24:15]
  wire  _io_seg7led_cathodes_T_5 = _GEN_12 == 4'h5; // @[Seg7LED.scala 25:15]
  wire  _io_seg7led_cathodes_T_6 = _GEN_12 == 4'h6; // @[Seg7LED.scala 26:15]
  wire  _io_seg7led_cathodes_T_7 = _GEN_12 == 4'h7; // @[Seg7LED.scala 27:15]
  wire  _io_seg7led_cathodes_T_8 = _GEN_12 == 4'h8; // @[Seg7LED.scala 28:15]
  wire  _io_seg7led_cathodes_T_9 = _GEN_12 == 4'h9; // @[Seg7LED.scala 29:15]
  wire  _io_seg7led_cathodes_T_10 = _GEN_12 == 4'ha; // @[Seg7LED.scala 30:15]
  wire  _io_seg7led_cathodes_T_11 = _GEN_12 == 4'hb; // @[Seg7LED.scala 31:15]
  wire  _io_seg7led_cathodes_T_12 = _GEN_12 == 4'hc; // @[Seg7LED.scala 32:15]
  wire  _io_seg7led_cathodes_T_13 = _GEN_12 == 4'hd; // @[Seg7LED.scala 33:15]
  wire  _io_seg7led_cathodes_T_14 = _GEN_12 == 4'he; // @[Seg7LED.scala 34:15]
  wire  _io_seg7led_cathodes_T_15 = _GEN_12 == 4'hf; // @[Seg7LED.scala 35:15]
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
  wire [7:0] _io_seg7led_anodes_T = 8'h1 << digitIndex; // @[Seg7LED.scala 37:41]
  assign io_seg7led_cathodes = _io_seg7led_cathodes_T ? 7'h40 : _io_seg7led_cathodes_T_30; // @[Mux.scala 101:16]
  assign io_seg7led_anodes = ~_io_seg7led_anodes_T; // @[Seg7LED.scala 37:24]
  always @(posedge clock) begin
    if (reset) begin // @[Counter.scala 61:40]
      digitChangeCount <= 4'h0; // @[Counter.scala 61:40]
    end else if (wrap_wrap) begin // @[Counter.scala 87:20]
      digitChangeCount <= 4'h0; // @[Counter.scala 87:28]
    end else begin
      digitChangeCount <= _wrap_value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      digitIndex <= 3'h0; // @[Counter.scala 61:40]
    end else if (wrap_wrap) begin // @[Counter.scala 118:16]
      digitIndex <= _wrap_value_T_3; // @[Counter.scala 77:15]
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
  digitChangeCount = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  digitIndex = _RAND_1[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Clock(
  input        clock,
  input        reset,
  output [6:0] io_seg7led_cathodes,
  output       io_seg7led_decimalPoint,
  output [7:0] io_seg7led_anodes
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  seg_clock; // @[Clock.scala 19:19]
  wire  seg_reset; // @[Clock.scala 19:19]
  wire [3:0] seg_io_digits_0; // @[Clock.scala 19:19]
  wire [3:0] seg_io_digits_1; // @[Clock.scala 19:19]
  wire [3:0] seg_io_digits_2; // @[Clock.scala 19:19]
  wire [3:0] seg_io_digits_3; // @[Clock.scala 19:19]
  wire [3:0] seg_io_digits_4; // @[Clock.scala 19:19]
  wire [3:0] seg_io_digits_5; // @[Clock.scala 19:19]
  wire [3:0] seg_io_digits_6; // @[Clock.scala 19:19]
  wire [3:0] seg_io_digits_7; // @[Clock.scala 19:19]
  wire [6:0] seg_io_seg7led_cathodes; // @[Clock.scala 19:19]
  wire [7:0] seg_io_seg7led_anodes; // @[Clock.scala 19:19]
  reg [19:0] msTrigger_c_value; // @[Counter.scala 61:40]
  wire  msTrigger_wrap_wrap = msTrigger_c_value == 20'hf423f; // @[Counter.scala 73:24]
  wire [19:0] _msTrigger_wrap_value_T_1 = msTrigger_c_value + 20'h1; // @[Counter.scala 77:24]
  reg [6:0] msCount; // @[Counter.scala 61:40]
  wire  wrap_wrap = msCount == 7'h63; // @[Counter.scala 73:24]
  wire [6:0] _wrap_value_T_1 = msCount + 7'h1; // @[Counter.scala 77:24]
  wire  sTrigger = msTrigger_wrap_wrap & wrap_wrap; // @[Counter.scala 118:{16,23} 117:24]
  reg [5:0] sCount; // @[Counter.scala 61:40]
  wire  wrap_wrap_1 = sCount == 6'h3b; // @[Counter.scala 73:24]
  wire [5:0] _wrap_value_T_3 = sCount + 6'h1; // @[Counter.scala 77:24]
  wire  mTrigger = sTrigger & wrap_wrap_1; // @[Counter.scala 118:{16,23} 117:24]
  reg [5:0] mCount; // @[Counter.scala 61:40]
  wire  wrap_wrap_2 = mCount == 6'h3b; // @[Counter.scala 73:24]
  wire [5:0] _wrap_value_T_5 = mCount + 6'h1; // @[Counter.scala 77:24]
  wire  hTrigger = mTrigger & wrap_wrap_2; // @[Counter.scala 118:{16,23} 117:24]
  reg [4:0] hCount; // @[Counter.scala 61:40]
  wire  hCount_wrap_wrap = hCount == 5'h17; // @[Counter.scala 73:24]
  wire [4:0] _hCount_wrap_value_T_1 = hCount + 5'h1; // @[Counter.scala 77:24]
  Seg7LED seg ( // @[Clock.scala 19:19]
    .clock(seg_clock),
    .reset(seg_reset),
    .io_digits_0(seg_io_digits_0),
    .io_digits_1(seg_io_digits_1),
    .io_digits_2(seg_io_digits_2),
    .io_digits_3(seg_io_digits_3),
    .io_digits_4(seg_io_digits_4),
    .io_digits_5(seg_io_digits_5),
    .io_digits_6(seg_io_digits_6),
    .io_digits_7(seg_io_digits_7),
    .io_seg7led_cathodes(seg_io_seg7led_cathodes),
    .io_seg7led_anodes(seg_io_seg7led_anodes)
  );
  assign io_seg7led_cathodes = seg_io_seg7led_cathodes; // @[Clock.scala 20:14]
  assign io_seg7led_decimalPoint = 1'h1; // @[Clock.scala 20:14]
  assign io_seg7led_anodes = seg_io_seg7led_anodes; // @[Clock.scala 20:14]
  assign seg_clock = clock;
  assign seg_reset = reset;
  assign seg_io_digits_0 = msCount[3:0]; // @[Clock.scala 21:35]
  assign seg_io_digits_1 = {1'h0,msCount[6:4]}; // @[Cat.scala 33:92]
  assign seg_io_digits_2 = sCount[3:0]; // @[Clock.scala 21:74]
  assign seg_io_digits_3 = {2'h0,sCount[5:4]}; // @[Cat.scala 33:92]
  assign seg_io_digits_4 = mCount[3:0]; // @[Clock.scala 21:112]
  assign seg_io_digits_5 = {2'h0,mCount[5:4]}; // @[Cat.scala 33:92]
  assign seg_io_digits_6 = hCount[3:0]; // @[Clock.scala 21:150]
  assign seg_io_digits_7 = {3'h0,hCount[4]}; // @[Cat.scala 33:92]
  always @(posedge clock) begin
    if (reset) begin // @[Counter.scala 61:40]
      msTrigger_c_value <= 20'h0; // @[Counter.scala 61:40]
    end else if (msTrigger_wrap_wrap) begin // @[Counter.scala 87:20]
      msTrigger_c_value <= 20'h0; // @[Counter.scala 87:28]
    end else begin
      msTrigger_c_value <= _msTrigger_wrap_value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      msCount <= 7'h0; // @[Counter.scala 61:40]
    end else if (msTrigger_wrap_wrap) begin // @[Counter.scala 118:16]
      if (wrap_wrap) begin // @[Counter.scala 87:20]
        msCount <= 7'h0; // @[Counter.scala 87:28]
      end else begin
        msCount <= _wrap_value_T_1; // @[Counter.scala 77:15]
      end
    end
    if (reset) begin // @[Counter.scala 61:40]
      sCount <= 6'h0; // @[Counter.scala 61:40]
    end else if (sTrigger) begin // @[Counter.scala 118:16]
      if (wrap_wrap_1) begin // @[Counter.scala 87:20]
        sCount <= 6'h0; // @[Counter.scala 87:28]
      end else begin
        sCount <= _wrap_value_T_3; // @[Counter.scala 77:15]
      end
    end
    if (reset) begin // @[Counter.scala 61:40]
      mCount <= 6'h0; // @[Counter.scala 61:40]
    end else if (mTrigger) begin // @[Counter.scala 118:16]
      if (wrap_wrap_2) begin // @[Counter.scala 87:20]
        mCount <= 6'h0; // @[Counter.scala 87:28]
      end else begin
        mCount <= _wrap_value_T_5; // @[Counter.scala 77:15]
      end
    end
    if (reset) begin // @[Counter.scala 61:40]
      hCount <= 5'h0; // @[Counter.scala 61:40]
    end else if (hTrigger) begin // @[Counter.scala 118:16]
      if (hCount_wrap_wrap) begin // @[Counter.scala 87:20]
        hCount <= 5'h0; // @[Counter.scala 87:28]
      end else begin
        hCount <= _hCount_wrap_value_T_1; // @[Counter.scala 77:15]
      end
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
  msTrigger_c_value = _RAND_0[19:0];
  _RAND_1 = {1{`RANDOM}};
  msCount = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  sCount = _RAND_2[5:0];
  _RAND_3 = {1{`RANDOM}};
  mCount = _RAND_3[5:0];
  _RAND_4 = {1{`RANDOM}};
  hCount = _RAND_4[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
