// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VAdder.h for the primary calling header

#ifndef VERILATED_VADDER___024ROOT_H_
#define VERILATED_VADDER___024ROOT_H_  // guard

#include "verilated.h"


class VAdder__Syms;

class alignas(VL_CACHE_LINE_BYTES) VAdder___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    VL_IN8(io_a,7,0);
    VL_IN8(io_b,7,0);
    VL_OUT8(io_s,7,0);
    VL_OUT8(io_cout,0,0);
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VstlIterCount;
    IData/*31:0*/ __VicoIterCount;
    IData/*31:0*/ __VactIterCount;
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<1> __VicoTriggered;
    VlTriggerVec<0> __VactTriggered;
    VlTriggerVec<0> __VnbaTriggered;

    // INTERNAL VARIABLES
    VAdder__Syms* const vlSymsp;

    // CONSTRUCTORS
    VAdder___024root(VAdder__Syms* symsp, const char* v__name);
    ~VAdder___024root();
    VL_UNCOPYABLE(VAdder___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
