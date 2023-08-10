module REG2(
  input        clock,
  input        reset,
  input  [7:0] io_a,
  input        io_en,
  output       io_c
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] reg0_0; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 393:25]
  reg [7:0] reg0_1; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 393:25]
  reg [7:0] reg1_0; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 394:25]
  reg [7:0] reg1_1; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 394:25]
  reg [7:0] reg2_0; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 395:25]
  reg [7:0] reg2_1; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 395:25]
  reg [7:0] reg3_0; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 396:21]
  reg [7:0] reg3_1; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 396:21]
  reg [7:0] reg4_0; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 397:21]
  reg [7:0] reg4_1; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 397:21]
  wire [7:0] _reg5_T_1 = io_a + 8'h1; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 398:41]
  reg [7:0] reg5_0; // @[Reg.scala 35:20]
  reg [7:0] reg5_1; // @[Reg.scala 35:20]
  wire [7:0] _reg6_T_1 = io_a - 8'h1; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 399:41]
  reg [7:0] reg6_0; // @[Reg.scala 19:16]
  reg [7:0] reg6_1; // @[Reg.scala 19:16]
  reg [7:0] reg7_r__0; // @[Reg.scala 35:20]
  reg [7:0] reg7_r__1; // @[Reg.scala 35:20]
  reg [7:0] reg7_r_1_0; // @[Reg.scala 35:20]
  reg [7:0] reg7_r_1_1; // @[Reg.scala 35:20]
  reg [7:0] reg7_0; // @[Reg.scala 35:20]
  reg [7:0] reg7_1; // @[Reg.scala 35:20]
  reg [7:0] reg8_r__0; // @[Reg.scala 19:16]
  reg [7:0] reg8_r__1; // @[Reg.scala 19:16]
  reg [7:0] reg8_r_1_0; // @[Reg.scala 19:16]
  reg [7:0] reg8_r_1_1; // @[Reg.scala 19:16]
  reg [7:0] reg8_0; // @[Reg.scala 19:16]
  reg [7:0] reg8_1; // @[Reg.scala 19:16]
  wire  _reg2_0_T = &io_a; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 403:23]
  wire  _reg3_0_T = |io_a; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 405:23]
  wire  _GEN_16 = reset ? 1'h0 : 1'h1; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 408:26 409:17 412:17]
  wire  _io_c_T_18 = reg0_0[0] & reg1_0[0] & reg2_0[0] & reg3_0[0] & reg4_0[0] & reg5_0[0] & reg6_0[0] & reg7_0[0] &
    reg8_0[0] & reg0_1[0]; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 416:130]
  assign io_c = _io_c_T_18 & reg1_1[0] & reg2_1[0] & reg3_1[0] & reg4_1[0] & reg5_1[0] & reg6_1[0] & reg7_1[0] & reg8_1[
    0]; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 417:117]
  always @(posedge clock) begin
    reg0_0 <= io_a; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 393:{33,33}]
    reg0_1 <= io_a; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 393:{33,33}]
    if (reset) begin // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 394:25]
      reg1_0 <= 8'h0; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 394:25]
    end else begin
      reg1_0 <= io_a; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 394:25]
    end
    if (reset) begin // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 394:25]
      reg1_1 <= 8'h0; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 394:25]
    end else begin
      reg1_1 <= io_a; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 394:25]
    end
    if (reset) begin // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 395:25]
      reg2_0 <= 8'h0; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 395:25]
    end else begin
      reg2_0 <= {{7'd0}, &io_a}; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 403:15]
    end
    if (reset) begin // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 395:25]
      reg2_1 <= 8'h0; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 395:25]
    end else begin
      reg2_1 <= {{7'd0}, _reg2_0_T}; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 404:15]
    end
    reg3_0 <= {{7'd0}, |io_a}; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 405:15]
    reg3_1 <= {{7'd0}, _reg3_0_T}; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 406:15]
    reg4_0 <= {{7'd0}, _GEN_16};
    reg4_1 <= {{7'd0}, _GEN_16};
    if (reset) begin // @[Reg.scala 35:20]
      reg5_0 <= 8'h0; // @[Reg.scala 35:20]
    end else if (io_en) begin // @[Reg.scala 36:18]
      reg5_0 <= _reg5_T_1; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      reg5_1 <= 8'h0; // @[Reg.scala 35:20]
    end else if (io_en) begin // @[Reg.scala 36:18]
      reg5_1 <= _reg5_T_1; // @[Reg.scala 36:22]
    end
    if (io_en) begin // @[Reg.scala 20:18]
      reg6_0 <= _reg6_T_1; // @[Reg.scala 20:22]
    end
    if (io_en) begin // @[Reg.scala 20:18]
      reg6_1 <= _reg6_T_1; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      reg7_r__0 <= 8'h0; // @[Reg.scala 35:20]
    end else if (io_en) begin // @[Reg.scala 36:18]
      reg7_r__0 <= io_a; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      reg7_r__1 <= 8'h0; // @[Reg.scala 35:20]
    end else if (io_en) begin // @[Reg.scala 36:18]
      reg7_r__1 <= io_a; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      reg7_r_1_0 <= 8'h0; // @[Reg.scala 35:20]
    end else if (io_en) begin // @[Reg.scala 36:18]
      reg7_r_1_0 <= reg7_r__0; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      reg7_r_1_1 <= 8'h0; // @[Reg.scala 35:20]
    end else if (io_en) begin // @[Reg.scala 36:18]
      reg7_r_1_1 <= reg7_r__1; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      reg7_0 <= 8'h0; // @[Reg.scala 35:20]
    end else if (io_en) begin // @[Reg.scala 36:18]
      reg7_0 <= reg7_r_1_0; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      reg7_1 <= 8'h0; // @[Reg.scala 35:20]
    end else if (io_en) begin // @[Reg.scala 36:18]
      reg7_1 <= reg7_r_1_1; // @[Reg.scala 36:22]
    end
    if (io_en) begin // @[Reg.scala 20:18]
      reg8_r__0 <= io_a; // @[Reg.scala 20:22]
    end
    if (io_en) begin // @[Reg.scala 20:18]
      reg8_r__1 <= io_a; // @[Reg.scala 20:22]
    end
    if (io_en) begin // @[Reg.scala 20:18]
      reg8_r_1_0 <= reg8_r__0; // @[Reg.scala 20:22]
    end
    if (io_en) begin // @[Reg.scala 20:18]
      reg8_r_1_1 <= reg8_r__1; // @[Reg.scala 20:22]
    end
    if (io_en) begin // @[Reg.scala 20:18]
      reg8_0 <= reg8_r_1_0; // @[Reg.scala 20:22]
    end
    if (io_en) begin // @[Reg.scala 20:18]
      reg8_1 <= reg8_r_1_1; // @[Reg.scala 20:22]
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
  reg0_0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  reg0_1 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  reg1_0 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  reg1_1 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  reg2_0 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  reg2_1 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  reg3_0 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  reg3_1 = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  reg4_0 = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  reg4_1 = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  reg5_0 = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  reg5_1 = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  reg6_0 = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  reg6_1 = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  reg7_r__0 = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  reg7_r__1 = _RAND_15[7:0];
  _RAND_16 = {1{`RANDOM}};
  reg7_r_1_0 = _RAND_16[7:0];
  _RAND_17 = {1{`RANDOM}};
  reg7_r_1_1 = _RAND_17[7:0];
  _RAND_18 = {1{`RANDOM}};
  reg7_0 = _RAND_18[7:0];
  _RAND_19 = {1{`RANDOM}};
  reg7_1 = _RAND_19[7:0];
  _RAND_20 = {1{`RANDOM}};
  reg8_r__0 = _RAND_20[7:0];
  _RAND_21 = {1{`RANDOM}};
  reg8_r__1 = _RAND_21[7:0];
  _RAND_22 = {1{`RANDOM}};
  reg8_r_1_0 = _RAND_22[7:0];
  _RAND_23 = {1{`RANDOM}};
  reg8_r_1_1 = _RAND_23[7:0];
  _RAND_24 = {1{`RANDOM}};
  reg8_0 = _RAND_24[7:0];
  _RAND_25 = {1{`RANDOM}};
  reg8_1 = _RAND_25[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
