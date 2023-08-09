module AndMultiIOModule(
  input   clock,
  input   reset,
  input   io_a,
  output  io_c,
  input   iob
);
  assign io_c = io_a & iob; // @[ModuleExample.scala 21:16]
endmodule
