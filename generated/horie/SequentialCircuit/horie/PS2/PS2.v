module ShiftRegisterSIPO(
  input        clock,
  input        reset,
  input        io_shiftIn,
  input        io_enable,
  output [7:0] io_q
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] regs; // @[ShiftRegisterSIPO.scala 21:21]
  wire [7:0] _regs_T_1 = {regs[6:0],io_shiftIn}; // @[ShiftRegisterSIPO.scala 23:27]
  assign io_q = regs; // @[ShiftRegisterSIPO.scala 25:8]
  always @(posedge clock) begin
    if (reset) begin // @[ShiftRegisterSIPO.scala 21:21]
      regs <= 8'h0; // @[ShiftRegisterSIPO.scala 21:21]
    end else if (io_enable) begin // @[ShiftRegisterSIPO.scala 22:18]
      regs <= _regs_T_1; // @[ShiftRegisterSIPO.scala 23:10]
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
  regs = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PS2(
  input        clock,
  input        reset,
  input        io_ps2Data,
  input        io_ps2Clk,
  output [7:0] io_ps2Out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  receiveBuffer_clock; // @[PS2.scala 58:11]
  wire  receiveBuffer_reset; // @[PS2.scala 58:11]
  wire  receiveBuffer_io_shiftIn; // @[PS2.scala 58:11]
  wire  receiveBuffer_io_enable; // @[PS2.scala 58:11]
  wire [7:0] receiveBuffer_io_q; // @[PS2.scala 58:11]
  reg  reg1; // @[PS2.scala 24:21]
  reg  reg2; // @[PS2.scala 25:21]
  wire  stateChange = reg2 & ~reg1; // @[PS2.scala 26:39]
  reg [1:0] state; // @[PS2.scala 29:22]
  reg [3:0] receiveCount; // @[PS2.scala 33:29]
  wire [3:0] _receiveCount_T_1 = receiveCount + 4'h1; // @[PS2.scala 44:51]
  wire [1:0] _GEN_0 = receiveCount == 4'h7 ? 2'h2 : state; // @[PS2.scala 41:34 42:17 29:22]
  wire [3:0] _GEN_1 = receiveCount == 4'h7 ? 4'h0 : _receiveCount_T_1; // @[PS2.scala 41:34 43:24 44:35]
  wire [1:0] _GEN_2 = 2'h3 == state ? 2'h0 : state; // @[PS2.scala 35:19 52:15 29:22]
  wire [3:0] _GEN_3 = 2'h3 == state ? 4'h0 : receiveCount; // @[PS2.scala 35:19 53:22 33:29]
  wire [1:0] _GEN_4 = 2'h2 == state ? 2'h3 : _GEN_2; // @[PS2.scala 35:19 48:15]
  wire [3:0] _GEN_5 = 2'h2 == state ? 4'h0 : _GEN_3; // @[PS2.scala 35:19 49:22]
  ShiftRegisterSIPO receiveBuffer ( // @[PS2.scala 58:11]
    .clock(receiveBuffer_clock),
    .reset(receiveBuffer_reset),
    .io_shiftIn(receiveBuffer_io_shiftIn),
    .io_enable(receiveBuffer_io_enable),
    .io_q(receiveBuffer_io_q)
  );
  assign io_ps2Out = receiveBuffer_io_q; // @[PS2.scala 62:13]
  assign receiveBuffer_clock = ~io_ps2Clk; // @[PS2.scala 57:40]
  assign receiveBuffer_reset = reset;
  assign receiveBuffer_io_shiftIn = io_ps2Data; // @[PS2.scala 60:28]
  assign receiveBuffer_io_enable = state == 2'h1; // @[PS2.scala 61:36]
  always @(posedge clock) begin
    reg1 <= io_ps2Clk; // @[PS2.scala 24:21]
    reg2 <= reg1; // @[PS2.scala 25:21]
    if (reset) begin // @[PS2.scala 29:22]
      state <= 2'h0; // @[PS2.scala 29:22]
    end else if (stateChange) begin // @[PS2.scala 34:21]
      if (2'h0 == state) begin // @[PS2.scala 35:19]
        state <= 2'h1; // @[PS2.scala 37:15]
      end else if (2'h1 == state) begin // @[PS2.scala 35:19]
        state <= _GEN_0;
      end else begin
        state <= _GEN_4;
      end
    end
    if (reset) begin // @[PS2.scala 33:29]
      receiveCount <= 4'h0; // @[PS2.scala 33:29]
    end else if (stateChange) begin // @[PS2.scala 34:21]
      if (2'h0 == state) begin // @[PS2.scala 35:19]
        receiveCount <= 4'h0; // @[PS2.scala 38:22]
      end else if (2'h1 == state) begin // @[PS2.scala 35:19]
        receiveCount <= _GEN_1;
      end else begin
        receiveCount <= _GEN_5;
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
  state = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  receiveCount = _RAND_3[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
