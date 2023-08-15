// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VCounter31Bit.h for the primary calling header

#ifndef VERILATED_VCOUNTER31BIT___024ROOT_H_
#define VERILATED_VCOUNTER31BIT___024ROOT_H_  // guard

#include "verilated_heavy.h"

//==========

class VCounter31Bit__Syms;
class VCounter31Bit_VerilatedVcd;


//----------

VL_MODULE(VCounter31Bit___024root) {
  public:

    // PORTS
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    VL_OUT8(io_seg7led_cathodes,6,0);
    VL_OUT8(io_seg7led_decimalPoint,0,0);
    VL_OUT8(io_seg7led_anodes,7,0);

    // LOCAL SIGNALS
    CData/*6:0*/ Counter31Bit__DOT__seg7LED1Digit__DOT___io_seg7led_cathodes_T_28;
    IData/*30:0*/ Counter31Bit__DOT__count;
    IData/*30:0*/ Counter31Bit__DOT___count_T_1;

    // LOCAL VARIABLES
    CData/*0:0*/ __Vclklast__TOP__clock;
    VlUnpacked<CData/*0:0*/, 2> __Vm_traceActivity;

    // INTERNAL VARIABLES
    VCounter31Bit__Syms* vlSymsp;  // Symbol table

    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(VCounter31Bit___024root);  ///< Copying not allowed
  public:
    VCounter31Bit___024root(const char* name);
    ~VCounter31Bit___024root();

    // INTERNAL METHODS
    void __Vconfigure(VCounter31Bit__Syms* symsp, bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
