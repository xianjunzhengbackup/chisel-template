// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VCounter31Bit__Syms.h"


void VCounter31Bit___024root__traceChgSub0(VCounter31Bit___024root* vlSelf, VerilatedVcd* tracep);

void VCounter31Bit___024root__traceChgTop0(void* voidSelf, VerilatedVcd* tracep) {
    VCounter31Bit___024root* const __restrict vlSelf = static_cast<VCounter31Bit___024root*>(voidSelf);
    VCounter31Bit__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    {
        VCounter31Bit___024root__traceChgSub0((&vlSymsp->TOP), tracep);
    }
}

void VCounter31Bit___024root__traceChgSub0(VCounter31Bit___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VCounter31Bit__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode + 1);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[1U])) {
            tracep->chgCData(oldp+0,((0xfU & (vlSelf->Counter31Bit__DOT__count 
                                              >> 0x1bU))),4);
            tracep->chgCData(oldp+1,(((0U == (0xfU 
                                              & (vlSelf->Counter31Bit__DOT__count 
                                                 >> 0x1bU)))
                                       ? 0x40U : ((1U 
                                                   == 
                                                   (0xfU 
                                                    & (vlSelf->Counter31Bit__DOT__count 
                                                       >> 0x1bU)))
                                                   ? 0x79U
                                                   : 
                                                  ((2U 
                                                    == 
                                                    (0xfU 
                                                     & (vlSelf->Counter31Bit__DOT__count 
                                                        >> 0x1bU)))
                                                    ? 0x24U
                                                    : (IData)(vlSelf->Counter31Bit__DOT__seg7LED1Digit__DOT___io_seg7led_cathodes_T_28))))),7);
            tracep->chgIData(oldp+2,(vlSelf->Counter31Bit__DOT__count),31);
        }
        tracep->chgBit(oldp+3,(vlSelf->clock));
        tracep->chgBit(oldp+4,(vlSelf->reset));
        tracep->chgCData(oldp+5,(vlSelf->io_seg7led_cathodes),7);
        tracep->chgBit(oldp+6,(vlSelf->io_seg7led_decimalPoint));
        tracep->chgCData(oldp+7,(vlSelf->io_seg7led_anodes),8);
    }
}

void VCounter31Bit___024root__traceCleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VCounter31Bit___024root* const __restrict vlSelf = static_cast<VCounter31Bit___024root*>(voidSelf);
    VCounter31Bit__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        vlSymsp->__Vm_activity = false;
        vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
        vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
    }
}
