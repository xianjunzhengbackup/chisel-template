module Seg7LED1Digit(
  input  [3:0] io_num,
  output [6:0] io_seg7led_cathodes
);
  wire  _io_seg7led_cathodes_T = io_num == 4'h0; // @[Seg7LED.scala 34:12]
  wire  _io_seg7led_cathodes_T_1 = io_num == 4'h1; // @[Seg7LED.scala 35:12]
  wire  _io_seg7led_cathodes_T_2 = io_num == 4'h2; // @[Seg7LED.scala 36:12]
  wire  _io_seg7led_cathodes_T_3 = io_num == 4'h3; // @[Seg7LED.scala 37:12]
  wire  _io_seg7led_cathodes_T_4 = io_num == 4'h4; // @[Seg7LED.scala 38:12]
  wire  _io_seg7led_cathodes_T_5 = io_num == 4'h5; // @[Seg7LED.scala 39:12]
  wire  _io_seg7led_cathodes_T_6 = io_num == 4'h6; // @[Seg7LED.scala 40:12]
  wire  _io_seg7led_cathodes_T_7 = io_num == 4'h7; // @[Seg7LED.scala 41:12]
  wire  _io_seg7led_cathodes_T_8 = io_num == 4'h8; // @[Seg7LED.scala 42:12]
  wire  _io_seg7led_cathodes_T_9 = io_num == 4'h9; // @[Seg7LED.scala 43:12]
  wire  _io_seg7led_cathodes_T_10 = io_num == 4'ha; // @[Seg7LED.scala 44:12]
  wire  _io_seg7led_cathodes_T_11 = io_num == 4'hb; // @[Seg7LED.scala 45:12]
  wire  _io_seg7led_cathodes_T_12 = io_num == 4'hc; // @[Seg7LED.scala 46:12]
  wire  _io_seg7led_cathodes_T_13 = io_num == 4'hd; // @[Seg7LED.scala 47:12]
  wire  _io_seg7led_cathodes_T_14 = io_num == 4'he; // @[Seg7LED.scala 48:12]
  wire  _io_seg7led_cathodes_T_15 = io_num == 4'hf; // @[Seg7LED.scala 49:12]
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
module Counter31Bit(
  input        clock,
  input        reset,
  output [6:0] io_seg7led_cathodes,
  output       io_seg7led_decimalPoint,
  output [7:0] io_seg7led_anodes
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] seg7LED1Digit_io_num; // @[Counting.scala 23:29]
  wire [6:0] seg7LED1Digit_io_seg7led_cathodes; // @[Counting.scala 23:29]
  reg [30:0] count; // @[Counting.scala 20:22]
  wire [30:0] _count_T_1 = count + 31'h1; // @[Counting.scala 21:18]
  Seg7LED1Digit seg7LED1Digit ( // @[Counting.scala 23:29]
    .io_num(seg7LED1Digit_io_num),
    .io_seg7led_cathodes(seg7LED1Digit_io_seg7led_cathodes)
  );
  assign io_seg7led_cathodes = seg7LED1Digit_io_seg7led_cathodes; // @[Counting.scala 25:14]
  assign io_seg7led_decimalPoint = 1'h1; // @[Counting.scala 25:14]
  assign io_seg7led_anodes = 8'hfe; // @[Counting.scala 25:14]
  assign seg7LED1Digit_io_num = count[30:27]; // @[Counting.scala 24:32]
  always @(posedge clock) begin
    if (reset) begin // @[Counting.scala 20:22]
      count <= 31'h0; // @[Counting.scala 20:22]
    end else begin
      count <= _count_T_1; // @[Counting.scala 21:9]
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
  count = _RAND_0[30:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
