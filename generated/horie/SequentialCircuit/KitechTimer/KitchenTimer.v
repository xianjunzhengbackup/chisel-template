module SRLatch(
  input   io_set,
  input   io_reset,
  output  io_q,
  output  io_notQ
);
  assign io_q = ~(io_reset | io_notQ); // @[SRLatch.scala 13:11]
  assign io_notQ = ~(io_set | io_q); // @[SRLatch.scala 14:14]
endmodule
module Debounce(
  input   clock,
  input   reset,
  input   io_in,
  output  io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  sr_latch_io_set; // @[Debounce.scala 31:24]
  wire  sr_latch_io_reset; // @[Debounce.scala 31:24]
  wire  sr_latch_io_q; // @[Debounce.scala 31:24]
  wire  sr_latch_io_notQ; // @[Debounce.scala 31:24]
  reg  reg1; // @[Debounce.scala 12:21]
  reg  reg2; // @[Debounce.scala 14:21]
  wire  detectFallingEdge = ~reg1 & reg2; // @[Debounce.scala 22:34]
  wire  detectRisingEdge = ~reg2 & reg1; // @[Debounce.scala 23:33]
  wire  _onems_f_T = ~io_in; // @[Debounce.scala 26:18]
  reg [2:0] onems_f_c_value; // @[Counter.scala 61:40]
  wire  onems_f_wrap_wrap = onems_f_c_value == 3'h4; // @[Counter.scala 73:24]
  wire [2:0] _onems_f_wrap_value_T_1 = onems_f_c_value + 3'h1; // @[Counter.scala 77:24]
  reg [2:0] onems_r_c_value; // @[Counter.scala 61:40]
  wire  onems_r_wrap_wrap = onems_r_c_value == 3'h4; // @[Counter.scala 73:24]
  wire [2:0] _onems_r_wrap_value_T_1 = onems_r_c_value + 3'h1; // @[Counter.scala 77:24]
  SRLatch sr_latch ( // @[Debounce.scala 31:24]
    .io_set(sr_latch_io_set),
    .io_reset(sr_latch_io_reset),
    .io_q(sr_latch_io_q),
    .io_notQ(sr_latch_io_notQ)
  );
  assign io_out = sr_latch_io_q; // @[Debounce.scala 34:10]
  assign sr_latch_io_set = io_in & onems_r_wrap_wrap; // @[Counter.scala 118:{16,23} 117:24]
  assign sr_latch_io_reset = _onems_f_T & onems_f_wrap_wrap; // @[Counter.scala 118:{16,23} 117:24]
  always @(posedge clock) begin
    if (reset) begin // @[Debounce.scala 12:21]
      reg1 <= 1'h0; // @[Debounce.scala 12:21]
    end else begin
      reg1 <= io_in; // @[Debounce.scala 13:8]
    end
    if (reset) begin // @[Debounce.scala 14:21]
      reg2 <= 1'h0; // @[Debounce.scala 14:21]
    end else begin
      reg2 <= reg1; // @[Debounce.scala 15:8]
    end
    if (detectFallingEdge) begin // @[Counter.scala 61:40]
      onems_f_c_value <= 3'h0; // @[Counter.scala 61:40]
    end else if (_onems_f_T) begin // @[Counter.scala 118:16]
      if (onems_f_wrap_wrap) begin // @[Counter.scala 87:20]
        onems_f_c_value <= 3'h0; // @[Counter.scala 87:28]
      end else begin
        onems_f_c_value <= _onems_f_wrap_value_T_1; // @[Counter.scala 77:15]
      end
    end
    if (detectRisingEdge) begin // @[Counter.scala 61:40]
      onems_r_c_value <= 3'h0; // @[Counter.scala 61:40]
    end else if (io_in) begin // @[Counter.scala 118:16]
      if (onems_r_wrap_wrap) begin // @[Counter.scala 87:20]
        onems_r_c_value <= 3'h0; // @[Counter.scala 87:28]
      end else begin
        onems_r_c_value <= _onems_r_wrap_value_T_1; // @[Counter.scala 77:15]
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
  reg1 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  reg2 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  onems_f_c_value = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  onems_r_c_value = _RAND_3[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Time(
  input        clock,
  input        reset,
  input        io_incMin,
  input        io_incSec,
  input        io_countDown,
  output [5:0] io_min,
  output [5:0] io_sec,
  output       io_zero
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [5:0] min; // @[Time.scala 21:20]
  wire [5:0] _min_T_1 = min + 6'h1; // @[Time.scala 26:17]
  wire [5:0] _GEN_0 = min == 6'h3b ? 6'h0 : _min_T_1; // @[Time.scala 23:21 24:11 26:11]
  wire [5:0] _GEN_1 = io_incMin ? _GEN_0 : min; // @[Time.scala 22:18 21:20]
  reg [5:0] sec; // @[Time.scala 30:20]
  wire [5:0] _sec_T_1 = sec + 6'h1; // @[Time.scala 35:18]
  wire [5:0] _GEN_2 = sec == 6'h3b ? 6'h0 : _sec_T_1; // @[Time.scala 32:21 33:11 35:11]
  wire [5:0] _GEN_3 = io_incSec ? _GEN_2 : sec; // @[Time.scala 31:18 30:20]
  wire  _zero_T_1 = sec == 6'h0; // @[Time.scala 41:27]
  reg  count; // @[Counter.scala 61:40]
  wire  zero = min == 6'h0 & sec == 6'h0 & ~count; // @[Time.scala 41:34]
  wire  _T_3 = io_countDown & ~zero; // @[Time.scala 39:45]
  wire  oneSec = _T_3 & count; // @[Counter.scala 118:{16,23} 117:24]
  wire [5:0] _min_T_3 = min - 6'h1; // @[Time.scala 46:20]
  wire [5:0] _sec_T_3 = sec - 6'h1; // @[Time.scala 50:18]
  assign io_min = min; // @[Time.scala 53:10]
  assign io_sec = sec; // @[Time.scala 54:10]
  assign io_zero = min == 6'h0 & sec == 6'h0 & ~count; // @[Time.scala 41:34]
  always @(posedge clock) begin
    if (reset) begin // @[Time.scala 21:20]
      min <= 6'h0; // @[Time.scala 21:20]
    end else if (io_countDown & oneSec) begin // @[Time.scala 43:31]
      if (_zero_T_1) begin // @[Time.scala 44:20]
        if (min != 6'h0) begin // @[Time.scala 45:24]
          min <= _min_T_3; // @[Time.scala 46:13]
        end else begin
          min <= _GEN_1;
        end
      end else begin
        min <= _GEN_1;
      end
    end else begin
      min <= _GEN_1;
    end
    if (reset) begin // @[Time.scala 30:20]
      sec <= 6'h0; // @[Time.scala 30:20]
    end else if (io_countDown & oneSec) begin // @[Time.scala 43:31]
      if (_zero_T_1) begin // @[Time.scala 44:20]
        if (min != 6'h0) begin // @[Time.scala 45:24]
          sec <= 6'h3b; // @[Time.scala 47:13]
        end else begin
          sec <= _GEN_3;
        end
      end else begin
        sec <= _sec_T_3; // @[Time.scala 50:11]
      end
    end else begin
      sec <= _GEN_3;
    end
    if (reset) begin // @[Counter.scala 61:40]
      count <= 1'h0; // @[Counter.scala 61:40]
    end else if (_T_3) begin // @[Counter.scala 118:16]
      count <= count + 1'h1; // @[Counter.scala 77:15]
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
  min = _RAND_0[5:0];
  _RAND_1 = {1{`RANDOM}};
  sec = _RAND_1[5:0];
  _RAND_2 = {1{`RANDOM}};
  count = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Seg7LED(
  input        clock,
  input        reset,
  input  [3:0] io_digits_0,
  input  [3:0] io_digits_1,
  input  [3:0] io_digits_2,
  input  [3:0] io_digits_3,
  input        io_blink,
  output [6:0] io_seg7led_cathodes,
  output [7:0] io_seg7led_anodes
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [16:0] digitChangeCount; // @[Counter.scala 61:40]
  wire  wrap_wrap = digitChangeCount == 17'h1869f; // @[Counter.scala 73:24]
  wire [16:0] _wrap_value_T_1 = digitChangeCount + 17'h1; // @[Counter.scala 77:24]
  reg [2:0] digitIndex; // @[Counter.scala 61:40]
  wire [2:0] _wrap_value_T_3 = digitIndex + 3'h1; // @[Counter.scala 77:24]
  wire [3:0] _GEN_6 = 3'h1 == digitIndex ? io_digits_1 : io_digits_0; // @[Seg7LED.scala 19:{15,15}]
  wire [3:0] _GEN_7 = 3'h2 == digitIndex ? io_digits_2 : _GEN_6; // @[Seg7LED.scala 19:{15,15}]
  wire [3:0] _GEN_8 = 3'h3 == digitIndex ? io_digits_3 : _GEN_7; // @[Seg7LED.scala 19:{15,15}]
  wire [3:0] _GEN_9 = 3'h4 == digitIndex ? 4'h0 : _GEN_8; // @[Seg7LED.scala 19:{15,15}]
  wire [3:0] _GEN_10 = 3'h5 == digitIndex ? 4'h0 : _GEN_9; // @[Seg7LED.scala 19:{15,15}]
  wire [3:0] _GEN_11 = 3'h6 == digitIndex ? 4'h0 : _GEN_10; // @[Seg7LED.scala 19:{15,15}]
  wire [3:0] _GEN_12 = 3'h7 == digitIndex ? 4'h0 : _GEN_11; // @[Seg7LED.scala 19:{15,15}]
  wire  _io_seg7led_cathodes_T = _GEN_12 == 4'h0; // @[Seg7LED.scala 19:15]
  wire  _io_seg7led_cathodes_T_1 = _GEN_12 == 4'h1; // @[Seg7LED.scala 20:15]
  wire  _io_seg7led_cathodes_T_2 = _GEN_12 == 4'h2; // @[Seg7LED.scala 21:15]
  wire  _io_seg7led_cathodes_T_3 = _GEN_12 == 4'h3; // @[Seg7LED.scala 22:15]
  wire  _io_seg7led_cathodes_T_4 = _GEN_12 == 4'h4; // @[Seg7LED.scala 23:15]
  wire  _io_seg7led_cathodes_T_5 = _GEN_12 == 4'h5; // @[Seg7LED.scala 24:15]
  wire  _io_seg7led_cathodes_T_6 = _GEN_12 == 4'h6; // @[Seg7LED.scala 25:15]
  wire  _io_seg7led_cathodes_T_7 = _GEN_12 == 4'h7; // @[Seg7LED.scala 26:15]
  wire  _io_seg7led_cathodes_T_8 = _GEN_12 == 4'h8; // @[Seg7LED.scala 27:15]
  wire  _io_seg7led_cathodes_T_9 = _GEN_12 == 4'h9; // @[Seg7LED.scala 28:15]
  wire  _io_seg7led_cathodes_T_10 = _GEN_12 == 4'ha; // @[Seg7LED.scala 29:15]
  wire  _io_seg7led_cathodes_T_11 = _GEN_12 == 4'hb; // @[Seg7LED.scala 30:15]
  wire  _io_seg7led_cathodes_T_12 = _GEN_12 == 4'hc; // @[Seg7LED.scala 31:15]
  wire  _io_seg7led_cathodes_T_13 = _GEN_12 == 4'hd; // @[Seg7LED.scala 32:15]
  wire  _io_seg7led_cathodes_T_14 = _GEN_12 == 4'he; // @[Seg7LED.scala 33:15]
  wire  _io_seg7led_cathodes_T_15 = _GEN_12 == 4'hf; // @[Seg7LED.scala 34:15]
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
  reg [7:0] anodes; // @[Seg7LED.scala 36:21]
  wire [7:0] _anodes_T_2 = {anodes[6:0],anodes[7]}; // @[Cat.scala 33:92]
  reg [26:0] blinkCount; // @[Counter.scala 61:40]
  wire  wrap_wrap_2 = blinkCount == 27'h5f5e0ff; // @[Counter.scala 73:24]
  wire [26:0] _wrap_value_T_5 = blinkCount + 27'h1; // @[Counter.scala 77:24]
  wire  blinkToggle = io_blink & wrap_wrap_2; // @[Counter.scala 118:{16,23} 117:24]
  reg  blinkLight; // @[Seg7LED.scala 41:25]
  wire  _GEN_17 = blinkToggle ? ~blinkLight : blinkLight; // @[Seg7LED.scala 42:20 43:16 41:25]
  assign io_seg7led_cathodes = _io_seg7led_cathodes_T ? 7'h40 : _io_seg7led_cathodes_T_30; // @[Mux.scala 101:16]
  assign io_seg7led_anodes = ~io_blink | blinkLight ? anodes : 8'hff; // @[Seg7LED.scala 45:27]
  always @(posedge clock) begin
    if (reset) begin // @[Counter.scala 61:40]
      digitChangeCount <= 17'h0; // @[Counter.scala 61:40]
    end else if (wrap_wrap) begin // @[Counter.scala 87:20]
      digitChangeCount <= 17'h0; // @[Counter.scala 87:28]
    end else begin
      digitChangeCount <= _wrap_value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      digitIndex <= 3'h0; // @[Counter.scala 61:40]
    end else if (wrap_wrap) begin // @[Counter.scala 118:16]
      digitIndex <= _wrap_value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Seg7LED.scala 36:21]
      anodes <= 8'hfe; // @[Seg7LED.scala 36:21]
    end else if (wrap_wrap) begin // @[Seg7LED.scala 37:20]
      anodes <= _anodes_T_2; // @[Seg7LED.scala 38:12]
    end
    if (reset) begin // @[Counter.scala 61:40]
      blinkCount <= 27'h0; // @[Counter.scala 61:40]
    end else if (io_blink) begin // @[Counter.scala 118:16]
      if (wrap_wrap_2) begin // @[Counter.scala 87:20]
        blinkCount <= 27'h0; // @[Counter.scala 87:28]
      end else begin
        blinkCount <= _wrap_value_T_5; // @[Counter.scala 77:15]
      end
    end
    blinkLight <= reset | _GEN_17; // @[Seg7LED.scala 41:{25,25}]
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
  digitChangeCount = _RAND_0[16:0];
  _RAND_1 = {1{`RANDOM}};
  digitIndex = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  anodes = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  blinkCount = _RAND_3[26:0];
  _RAND_4 = {1{`RANDOM}};
  blinkLight = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module KitchenTimer(
  input        clock,
  input        reset,
  input        io_min,
  input        io_sec,
  input        io_startStop,
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
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  reg1_debounce_clock; // @[Debounce.scala 40:26]
  wire  reg1_debounce_reset; // @[Debounce.scala 40:26]
  wire  reg1_debounce_io_in; // @[Debounce.scala 40:26]
  wire  reg1_debounce_io_out; // @[Debounce.scala 40:26]
  wire  min_reg1_debounce_clock; // @[Debounce.scala 40:26]
  wire  min_reg1_debounce_reset; // @[Debounce.scala 40:26]
  wire  min_reg1_debounce_io_in; // @[Debounce.scala 40:26]
  wire  min_reg1_debounce_io_out; // @[Debounce.scala 40:26]
  wire  sec_reg1_debounce_clock; // @[Debounce.scala 40:26]
  wire  sec_reg1_debounce_reset; // @[Debounce.scala 40:26]
  wire  sec_reg1_debounce_io_in; // @[Debounce.scala 40:26]
  wire  sec_reg1_debounce_io_out; // @[Debounce.scala 40:26]
  wire  time__clock; // @[KitchenTimer.scala 39:18]
  wire  time__reset; // @[KitchenTimer.scala 39:18]
  wire  time__io_incMin; // @[KitchenTimer.scala 39:18]
  wire  time__io_incSec; // @[KitchenTimer.scala 39:18]
  wire  time__io_countDown; // @[KitchenTimer.scala 39:18]
  wire [5:0] time__io_min; // @[KitchenTimer.scala 39:18]
  wire [5:0] time__io_sec; // @[KitchenTimer.scala 39:18]
  wire  time__io_zero; // @[KitchenTimer.scala 39:18]
  wire  seg7LED_clock; // @[KitchenTimer.scala 65:23]
  wire  seg7LED_reset; // @[KitchenTimer.scala 65:23]
  wire [3:0] seg7LED_io_digits_0; // @[KitchenTimer.scala 65:23]
  wire [3:0] seg7LED_io_digits_1; // @[KitchenTimer.scala 65:23]
  wire [3:0] seg7LED_io_digits_2; // @[KitchenTimer.scala 65:23]
  wire [3:0] seg7LED_io_digits_3; // @[KitchenTimer.scala 65:23]
  wire  seg7LED_io_blink; // @[KitchenTimer.scala 65:23]
  wire [6:0] seg7LED_io_seg7led_cathodes; // @[KitchenTimer.scala 65:23]
  wire [7:0] seg7LED_io_seg7led_anodes; // @[KitchenTimer.scala 65:23]
  reg [1:0] state; // @[KitchenTimer.scala 17:22]
  reg  reg1; // @[KitchenTimer.scala 20:21]
  reg  reg2; // @[KitchenTimer.scala 21:21]
  wire  stateChange = ~reg1 & reg2; // @[KitchenTimer.scala 24:37]
  reg  min_reg1; // @[KitchenTimer.scala 27:25]
  reg  min_reg2; // @[KitchenTimer.scala 28:25]
  wire  minChange = ~min_reg1 & min_reg2; // @[KitchenTimer.scala 31:39]
  reg  sec_reg1; // @[KitchenTimer.scala 33:25]
  reg  sec_reg2; // @[KitchenTimer.scala 34:25]
  wire  secChange = ~sec_reg1 & sec_reg2; // @[KitchenTimer.scala 37:39]
  wire  _time_io_incMin_T_2 = state == 2'h0 | state == 2'h2; // @[KitchenTimer.scala 40:39]
  wire  _time_io_countDown_T = state == 2'h1; // @[KitchenTimer.scala 42:28]
  wire [1:0] _GEN_1 = 2'h3 == state ? 2'h0 : state; // @[KitchenTimer.scala 45:18 59:15 17:22]
  wire [1:0] _GEN_2 = 2'h2 == state ? 2'h1 : _GEN_1; // @[KitchenTimer.scala 45:18 56:15]
  wire [5:0] _T_8 = time__io_sec / 4'ha; // @[KitchenTimer.scala 67:18]
  wire [5:0] _T_11 = time__io_min / 4'ha; // @[KitchenTimer.scala 69:18]
  wire [5:0] _GEN_7 = time__io_sec % 6'ha; // @[KitchenTimer.scala 66:49]
  wire [5:0] _GEN_8 = time__io_min % 6'ha; // @[KitchenTimer.scala 68:17]
  Debounce reg1_debounce ( // @[Debounce.scala 40:26]
    .clock(reg1_debounce_clock),
    .reset(reg1_debounce_reset),
    .io_in(reg1_debounce_io_in),
    .io_out(reg1_debounce_io_out)
  );
  Debounce min_reg1_debounce ( // @[Debounce.scala 40:26]
    .clock(min_reg1_debounce_clock),
    .reset(min_reg1_debounce_reset),
    .io_in(min_reg1_debounce_io_in),
    .io_out(min_reg1_debounce_io_out)
  );
  Debounce sec_reg1_debounce ( // @[Debounce.scala 40:26]
    .clock(sec_reg1_debounce_clock),
    .reset(sec_reg1_debounce_reset),
    .io_in(sec_reg1_debounce_io_in),
    .io_out(sec_reg1_debounce_io_out)
  );
  Time time_ ( // @[KitchenTimer.scala 39:18]
    .clock(time__clock),
    .reset(time__reset),
    .io_incMin(time__io_incMin),
    .io_incSec(time__io_incSec),
    .io_countDown(time__io_countDown),
    .io_min(time__io_min),
    .io_sec(time__io_sec),
    .io_zero(time__io_zero)
  );
  Seg7LED seg7LED ( // @[KitchenTimer.scala 65:23]
    .clock(seg7LED_clock),
    .reset(seg7LED_reset),
    .io_digits_0(seg7LED_io_digits_0),
    .io_digits_1(seg7LED_io_digits_1),
    .io_digits_2(seg7LED_io_digits_2),
    .io_digits_3(seg7LED_io_digits_3),
    .io_blink(seg7LED_io_blink),
    .io_seg7led_cathodes(seg7LED_io_seg7led_cathodes),
    .io_seg7led_anodes(seg7LED_io_seg7led_anodes)
  );
  assign io_seg7led_cathodes = seg7LED_io_seg7led_cathodes; // @[KitchenTimer.scala 72:14]
  assign io_seg7led_decimalPoint = 1'h1; // @[KitchenTimer.scala 72:14]
  assign io_seg7led_anodes = seg7LED_io_seg7led_anodes; // @[KitchenTimer.scala 72:14]
  assign reg1_debounce_clock = clock;
  assign reg1_debounce_reset = reset;
  assign reg1_debounce_io_in = io_startStop; // @[Debounce.scala 41:20]
  assign min_reg1_debounce_clock = clock;
  assign min_reg1_debounce_reset = reset;
  assign min_reg1_debounce_io_in = io_min; // @[Debounce.scala 41:20]
  assign sec_reg1_debounce_clock = clock;
  assign sec_reg1_debounce_reset = reset;
  assign sec_reg1_debounce_io_in = io_sec; // @[Debounce.scala 41:20]
  assign time__clock = clock;
  assign time__reset = reset;
  assign time__io_incMin = (state == 2'h0 | state == 2'h2) & minChange; // @[KitchenTimer.scala 40:58]
  assign time__io_incSec = _time_io_incMin_T_2 & secChange; // @[KitchenTimer.scala 41:58]
  assign time__io_countDown = state == 2'h1; // @[KitchenTimer.scala 42:28]
  assign seg7LED_clock = clock;
  assign seg7LED_reset = reset;
  assign seg7LED_io_digits_0 = _GEN_7[3:0]; // @[KitchenTimer.scala 66:49]
  assign seg7LED_io_digits_1 = _T_8[3:0]; // @[KitchenTimer.scala 67:25]
  assign seg7LED_io_digits_2 = _GEN_8[3:0]; // @[KitchenTimer.scala 68:17]
  assign seg7LED_io_digits_3 = _T_11[3:0]; // @[KitchenTimer.scala 69:25]
  assign seg7LED_io_blink = state == 2'h3; // @[KitchenTimer.scala 71:28]
  always @(posedge clock) begin
    if (reset) begin // @[KitchenTimer.scala 17:22]
      state <= 2'h0; // @[KitchenTimer.scala 17:22]
    end else if (stateChange) begin // @[KitchenTimer.scala 44:20]
      if (2'h0 == state) begin // @[KitchenTimer.scala 45:18]
        if (~time__io_zero) begin // @[KitchenTimer.scala 47:28]
          state <= 2'h1; // @[KitchenTimer.scala 48:17]
        end
      end else if (2'h1 == state) begin // @[KitchenTimer.scala 45:18]
        state <= 2'h2; // @[KitchenTimer.scala 52:15]
      end else begin
        state <= _GEN_2;
      end
    end else if (_time_io_countDown_T & time__io_zero) begin // @[KitchenTimer.scala 62:43]
      state <= 2'h3; // @[KitchenTimer.scala 63:11]
    end
    reg1 <= reset | reg1_debounce_io_out; // @[KitchenTimer.scala 20:{21,21} 22:8]
    reg2 <= reset | reg1; // @[KitchenTimer.scala 21:{21,21} 23:8]
    min_reg1 <= reset | min_reg1_debounce_io_out; // @[KitchenTimer.scala 27:{25,25} 29:12]
    min_reg2 <= reset | min_reg1; // @[KitchenTimer.scala 28:{25,25} 30:12]
    sec_reg1 <= reset | sec_reg1_debounce_io_out; // @[KitchenTimer.scala 33:{25,25} 35:12]
    sec_reg2 <= reset | sec_reg1; // @[KitchenTimer.scala 34:{25,25} 36:12]
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
  state = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  reg1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  reg2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  min_reg1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  min_reg2 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  sec_reg1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  sec_reg2 = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
