// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VCounter31Bit.h for the primary calling header

#include "VCounter31Bit___024root.h"
#include "VCounter31Bit__Syms.h"

//==========


void VCounter31Bit___024root___ctor_var_reset(VCounter31Bit___024root* vlSelf);

VCounter31Bit___024root::VCounter31Bit___024root(const char* _vcname__)
    : VerilatedModule(_vcname__)
 {
    // Reset structure values
    VCounter31Bit___024root___ctor_var_reset(this);
}

void VCounter31Bit___024root::__Vconfigure(VCounter31Bit__Syms* _vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->vlSymsp = _vlSymsp;
}

VCounter31Bit___024root::~VCounter31Bit___024root() {
}

void VCounter31Bit___024root___initial__TOP__1(VCounter31Bit___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCounter31Bit__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCounter31Bit___024root___initial__TOP__1\n"); );
    // Body
    vlSelf->io_seg7led_decimalPoint = 1U;
    vlSelf->io_seg7led_anodes = 0xfeU;
}

void VCounter31Bit___024root___settle__TOP__3(VCounter31Bit___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCounter31Bit__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCounter31Bit___024root___settle__TOP__3\n"); );
    // Body
    vlSelf->Counter31Bit__DOT___count_T_1 = (0x7fffffffU 
                                             & ((IData)(1U) 
                                                + vlSelf->Counter31Bit__DOT__count));
    vlSelf->Counter31Bit__DOT__seg7LED1Digit__DOT___io_seg7led_cathodes_T_28 
        = ((3U == (0xfU & (vlSelf->Counter31Bit__DOT__count 
                           >> 0x1bU))) ? 0x30U : ((4U 
                                                   == 
                                                   (0xfU 
                                                    & (vlSelf->Counter31Bit__DOT__count 
                                                       >> 0x1bU)))
                                                   ? 0x19U
                                                   : 
                                                  ((5U 
                                                    == 
                                                    (0xfU 
                                                     & (vlSelf->Counter31Bit__DOT__count 
                                                        >> 0x1bU)))
                                                    ? 0x12U
                                                    : 
                                                   ((6U 
                                                     == 
                                                     (0xfU 
                                                      & (vlSelf->Counter31Bit__DOT__count 
                                                         >> 0x1bU)))
                                                     ? 2U
                                                     : 
                                                    ((7U 
                                                      == 
                                                      (0xfU 
                                                       & (vlSelf->Counter31Bit__DOT__count 
                                                          >> 0x1bU)))
                                                      ? 0x58U
                                                      : 
                                                     ((8U 
                                                       == 
                                                       (0xfU 
                                                        & (vlSelf->Counter31Bit__DOT__count 
                                                           >> 0x1bU)))
                                                       ? 0U
                                                       : 
                                                      ((9U 
                                                        == 
                                                        (0xfU 
                                                         & (vlSelf->Counter31Bit__DOT__count 
                                                            >> 0x1bU)))
                                                        ? 0x10U
                                                        : 
                                                       ((0xaU 
                                                         == 
                                                         (0xfU 
                                                          & (vlSelf->Counter31Bit__DOT__count 
                                                             >> 0x1bU)))
                                                         ? 8U
                                                         : 
                                                        ((0xbU 
                                                          == 
                                                          (0xfU 
                                                           & (vlSelf->Counter31Bit__DOT__count 
                                                              >> 0x1bU)))
                                                          ? 3U
                                                          : 
                                                         ((0xcU 
                                                           == 
                                                           (0xfU 
                                                            & (vlSelf->Counter31Bit__DOT__count 
                                                               >> 0x1bU)))
                                                           ? 0x46U
                                                           : 
                                                          ((0xdU 
                                                            == 
                                                            (0xfU 
                                                             & (vlSelf->Counter31Bit__DOT__count 
                                                                >> 0x1bU)))
                                                            ? 0x21U
                                                            : 
                                                           ((0xeU 
                                                             == 
                                                             (0xfU 
                                                              & (vlSelf->Counter31Bit__DOT__count 
                                                                 >> 0x1bU)))
                                                             ? 6U
                                                             : 
                                                            ((0xfU 
                                                              == 
                                                              (0xfU 
                                                               & (vlSelf->Counter31Bit__DOT__count 
                                                                  >> 0x1bU)))
                                                              ? 0xeU
                                                              : 0x7fU)))))))))))));
    vlSelf->io_seg7led_cathodes = ((0U == (0xfU & (vlSelf->Counter31Bit__DOT__count 
                                                   >> 0x1bU)))
                                    ? 0x40U : ((1U 
                                                == 
                                                (0xfU 
                                                 & (vlSelf->Counter31Bit__DOT__count 
                                                    >> 0x1bU)))
                                                ? 0x79U
                                                : (
                                                   (2U 
                                                    == 
                                                    (0xfU 
                                                     & (vlSelf->Counter31Bit__DOT__count 
                                                        >> 0x1bU)))
                                                    ? 0x24U
                                                    : (IData)(vlSelf->Counter31Bit__DOT__seg7LED1Digit__DOT___io_seg7led_cathodes_T_28))));
}

void VCounter31Bit___024root___eval_initial(VCounter31Bit___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCounter31Bit__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCounter31Bit___024root___eval_initial\n"); );
    // Body
    VCounter31Bit___024root___initial__TOP__1(vlSelf);
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

void VCounter31Bit___024root___eval_settle(VCounter31Bit___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCounter31Bit__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCounter31Bit___024root___eval_settle\n"); );
    // Body
    VCounter31Bit___024root___settle__TOP__3(vlSelf);
    vlSelf->__Vm_traceActivity[1U] = 1U;
    vlSelf->__Vm_traceActivity[0U] = 1U;
}

void VCounter31Bit___024root___final(VCounter31Bit___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCounter31Bit__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCounter31Bit___024root___final\n"); );
}

void VCounter31Bit___024root___ctor_var_reset(VCounter31Bit___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCounter31Bit__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCounter31Bit___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->clock = VL_RAND_RESET_I(1);
    vlSelf->reset = VL_RAND_RESET_I(1);
    vlSelf->io_seg7led_cathodes = VL_RAND_RESET_I(7);
    vlSelf->io_seg7led_decimalPoint = VL_RAND_RESET_I(1);
    vlSelf->io_seg7led_anodes = VL_RAND_RESET_I(8);
    vlSelf->Counter31Bit__DOT__count = VL_RAND_RESET_I(31);
    vlSelf->Counter31Bit__DOT___count_T_1 = VL_RAND_RESET_I(31);
    vlSelf->Counter31Bit__DOT__seg7LED1Digit__DOT___io_seg7led_cathodes_T_28 = VL_RAND_RESET_I(7);
    for (int __Vi0=0; __Vi0<2; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = VL_RAND_RESET_I(1);
    }
}
