module REG(
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
`endif // RANDOMIZE_REG_INIT
  reg [7:0] reg0; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 222:25]
  reg [7:0] reg1; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 223:25]
  reg [7:0] reg2; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 224:25]
  reg [7:0] reg3; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 225:21]
  reg [7:0] reg4; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 226:21]
  wire [7:0] _reg5_T_1 = io_a + 8'h1; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 227:33]
  reg [7:0] reg5; // @[Reg.scala 35:20]
  wire [7:0] _reg6_T_1 = io_a - 8'h1; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 228:33]
  reg [7:0] reg6; // @[Reg.scala 19:16]
  reg [7:0] reg7_r; // @[Reg.scala 35:20]
  reg [7:0] reg7_r_1; // @[Reg.scala 35:20]
  reg [7:0] reg7; // @[Reg.scala 35:20]
  reg [7:0] reg8_r; // @[Reg.scala 19:16]
  reg [7:0] reg8_r_1; // @[Reg.scala 19:16]
  reg [7:0] reg8; // @[Reg.scala 19:16]
  wire  _GEN_8 = reset ? 1'h0 : 1'h1; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 235:26 236:14 238:14]
  assign io_c = reg0[0] & reg1[0] & reg2[0] & reg3[0] & reg4[0] & reg5[0] & reg6[0] & reg7[0] & reg8[0]; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 241:93]
  always @(posedge clock) begin
    reg0 <= io_a; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 222:25]
    if (reset) begin // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 223:25]
      reg1 <= 8'h0; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 223:25]
    end else begin
      reg1 <= io_a; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 223:25]
    end
    if (reset) begin // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 224:25]
      reg2 <= 8'h0; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 224:25]
    end else begin
      reg2 <= {{7'd0}, &io_a}; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 232:12]
    end
    reg3 <= {{7'd0}, |io_a}; // @[chapter3_\u6A21\u5757\u4E0E\u786C\u4EF6\u7C7B\u578B.scala 233:12]
    reg4 <= {{7'd0}, _GEN_8};
    if (reset) begin // @[Reg.scala 35:20]
      reg5 <= 8'h0; // @[Reg.scala 35:20]
    end else if (io_en) begin // @[Reg.scala 36:18]
      reg5 <= _reg5_T_1; // @[Reg.scala 36:22]
    end
    if (io_en) begin // @[Reg.scala 20:18]
      reg6 <= _reg6_T_1; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      reg7_r <= 8'h0; // @[Reg.scala 35:20]
    end else if (io_en) begin // @[Reg.scala 36:18]
      reg7_r <= io_a; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      reg7_r_1 <= 8'h0; // @[Reg.scala 35:20]
    end else if (io_en) begin // @[Reg.scala 36:18]
      reg7_r_1 <= reg7_r; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      reg7 <= 8'h0; // @[Reg.scala 35:20]
    end else if (io_en) begin // @[Reg.scala 36:18]
      reg7 <= reg7_r_1; // @[Reg.scala 36:22]
    end
    if (io_en) begin // @[Reg.scala 20:18]
      reg8_r <= io_a; // @[Reg.scala 20:22]
    end
    if (io_en) begin // @[Reg.scala 20:18]
      reg8_r_1 <= reg8_r; // @[Reg.scala 20:22]
    end
    if (io_en) begin // @[Reg.scala 20:18]
      reg8 <= reg8_r_1; // @[Reg.scala 20:22]
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
  reg0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  reg1 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  reg2 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  reg3 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  reg4 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  reg5 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  reg6 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  reg7_r = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  reg7_r_1 = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  reg7 = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  reg8_r = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  reg8_r_1 = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  reg8 = _RAND_12[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
