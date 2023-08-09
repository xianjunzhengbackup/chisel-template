module AndModule(
  input   clock,
  input   reset,
  input   io_a,
  input   io_b,
  output  io_c
);
  assign io_c = io_a & io_b; // @[ModuleExample.scala 30:16]
endmodule
