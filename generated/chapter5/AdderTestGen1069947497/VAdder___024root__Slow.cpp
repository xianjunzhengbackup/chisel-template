// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VAdder.h for the primary calling header

#include "VAdder___024root.h"
#include "VAdder__Syms.h"

//==========


void VAdder___024root___ctor_var_reset(VAdder___024root* vlSelf);

VAdder___024root::VAdder___024root(const char* _vcname__)
    : VerilatedModule(_vcname__)
 {
    // Reset structure values
    VAdder___024root___ctor_var_reset(this);
}

void VAdder___024root::__Vconfigure(VAdder__Syms* _vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->vlSymsp = _vlSymsp;
}

VAdder___024root::~VAdder___024root() {
}

void VAdder___024root___eval_initial(VAdder___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAdder___024root___eval_initial\n"); );
}

void VAdder___024root___combo__TOP__1(VAdder___024root* vlSelf);

void VAdder___024root___eval_settle(VAdder___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAdder___024root___eval_settle\n"); );
    // Body
    VAdder___024root___combo__TOP__1(vlSelf);
}

void VAdder___024root___final(VAdder___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAdder___024root___final\n"); );
}

void VAdder___024root___ctor_var_reset(VAdder___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAdder___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->clock = VL_RAND_RESET_I(1);
    vlSelf->reset = VL_RAND_RESET_I(1);
    vlSelf->io_a = VL_RAND_RESET_I(8);
    vlSelf->io_b = VL_RAND_RESET_I(8);
    vlSelf->io_s = VL_RAND_RESET_I(8);
    vlSelf->io_cout = VL_RAND_RESET_I(1);
}
