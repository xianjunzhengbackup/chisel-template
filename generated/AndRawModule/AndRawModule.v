module AndRawModule(
  input   ioBundle_a,
  input   ioBundle_b,
  output  c
);
  assign c = ioBundle_a & ioBundle_b; // @[ModuleExample.scala 11:19]
endmodule
