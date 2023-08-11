// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VAdder.h for the primary calling header

#ifndef VERILATED_VADDER___024ROOT_H_
#define VERILATED_VADDER___024ROOT_H_  // guard

#include "verilated_heavy.h"

//==========

class VAdder__Syms;
class VAdder_VerilatedVcd;


//----------

VL_MODULE(VAdder___024root) {
  public:

    // PORTS
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    VL_IN8(io_a,7,0);
    VL_IN8(io_b,7,0);
    VL_OUT8(io_s,7,0);
    VL_OUT8(io_cout,0,0);

    // INTERNAL VARIABLES
    VAdder__Syms* vlSymsp;  // Symbol table

    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(VAdder___024root);  ///< Copying not allowed
  public:
    VAdder___024root(const char* name);
    ~VAdder___024root();

    // INTERNAL METHODS
    void __Vconfigure(VAdder__Syms* symsp, bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
