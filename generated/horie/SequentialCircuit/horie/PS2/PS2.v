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
  wire  receiveBuffer_clock; // @[PS2.scala 45:52]
  wire  receiveBuffer_reset; // @[PS2.scala 45:52]
  wire  receiveBuffer_io_shiftIn; // @[PS2.scala 45:52]
  wire  receiveBuffer_io_enable; // @[PS2.scala 45:52]
  wire [7:0] receiveBuffer_io_q; // @[PS2.scala 45:52]
  reg  reg1; // @[PS2.scala 20:21]
  reg  reg2; // @[PS2.scala 21:21]
  wire  stateChange = reg2 & ~reg1; // @[PS2.scala 22:37]
  reg [1:0] state; // @[PS2.scala 24:22]
  wire  _T_1 = state == 2'h1; // @[PS2.scala 26:18]
  reg [2:0] receiveCount; // @[Counter.scala 61:40]
  wire  wrap_wrap = receiveCount == 3'h7; // @[Counter.scala 73:24]
  wire [2:0] _wrap_value_T_1 = receiveCount + 3'h1; // @[Counter.scala 77:24]
  wire  receiveFinish = _T_1 & wrap_wrap; // @[Counter.scala 118:{16,23} 117:24]
  wire [1:0] _GEN_2 = receiveFinish ? 2'h2 : state; // @[PS2.scala 24:22 35:38 36:27]
  wire [1:0] _GEN_3 = 2'h2 == state ? 2'h0 : state; // @[PS2.scala 24:22 29:22 40:25]
  ShiftRegisterSIPO receiveBuffer ( // @[PS2.scala 45:52]
    .clock(receiveBuffer_clock),
    .reset(receiveBuffer_reset),
    .io_shiftIn(receiveBuffer_io_shiftIn),
    .io_enable(receiveBuffer_io_enable),
    .io_q(receiveBuffer_io_q)
  );
  assign io_ps2Out = receiveBuffer_io_q; // @[PS2.scala 48:13]
  assign receiveBuffer_clock = io_ps2Clk; // @[PS2.scala 45:37]
  assign receiveBuffer_reset = reset;
  assign receiveBuffer_io_shiftIn = io_ps2Data; // @[PS2.scala 46:28]
  assign receiveBuffer_io_enable = state == 2'h1; // @[PS2.scala 47:34]
  always @(posedge clock) begin
    reg1 <= io_ps2Clk; // @[PS2.scala 20:21]
    reg2 <= reg1; // @[PS2.scala 21:21]
    if (reset) begin // @[PS2.scala 24:22]
      state <= 2'h0; // @[PS2.scala 24:22]
    end else if (stateChange) begin // @[PS2.scala 28:20]
      if (2'h0 == state) begin // @[PS2.scala 29:22]
        state <= 2'h1; // @[PS2.scala 31:25]
      end else if (2'h1 == state) begin // @[PS2.scala 29:22]
        state <= _GEN_2;
      end else begin
        state <= _GEN_3;
      end
    end
  end
  always @(posedge io_ps2Clk) begin
    if (reset) begin // @[Counter.scala 61:40]
      receiveCount <= 3'h0; // @[Counter.scala 61:40]
    end else if (_T_1) begin // @[Counter.scala 118:16]
      receiveCount <= _wrap_value_T_1; // @[Counter.scala 77:15]
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
  receiveCount = _RAND_3[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
