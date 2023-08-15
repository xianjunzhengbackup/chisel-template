// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VAdder.h for the primary calling header

#include "VAdder___024root.h"
#include "VAdder__Syms.h"

//==========

VL_INLINE_OPT void VAdder___024root___combo__TOP__1(VAdder___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAdder___024root___combo__TOP__1\n"); );
    // Variables
    SData/*8:0*/ Adder__DOT___io_s_T;
    // Body
    Adder__DOT___io_s_T = (0x1ffU & ((IData)(vlSelf->io_a) 
                                     + (IData)(vlSelf->io_b)));
    vlSelf->io_s = (0xffU & (IData)(Adder__DOT___io_s_T));
    vlSelf->io_cout = (1U & ((IData)(Adder__DOT___io_s_T) 
                             >> 8U));
}

void VAdder___024root___eval(VAdder___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAdder___024root___eval\n"); );
    // Body
    VAdder___024root___combo__TOP__1(vlSelf);
}

QData VAdder___024root___change_request_1(VAdder___024root* vlSelf);

VL_INLINE_OPT QData VAdder___024root___change_request(VAdder___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAdder___024root___change_request\n"); );
    // Body
    return (VAdder___024root___change_request_1(vlSelf));
}

VL_INLINE_OPT QData VAdder___024root___change_request_1(VAdder___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAdder___024root___change_request_1\n"); );
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void VAdder___024root___eval_debug_assertions(VAdder___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAdder___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
}
#endif  // VL_DEBUG
