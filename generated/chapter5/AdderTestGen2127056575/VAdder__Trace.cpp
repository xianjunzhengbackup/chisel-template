// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VAdder__Syms.h"


void VAdder___024root__traceChgSub0(VAdder___024root* vlSelf, VerilatedVcd* tracep);

void VAdder___024root__traceChgTop0(void* voidSelf, VerilatedVcd* tracep) {
    VAdder___024root* const __restrict vlSelf = static_cast<VAdder___024root*>(voidSelf);
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    {
        VAdder___024root__traceChgSub0((&vlSymsp->TOP), tracep);
    }
}

void VAdder___024root__traceChgSub0(VAdder___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode + 1);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        tracep->chgBit(oldp+0,(vlSelf->clock));
        tracep->chgBit(oldp+1,(vlSelf->reset));
        tracep->chgCData(oldp+2,(vlSelf->io_a),8);
        tracep->chgCData(oldp+3,(vlSelf->io_b),8);
        tracep->chgCData(oldp+4,(vlSelf->io_s),8);
        tracep->chgBit(oldp+5,(vlSelf->io_cout));
    }
}

void VAdder___024root__traceCleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VlUnpacked<CData/*0:0*/, 1> __Vm_traceActivity;
    VAdder___024root* const __restrict vlSelf = static_cast<VAdder___024root*>(voidSelf);
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        vlSymsp->__Vm_activity = false;
        __Vm_traceActivity[0U] = 0U;
    }
}
