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
