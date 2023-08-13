// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VAdder__Syms.h"


VL_ATTR_COLD void VAdder___024root__trace_init_sub__TOP__0(VAdder___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAdder___024root__trace_init_sub__TOP__0\n"); );
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->declBit(c+1,"clock", false,-1);
    tracep->declBit(c+2,"reset", false,-1);
    tracep->declBus(c+3,"io_a", false,-1, 7,0);
    tracep->declBus(c+4,"io_b", false,-1, 7,0);
    tracep->declBus(c+5,"io_s", false,-1, 7,0);
    tracep->declBit(c+6,"io_cout", false,-1);
    tracep->pushNamePrefix("Adder ");
    tracep->declBit(c+1,"clock", false,-1);
    tracep->declBit(c+2,"reset", false,-1);
    tracep->declBus(c+3,"io_a", false,-1, 7,0);
    tracep->declBus(c+4,"io_b", false,-1, 7,0);
    tracep->declBus(c+5,"io_s", false,-1, 7,0);
    tracep->declBit(c+6,"io_cout", false,-1);
    tracep->popNamePrefix(1);
}

VL_ATTR_COLD void VAdder___024root__trace_init_top(VAdder___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAdder___024root__trace_init_top\n"); );
    // Body
    VAdder___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void VAdder___024root__trace_full_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void VAdder___024root__trace_chg_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void VAdder___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/);

VL_ATTR_COLD void VAdder___024root__trace_register(VAdder___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAdder___024root__trace_register\n"); );
    // Body
    tracep->addFullCb(&VAdder___024root__trace_full_top_0, vlSelf);
    tracep->addChgCb(&VAdder___024root__trace_chg_top_0, vlSelf);
    tracep->addCleanupCb(&VAdder___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void VAdder___024root__trace_full_sub_0(VAdder___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void VAdder___024root__trace_full_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAdder___024root__trace_full_top_0\n"); );
    // Init
    VAdder___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VAdder___024root*>(voidSelf);
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    VAdder___024root__trace_full_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void VAdder___024root__trace_full_sub_0(VAdder___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAdder___024root__trace_full_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    // Body
    bufp->fullBit(oldp+1,(vlSelf->clock));
    bufp->fullBit(oldp+2,(vlSelf->reset));
    bufp->fullCData(oldp+3,(vlSelf->io_a),8);
    bufp->fullCData(oldp+4,(vlSelf->io_b),8);
    bufp->fullCData(oldp+5,(vlSelf->io_s),8);
    bufp->fullBit(oldp+6,(vlSelf->io_cout));
}
