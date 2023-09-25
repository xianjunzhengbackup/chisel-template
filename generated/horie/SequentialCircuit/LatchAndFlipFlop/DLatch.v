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
  input   clock,
  input   reset,
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
