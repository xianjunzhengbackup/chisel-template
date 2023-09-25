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
  wire  sr_latch_io_set; // @[Debounce.scala 24:24]
  wire  sr_latch_io_reset; // @[Debounce.scala 24:24]
  wire  sr_latch_io_q; // @[Debounce.scala 24:24]
  wire  sr_latch_io_notQ; // @[Debounce.scala 24:24]
  reg  reg1; // @[Debounce.scala 12:21]
  reg  reg2; // @[Debounce.scala 14:21]
  wire  detectFallingEdge = ~reg1 & reg2; // @[Debounce.scala 16:34]
  wire  detectRisingEdge = ~reg2 & reg1; // @[Debounce.scala 17:33]
  wire  _onems_f_T = ~io_in; // @[Debounce.scala 19:18]
  reg [2:0] onems_f_c_value; // @[Counter.scala 61:40]
  wire  onems_f_wrap_wrap = onems_f_c_value == 3'h4; // @[Counter.scala 73:24]
  wire [2:0] _onems_f_wrap_value_T_1 = onems_f_c_value + 3'h1; // @[Counter.scala 77:24]
  reg [2:0] onems_r_c_value; // @[Counter.scala 61:40]
  wire  onems_r_wrap_wrap = onems_r_c_value == 3'h4; // @[Counter.scala 73:24]
  wire [2:0] _onems_r_wrap_value_T_1 = onems_r_c_value + 3'h1; // @[Counter.scala 77:24]
  SRLatch sr_latch ( // @[Debounce.scala 24:24]
    .io_set(sr_latch_io_set),
    .io_reset(sr_latch_io_reset),
    .io_q(sr_latch_io_q),
    .io_notQ(sr_latch_io_notQ)
  );
  assign io_out = sr_latch_io_q; // @[Debounce.scala 27:10]
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
