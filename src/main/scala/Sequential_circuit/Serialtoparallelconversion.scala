package Sequential_circuit

object Serialtoparallelconversion extends App{
  /*
  In the preceding pages, we used parallel signal lines like Vec and UInt to
  transmit multiple bits of data.
  There is also a method of transmitting data serially over a period of several
  clocks on one signal line. This transmission method is called serial
  communication. Then, by storing the values sent serially, we can handle the
  data sent serially again in parallel. The conversion module is called serial-to-
  parallel converter.
  PS/2 keyboard (Synchronous serial communication)
  One device that uses serial communication is the PS/2 keyboard. (It is hardly
  used now) The PS/2 keyboard uses clock signal lines and one data signal line
  to transmit and receive data. Let's look at 8 USB HID Host of Nexys 4 DDR
  Reference Manual. We can connect a keyboard compatible with PS / 2 in the
  shape of USB.
  Let's receive data from the keyboard and display it on the 7-segment LED.
  Specification of PS/2 data reception
  The data sent when the keyboard key is pressed (called the scan code) is sent
  as follows.
  PS2->FPGA
  The clock signal (ps2Clock) is sent from the keyboard (peripheral device).
  The data signal (ps2Data) changes slightly behind the clock rise. So, the
  FPGA (host side) reads data at the falling edge of the clock. At this point, we
  can reliably read data that has become stable. Communication methods that
  use clock signals to synchronize each other are called synchronous
  communication. The signal to synchronize is called the synchronization
  signal.
  In the PS / 2 specification, when there is no data to transmit, the clock signal
  and data signal are high, and change when transmitting and receiving data.
  The transmission of data takes place as follows:
  1. Set the data signal to Low (0).
  2. The clock signal is changed, and the subsequent processing is performed
  at the rise of the clock.
  3. Send 8-bit transmission data. Transmit in order from the least significant
  bit (LSB).
  4. Send parity bits.
  5. Set the data to High (1).
  6. Set the clock to High (1).
  Focusing on the value of the data signal at the falling clock edge, the
  following 11 bits of data are sent.
  1. Low(0): Start bit.
  2. Bit0
  3. Bit1
  4. Bit2 (Abbreviation)
  5. Bit6
  6. Bit7
  7. Parity bit: XOR of Bit0 ~ Bit7
  8. High(1): Stop bit.
  By storing Bit0 to Bit7 data in a register, it is possible to handle data sent in
  serial in parallel.
  Shift register
  To convert data sent serially to parallel, use the following serial input parallel
  output shift register.
  /** Shift register(Serial-In, Parallel-Out)
  *
  * @param n Bit width of output
  */
  class ShiftRegisterSIPO(n: Int) extends Module {
  val io = IO(new Bundle {
  val shiftIn = Input(Bool()) // Input signal
  val enable = Input(Bool()) // When is true, read shiftIn
  signal.
  val q = Output(UInt(n.W)) // output. The old input is the
  upper bit.
  })
  val reg = RegInit(0.U(n.W))
  when (io.enable) {
  reg := Cat(reg(n - 2, 0), io.shiftIn)
  }
  io.q := reg
  }
  Synchronizer
  To detect the falling edge of the clock signal from the keyboard, capture the
  clock signal (ps2Clock) from the keyboard into the register at each rise of the
  FPGA clock (fpgaClock) (red line timing) as shown in the figure below.
  Check whether it has changed from 1 to 0 in comparison with the previous
  value.
  NegEdgePS2Clock
  The D flip-flop registers capture the signal at the rising edge of the FPGA
  clock. What happens if the signal changes at the rising edge of the clock as
  shown in the figure below? In such a case, the output of the register will
  continue to be unstable between High and Low, called a metastable state for
  some time. It will eventually be either 0 or 1. It is undefined which one will
  be. Since the clock signal of the keyboard changes independently of the clock
  signal of the FPGA, there is a possibility that such a meta statble state will
  occur.
  PS2ClockMetaStable
  However, the metastable state ends practically within one clock of 100 MHz
  at the longest. Therefore, as shown below, capture the value of reg1 register
  with reg2 again. Then use the output of reg2 to avoid using metastable state
  values.
  /** Synchronizer
  */
  class Synchronizer extends Module {
  val io = IO(new Bundle {
  val d = Input(Bool())
  val q = Output(Bool())
  })
  val reg1 = RegNext(io.d)
  val reg2 = RegNext(reg1)
  io.q := reg2
  }
  set_property -dict { PACKAGE_PIN K2 IOSTANDARD LVCMOS33 }
  [get_ports { io_seg7led_anodes[6] }]; #IO_L23P_T3_35 Sch=an[6]
  set_property -dict { PACKAGE_PIN U13 IOSTANDARD LVCMOS33 }
  [get_ports { io_seg7led_anodes[7] }]; #IO_L23N_T3_A02_D18_14
  Sch=an[7]
  ##Buttons
  set_property -dict { PACKAGE_PIN M18 IOSTANDARD LVCMOS33 }
  [get_ports { reset }]; #IO_L4N_T0_D05_14 Sch=btnu
  set_property -dict { PACKAGE_PIN P18 IOSTANDARD LVCMOS33 }
  [get_ports { io_valid }]; #IO_L9N_T1_DQS_D13_14 Sch=btnd
  ##USB-RS232 Interface
  set_property -dict { PACKAGE_PIN C4 IOSTANDARD LVCMOS33 }
  [get_ports { io_rxData }]; #IO_L7P_T1_AD6P_35 Sch=uart_txd_in
  set_property -dict { PACKAGE_PIN D4 IOSTANDARD LVCMOS33 }
  [get_ports { io_txData }]; #IO_L11N_T1_SRCC_35 Sch=uart_rxd_out
  set_property -dict { PACKAGE_PIN D3 IOSTANDARD LVCMOS33 }
  [get_ports { io_rts }]; #IO_L12N_T1_MRCC_35 Sch=uart_cts
  set_property -dict { PACKAGE_PIN E5 IOSTANDARD LVCMOS33 }
  [get_ports { io_cts }]; #IO_L5N_T0_AD13N_35 Sch=uart_rts
  PC operation
  The personal computer uses a program for serial communication to transmit
  and receive data. There are C-Kermit, minicom, gtkterm and cu for serial
  communication. Here, we use C-Kermit.
  Install C-Kermit.
  sudo apt-get install ckermit
  Edit the C-Kermit configuration file. Create a file named ".kermitrc" in your
  home directory and write the following.
  set line /dev/ttyUSB1
  set speed 115200
  set carrier-watch off
  connect
  Here, ttyUSB1 changes according to the environment. The easiest way to
  check is to unplug the cable and to plug it, and then see what's changing in
  the file.
  The correct way is to search the "/var/log/syslog" file, look for the following
  Digilent or FDTI names, and find the corresponding tty names. The larger
  number is for UART communication.
  May 23 12:46:58 XXXXXX kernel: [17192.716253] usb 1-4:
  Manufacturer: Digilent
  May 23 12:46:58 XXXXXX kernel: [17192.716257] usb 1-4:
  SerialNumber: 210292696907
  May 23 12:46:58 XXXXXX kernel: [17192.719025] ftdi_sio 1-4:1.0:
  FTDI USB Serial Device converter detected
  May 23 12:46:58 XXXXXX kernel: [17192.719094] usb 1-4: Detected
  FT2232H
  May 23 12:46:58 XXXXXX kernel: [17192.719474] usb 1-4: FTDI USB
  Serial Device converter now attached to ttyUSB0
  May 23 12:46:58 XXXXXX kernel: [17192.721708] ftdi_sio 1-4:1.1:
  FTDI USB Serial Device converter detected
  May 23 12:46:58 XXXXXX kernel: [17192.721771] usb 1-4: Detected
  FT2232H
  May 23 12:46:58 XXXXXX kernel: [17192.722043] usb 1-4: FTDI USB
  Serial Device converter now attached to ttyUSB1
  Even if you edit the file, you do not have access privilege to "/dev/ttyUSB1",
  so add your account to an accessible group.
  sudo gpasswd -a your_account dialout
  Alternatively, allow everyone access to the file.(This method requires
  changing each time the cable is inserted)
  sudo chmod a+rw /dev/ttyUSB1
  We can then send and receive data from the FPGA board by executing the
  "kermit" command. To exit, press "Ctrl-" and then "c" and type "exit".
  $ kermit
  Connecting to /dev/ttyUSB1, speed 115200
  Escape character: Ctrl-\ (ASCII 28, FS): enabled
  Type the escape character followed by C to get back,
  or followed by ? to see other options.
  ----------------------------------------------------
  A
  (Back at XXXXX)
  ----------------------------------------------------
  C-Kermit 9.0.302 OPEN SOURCE:, 20 Aug 2011, for Linux+SSL+KRB5
  (64-bit)
  Copyright (C) 1985, 2011,
  Trustees of Columbia University in the City of New York.
  Type ? or HELP for help.
  (/home/XXXXXX/) C-Kermit>exit
  Closing /dev/ttyUSB1...OK
   */

}
