// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VCounter31Bit.h for the primary calling header

#include "VCounter31Bit___024root.h"
#include "VCounter31Bit__Syms.h"

//==========

VL_INLINE_OPT void VCounter31Bit___024root___sequent__TOP__2(VCounter31Bit___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCounter31Bit__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCounter31Bit___024root___sequent__TOP__2\n"); );
    // Body
    vlSelf->Counter31Bit__DOT__count = ((IData)(vlSelf->reset)
                                         ? 0U : vlSelf->Counter31Bit__DOT___count_T_1);
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

void VCounter31Bit___024root___eval(VCounter31Bit___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCounter31Bit__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCounter31Bit___024root___eval\n"); );
    // Body
    if (((IData)(vlSelf->clock) & (~ (IData)(vlSelf->__Vclklast__TOP__clock)))) {
        VCounter31Bit___024root___sequent__TOP__2(vlSelf);
        vlSelf->__Vm_traceActivity[1U] = 1U;
    }
    // Final
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

QData VCounter31Bit___024root___change_request_1(VCounter31Bit___024root* vlSelf);

VL_INLINE_OPT QData VCounter31Bit___024root___change_request(VCounter31Bit___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCounter31Bit__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCounter31Bit___024root___change_request\n"); );
    // Body
    return (VCounter31Bit___024root___change_request_1(vlSelf));
}

VL_INLINE_OPT QData VCounter31Bit___024root___change_request_1(VCounter31Bit___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCounter31Bit__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCounter31Bit___024root___change_request_1\n"); );
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void VCounter31Bit___024root___eval_debug_assertions(VCounter31Bit___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VCounter31Bit__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCounter31Bit___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
}
#endif  // VL_DEBUG
