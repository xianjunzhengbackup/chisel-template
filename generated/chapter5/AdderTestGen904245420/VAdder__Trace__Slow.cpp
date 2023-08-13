// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VAdder__Syms.h"


void VAdder___024root__traceInitSub0(VAdder___024root* vlSelf, VerilatedVcd* tracep) VL_ATTR_COLD;

void VAdder___024root__traceInitTop(VAdder___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        VAdder___024root__traceInitSub0(vlSelf, tracep);
    }
}

void VAdder___024root__traceInitSub0(VAdder___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    const int c = vlSymsp->__Vm_baseCode;
    if (false && tracep && c) {}  // Prevent unused
    // Body
    {
        tracep->declBit(c+1,"clock", false,-1);
        tracep->declBit(c+2,"reset", false,-1);
        tracep->declBus(c+3,"io_a", false,-1, 7,0);
        tracep->declBus(c+4,"io_b", false,-1, 7,0);
        tracep->declBus(c+5,"io_s", false,-1, 7,0);
        tracep->declBit(c+6,"io_cout", false,-1);
        tracep->declBit(c+1,"Adder clock", false,-1);
        tracep->declBit(c+2,"Adder reset", false,-1);
        tracep->declBus(c+3,"Adder io_a", false,-1, 7,0);
        tracep->declBus(c+4,"Adder io_b", false,-1, 7,0);
        tracep->declBus(c+5,"Adder io_s", false,-1, 7,0);
        tracep->declBit(c+6,"Adder io_cout", false,-1);
    }
}

void VAdder___024root__traceFullTop0(void* voidSelf, VerilatedVcd* tracep) VL_ATTR_COLD;
void VAdder___024root__traceChgTop0(void* voidSelf, VerilatedVcd* tracep);
void VAdder___024root__traceCleanup(void* voidSelf, VerilatedVcd* /*unused*/);

void VAdder___024root__traceRegister(VAdder___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        tracep->addFullCb(&VAdder___024root__traceFullTop0, vlSelf);
        tracep->addChgCb(&VAdder___024root__traceChgTop0, vlSelf);
        tracep->addCleanupCb(&VAdder___024root__traceCleanup, vlSelf);
    }
}

void VAdder___024root__traceFullSub0(VAdder___024root* vlSelf, VerilatedVcd* tracep) VL_ATTR_COLD;

void VAdder___024root__traceFullTop0(void* voidSelf, VerilatedVcd* tracep) {
    VAdder___024root* const __restrict vlSelf = static_cast<VAdder___024root*>(voidSelf);
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        VAdder___024root__traceFullSub0((&vlSymsp->TOP), tracep);
    }
}

void VAdder___024root__traceFullSub0(VAdder___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        tracep->fullBit(oldp+1,(vlSelf->clock));
        tracep->fullBit(oldp+2,(vlSelf->reset));
        tracep->fullCData(oldp+3,(vlSelf->io_a),8);
        tracep->fullCData(oldp+4,(vlSelf->io_b),8);
        tracep->fullCData(oldp+5,(vlSelf->io_s),8);
        tracep->fullBit(oldp+6,(vlSelf->io_cout));
    }
}
