module Seg7LED1Digit(
  input  [3:0] io_num,
  output [6:0] io_seg7led_cathodes
);
  wire  _io_seg7led_cathodes_T = io_num == 4'h0; // @[Seg7LED.scala 19:15]
  wire  _io_seg7led_cathodes_T_1 = io_num == 4'h1; // @[Seg7LED.scala 20:15]
  wire  _io_seg7led_cathodes_T_2 = io_num == 4'h2; // @[Seg7LED.scala 21:15]
  wire  _io_seg7led_cathodes_T_3 = io_num == 4'h3; // @[Seg7LED.scala 22:15]
  wire  _io_seg7led_cathodes_T_4 = io_num == 4'h4; // @[Seg7LED.scala 23:15]
  wire  _io_seg7led_cathodes_T_5 = io_num == 4'h5; // @[Seg7LED.scala 24:15]
  wire  _io_seg7led_cathodes_T_6 = io_num == 4'h6; // @[Seg7LED.scala 25:15]
  wire  _io_seg7led_cathodes_T_7 = io_num == 4'h7; // @[Seg7LED.scala 26:15]
  wire  _io_seg7led_cathodes_T_8 = io_num == 4'h8; // @[Seg7LED.scala 27:15]
  wire  _io_seg7led_cathodes_T_9 = io_num == 4'h9; // @[Seg7LED.scala 28:15]
  wire  _io_seg7led_cathodes_T_10 = io_num == 4'ha; // @[Seg7LED.scala 29:15]
  wire  _io_seg7led_cathodes_T_11 = io_num == 4'hb; // @[Seg7LED.scala 30:15]
  wire  _io_seg7led_cathodes_T_12 = io_num == 4'hc; // @[Seg7LED.scala 31:15]
  wire  _io_seg7led_cathodes_T_13 = io_num == 4'hd; // @[Seg7LED.scala 32:15]
  wire  _io_seg7led_cathodes_T_14 = io_num == 4'he; // @[Seg7LED.scala 33:15]
  wire  _io_seg7led_cathodes_T_15 = io_num == 4'hf; // @[Seg7LED.scala 34:15]
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
  assign io_seg7led_cathodes = _io_seg7led_cathodes_T ? 7'h40 : _io_seg7led_cathodes_T_30; // @[Mux.scala 101:16]
endmodule
module ClockSec1Digit(
  input        clock,
  input        reset,
  output [6:0] io_seg7led_cathodes,
  output       io_seg7led_decimalPoint,
  output [7:0] io_seg7led_anodes
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] seg_io_num; // @[ClockSec1Digit.scala 24:19]
  wire [6:0] seg_io_seg7led_cathodes; // @[ClockSec1Digit.scala 24:19]
  reg [23:0] reg24Bit; // @[ClockSec1Digit.scala 13:25]
  reg [3:0] reg4Bit; // @[ClockSec1Digit.scala 14:24]
  wire [3:0] _reg4Bit_T_1 = reg4Bit + 4'h1; // @[ClockSec1Digit.scala 17:24]
  wire [23:0] _reg24Bit_T_1 = reg24Bit + 24'h1; // @[ClockSec1Digit.scala 21:26]
  Seg7LED1Digit seg ( // @[ClockSec1Digit.scala 24:19]
    .io_num(seg_io_num),
    .io_seg7led_cathodes(seg_io_seg7led_cathodes)
  );
  assign io_seg7led_cathodes = seg_io_seg7led_cathodes; // @[ClockSec1Digit.scala 26:14]
  assign io_seg7led_decimalPoint = 1'h1; // @[ClockSec1Digit.scala 26:14]
  assign io_seg7led_anodes = 8'hfe; // @[ClockSec1Digit.scala 26:14]
  assign seg_io_num = reg4Bit; // @[ClockSec1Digit.scala 25:14]
  always @(posedge clock) begin
    if (reset) begin // @[ClockSec1Digit.scala 13:25]
      reg24Bit <= 24'h0; // @[ClockSec1Digit.scala 13:25]
    end else if (reg24Bit == 24'ha) begin // @[ClockSec1Digit.scala 16:29]
      reg24Bit <= 24'h0; // @[ClockSec1Digit.scala 18:14]
    end else begin
      reg24Bit <= _reg24Bit_T_1; // @[ClockSec1Digit.scala 21:14]
    end
    if (reset) begin // @[ClockSec1Digit.scala 14:24]
      reg4Bit <= 4'h0; // @[ClockSec1Digit.scala 14:24]
    end else if (reg24Bit == 24'ha) begin // @[ClockSec1Digit.scala 16:29]
      reg4Bit <= _reg4Bit_T_1; // @[ClockSec1Digit.scala 17:13]
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
  reg24Bit = _RAND_0[23:0];
  _RAND_1 = {1{`RANDOM}};
  reg4Bit = _RAND_1[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
