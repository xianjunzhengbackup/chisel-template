module SRLatch(
  input   io_set,
  input   io_reset,
  output  io_q,
  output  io_notQ
);
  assign io_q = ~(io_reset | io_notQ); // @[SRLatch.scala 13:11]
  assign io_notQ = ~(io_set | io_q); // @[SRLatch.scala 14:14]
endmodule
module DLatch(
  input   io_data,
  input   io_enable,
  output  io_q
);
  wire  srLatch_io_set; // @[DLatch.scala 13:21]
  wire  srLatch_io_reset; // @[DLatch.scala 13:21]
  wire  srLatch_io_q; // @[DLatch.scala 13:21]
  wire  srLatch_io_notQ; // @[DLatch.scala 13:21]
  SRLatch srLatch ( // @[DLatch.scala 13:21]
    .io_set(srLatch_io_set),
    .io_reset(srLatch_io_reset),
    .io_q(srLatch_io_q),
    .io_notQ(srLatch_io_notQ)
  );
  assign io_q = srLatch_io_q; // @[DLatch.scala 17:8]
  assign srLatch_io_set = io_enable & io_data; // @[DLatch.scala 15:31]
  assign srLatch_io_reset = io_enable & ~io_data; // @[DLatch.scala 14:33]
endmodule
module DFlipFlop(
  input   clock,
  input   reset,
  input   io_clock,
  input   io_data,
  output  io_q
);
  wire  dLatch1_io_data; // @[DFlipFlop.scala 13:21]
  wire  dLatch1_io_enable; // @[DFlipFlop.scala 13:21]
  wire  dLatch1_io_q; // @[DFlipFlop.scala 13:21]
  wire  dLatch2_io_data; // @[DFlipFlop.scala 17:21]
  wire  dLatch2_io_enable; // @[DFlipFlop.scala 17:21]
  wire  dLatch2_io_q; // @[DFlipFlop.scala 17:21]
  DLatch dLatch1 ( // @[DFlipFlop.scala 13:21]
    .io_data(dLatch1_io_data),
    .io_enable(dLatch1_io_enable),
    .io_q(dLatch1_io_q)
  );
  DLatch dLatch2 ( // @[DFlipFlop.scala 17:21]
    .io_data(dLatch2_io_data),
    .io_enable(dLatch2_io_enable),
    .io_q(dLatch2_io_q)
  );
  assign io_q = dLatch2_io_q; // @[DFlipFlop.scala 21:8]
  assign dLatch1_io_data = io_data; // @[DFlipFlop.scala 15:19]
  assign dLatch1_io_enable = ~io_clock; // @[DFlipFlop.scala 14:24]
  assign dLatch2_io_data = dLatch1_io_q; // @[DFlipFlop.scala 19:19]
  assign dLatch2_io_enable = io_clock; // @[DFlipFlop.scala 18:21]
endmodule
