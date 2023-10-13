module Memory(
  input         clock,
  input         reset,
  input  [10:0] io_rdAddr,
  output [7:0]  io_rdData,
  input  [10:0] io_wrAddr,
  input  [7:0]  io_wrData,
  input         io_wrEnable
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem [0:2047]; // @[Memory.scala 15:24]
  wire  mem_io_rdData_MPORT_en; // @[Memory.scala 15:24]
  wire [10:0] mem_io_rdData_MPORT_addr; // @[Memory.scala 15:24]
  wire [7:0] mem_io_rdData_MPORT_data; // @[Memory.scala 15:24]
  wire [7:0] mem_MPORT_data; // @[Memory.scala 15:24]
  wire [10:0] mem_MPORT_addr; // @[Memory.scala 15:24]
  wire  mem_MPORT_mask; // @[Memory.scala 15:24]
  wire  mem_MPORT_en; // @[Memory.scala 15:24]
  reg  mem_io_rdData_MPORT_en_pipe_0;
  reg [10:0] mem_io_rdData_MPORT_addr_pipe_0;
  assign mem_io_rdData_MPORT_en = mem_io_rdData_MPORT_en_pipe_0;
  assign mem_io_rdData_MPORT_addr = mem_io_rdData_MPORT_addr_pipe_0;
  assign mem_io_rdData_MPORT_data = mem[mem_io_rdData_MPORT_addr]; // @[Memory.scala 15:24]
  assign mem_MPORT_data = io_wrData;
  assign mem_MPORT_addr = io_wrAddr;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_wrEnable;
  assign io_rdData = mem_io_rdData_MPORT_data; // @[Memory.scala 16:13]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[Memory.scala 15:24]
    end
    mem_io_rdData_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_io_rdData_MPORT_addr_pipe_0 <= io_rdAddr;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2048; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_io_rdData_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_io_rdData_MPORT_addr_pipe_0 = _RAND_2[10:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
