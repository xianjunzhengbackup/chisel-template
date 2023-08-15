// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VCounter31Bit__Syms.h"


void VCounter31Bit___024root__traceInitSub0(VCounter31Bit___024root* vlSelf, VerilatedVcd* tracep) VL_ATTR_COLD;

void VCounter31Bit___024root__traceInitTop(VCounter31Bit___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VCounter31Bit__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        VCounter31Bit___024root__traceInitSub0(vlSelf, tracep);
    }
}

void VCounter31Bit___024root__traceInitSub0(VCounter31Bit___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VCounter31Bit__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    const int c = vlSymsp->__Vm_baseCode;
    if (false && tracep && c) {}  // Prevent unused
    // Body
    {
        tracep->declBit(c+4,"clock", false,-1);
        tracep->declBit(c+5,"reset", false,-1);
        tracep->declBus(c+6,"io_seg7led_cathodes", false,-1, 6,0);
        tracep->declBit(c+7,"io_seg7led_decimalPoint", false,-1);
        tracep->declBus(c+8,"io_seg7led_anodes", false,-1, 7,0);
        tracep->declBit(c+4,"Counter31Bit clock", false,-1);
        tracep->declBit(c+5,"Counter31Bit reset", false,-1);
        tracep->declBus(c+6,"Counter31Bit io_seg7led_cathodes", false,-1, 6,0);
        tracep->declBit(c+7,"Counter31Bit io_seg7led_decimalPoint", false,-1);
        tracep->declBus(c+8,"Counter31Bit io_seg7led_anodes", false,-1, 7,0);
        tracep->declBus(c+1,"Counter31Bit seg7LED1Digit_io_num", false,-1, 3,0);
        tracep->declBus(c+2,"Counter31Bit seg7LED1Digit_io_seg7led_cathodes", false,-1, 6,0);
        tracep->declBus(c+3,"Counter31Bit count", false,-1, 30,0);
        tracep->declBus(c+1,"Counter31Bit seg7LED1Digit io_num", false,-1, 3,0);
        tracep->declBus(c+2,"Counter31Bit seg7LED1Digit io_seg7led_cathodes", false,-1, 6,0);
    }
}

void VCounter31Bit___024root__traceFullTop0(void* voidSelf, VerilatedVcd* tracep) VL_ATTR_COLD;
void VCounter31Bit___024root__traceChgTop0(void* voidSelf, VerilatedVcd* tracep);
void VCounter31Bit___024root__traceCleanup(void* voidSelf, VerilatedVcd* /*unused*/);

void VCounter31Bit___024root__traceRegister(VCounter31Bit___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VCounter31Bit__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        tracep->addFullCb(&VCounter31Bit___024root__traceFullTop0, vlSelf);
        tracep->addChgCb(&VCounter31Bit___024root__traceChgTop0, vlSelf);
        tracep->addCleanupCb(&VCounter31Bit___024root__traceCleanup, vlSelf);
    }
}

void VCounter31Bit___024root__traceFullSub0(VCounter31Bit___024root* vlSelf, VerilatedVcd* tracep) VL_ATTR_COLD;

void VCounter31Bit___024root__traceFullTop0(void* voidSelf, VerilatedVcd* tracep) {
    VCounter31Bit___024root* const __restrict vlSelf = static_cast<VCounter31Bit___024root*>(voidSelf);
    VCounter31Bit__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        VCounter31Bit___024root__traceFullSub0((&vlSymsp->TOP), tracep);
    }
}

void VCounter31Bit___024root__traceFullSub0(VCounter31Bit___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VCounter31Bit__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        tracep->fullCData(oldp+1,((0xfU & (vlSelf->Counter31Bit__DOT__count 
                                           >> 0x1bU))),4);
        tracep->fullCData(oldp+2,(((0U == (0xfU & (vlSelf->Counter31Bit__DOT__count 
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
                                                    : (IData)(vlSelf->Counter31Bit__DOT__seg7LED1Digit__DOT___io_seg7led_cathodes_T_28))))),7);
        tracep->fullIData(oldp+3,(vlSelf->Counter31Bit__DOT__count),31);
        tracep->fullBit(oldp+4,(vlSelf->clock));
        tracep->fullBit(oldp+5,(vlSelf->reset));
        tracep->fullCData(oldp+6,(vlSelf->io_seg7led_cathodes),7);
        tracep->fullBit(oldp+7,(vlSelf->io_seg7led_decimalPoint));
        tracep->fullCData(oldp+8,(vlSelf->io_seg7led_anodes),8);
    }
}
