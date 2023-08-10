package Sequential_circuit

object ImplicitState extends App{
  /*
  In the previous section, we used a state machine. However, in image
  processing etc., we don't use much state machine.
  Color bar on VGA display
  An example of not using an explicit state variable is video display.
  Again, looking at the Nexys 4 DDR Reference Manual, there is a VGA port
  on 9 VGA Port. Let's connect this to the display.
  CRT and VGA
  In the past, television and computer screens were displayed on CRT
  (Cathode-ray tube). The interior of a CRT is evacuated. In a CRT, an electron
  beam is emitted from the back side of the screen as shown in the figure
  below. When this electron beam collides with the fluorescent substance
  coated on the front of the cathode ray tube, light is emitted from the
  fluorescent substance.
  The beam is bent by magnetic deflection.
  It moves from the top left of the screen to the right, and when it reaches the
  right end, it moves a little down and returns to the left end and moves to the
  right again. (The electron beam output is stopped during the moving period
  shown by the dotted line) And when it reaches the bottom right of the screen,
  (colorNum === 7.U) -> "h00f".U // Blue
  ))
  val pxColor = RegNext(Mux(pxEnable, color, "h000".U))
  io.vga.red := pxColor(11, 8)
  io.vga.green := pxColor(7, 4)
  io.vga.blue := pxColor(3, 0)
  io.vga.hSync := RegNext(!(hCount < hSyncPeriod.U))
  io.vga.vSync := RegNext(!(vCount < vSyncPeriod.U))
  }
  In the above, the color values are temporarily stored in the register as follows.
  val pxColor = RegNext(Mux(pxEnable, color, "h000".U))
  The reason is that the value of each bit of "colorNum" changes variously until
  the calculation of colorNum is completed after the rise of the clock and the
  change is not propagated to the monitor. In addition and division, the circuit
  repeats AND and OR for each bit. Because the numbers that pass through
  AND and OR are different depending on the bit, the time for the value to
  stabilize depends on the bit. So, for a while after the clock rise, colorNum
  changes to various values. Without the register, the change will appear as
  noise on the monitor. In order not to output the noise directly to the monitor,
  the value after stabilization is once taken into the register.
  When the "color" value is taken into the register, it is output to the VGA with
  a delay of one clock. "hSync" and "vSync" are also registered in the register
  so as to be delayed by one clock, and aligned with "color".
  The constraint file is as follows.
  ## Clock signal
  set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 }
  [get_ports { clock }]; #IO_L12P_T1_MRCC_35 Sch=clk100mhz
  create_clock -add -name sys_clk_pin -period 10.00 -waveform {0
  5} [get_ports {clock}];
  ##Buttons
  set_property -dict { PACKAGE_PIN M18 IOSTANDARD LVCMOS33 }
  [get_ports { reset }]; #IO_L4N_T0_D05_14 Sch=btnu
  ##VGA Connector
  set_property -dict { PACKAGE_PIN A3 IOSTANDARD LVCMOS33 }
  [get_ports { io_vga_red[0] }]; #IO_L8N_T1_AD14N_35 Sch=vga_r[0]
  set_property -dict { PACKAGE_PIN B4 IOSTANDARD LVCMOS33 }
  [get_ports { io_vga_red[1] }]; #IO_L7N_T1_AD6N_35 Sch=vga_r[1]
  set_property -dict { PACKAGE_PIN C5 IOSTANDARD LVCMOS33 }
  [get_ports { io_vga_red[2] }]; #IO_L1N_T0_AD4N_35 Sch=vga_r[2]
  set_property -dict { PACKAGE_PIN A4 IOSTANDARD LVCMOS33 }
  [get_ports { io_vga_red[3] }]; #IO_L8P_T1_AD14P_35 Sch=vga_r[3]
  set_property -dict { PACKAGE_PIN C6 IOSTANDARD LVCMOS33 }
  [get_ports { io_vga_green[0] }]; #IO_L1P_T0_AD4P_35
  Sch=vga_g[0]
  set_property -dict { PACKAGE_PIN A5 IOSTANDARD LVCMOS33 }
  [get_ports { io_vga_green[1] }]; #IO_L3N_T0_DQS_AD5N_35
  Sch=vga_g[1]
  set_property -dict { PACKAGE_PIN B6 IOSTANDARD LVCMOS33 }
  [get_ports { io_vga_green[2] }]; #IO_L2N_T0_AD12N_35
  Sch=vga_g[2]
  set_property -dict { PACKAGE_PIN A6 IOSTANDARD LVCMOS33 }
  [get_ports { io_vga_green[3] }]; #IO_L3P_T0_DQS_AD5P_35
  Sch=vga_g[3]
  set_property -dict { PACKAGE_PIN B7 IOSTANDARD LVCMOS33 }
  [get_ports { io_vga_blue[0] }]; #IO_L2P_T0_AD12P_35
  Sch=vga_b[0]
  set_property -dict { PACKAGE_PIN C7 IOSTANDARD LVCMOS33 }
  [get_ports { io_vga_blue[1] }]; #IO_L4N_T0_35 Sch=vga_b[1]
  set_property -dict { PACKAGE_PIN D7 IOSTANDARD LVCMOS33 }
  [get_ports { io_vga_blue[2] }]; #IO_L6N_T0_VREF_35 Sch=vga_b[2]
  set_property -dict { PACKAGE_PIN D8 IOSTANDARD LVCMOS33 }
  [get_ports { io_vga_blue[3] }]; #IO_L4P_T0_35 Sch=vga_b[3]
  set_property -dict { PACKAGE_PIN B11 IOSTANDARD LVCMOS33 }
  [get_ports { io_vga_hSync }]; #IO_L4P_T0_15 Sch=vga_hs
  set_property -dict { PACKAGE_PIN B12 IOSTANDARD LVCMOS33 }
  [get_ports { io_vga_vSync }]; #IO_L3N_T0_DQS_AD1N_15 Sch=vga_vs
   */

}
