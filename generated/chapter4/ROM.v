module ROM(
  input        clock,
  input        reset,
  input  [1:0] io_sel,
  output [7:0] io_out
);
  wire [2:0] _GEN_1 = 2'h1 == io_sel ? 3'h2 : 3'h1; // @[chapter4_\u5E38\u7528\u7684\u786C\u4EF6\u539F\u8BED.scala 39:{14,14}]
  wire [2:0] _GEN_2 = 2'h2 == io_sel ? 3'h3 : _GEN_1; // @[chapter4_\u5E38\u7528\u7684\u786C\u4EF6\u539F\u8BED.scala 39:{14,14}]
  wire [2:0] _GEN_3 = 2'h3 == io_sel ? 3'h4 : _GEN_2; // @[chapter4_\u5E38\u7528\u7684\u786C\u4EF6\u539F\u8BED.scala 39:{14,14}]
  assign io_out = {{5'd0}, _GEN_3}; // @[chapter4_\u5E38\u7528\u7684\u786C\u4EF6\u539F\u8BED.scala 39:14]
endmodule
