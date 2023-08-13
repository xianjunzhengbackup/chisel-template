// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VAdder.h"
#include "VAdder__Syms.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

VAdder::VAdder(VerilatedContext* _vcontextp__, const char* _vcname__)
    : vlSymsp{new VAdder__Syms(_vcontextp__, _vcname__, this)}
    , clock{vlSymsp->TOP.clock}
    , reset{vlSymsp->TOP.reset}
    , io_a{vlSymsp->TOP.io_a}
    , io_b{vlSymsp->TOP.io_b}
    , io_s{vlSymsp->TOP.io_s}
    , io_cout{vlSymsp->TOP.io_cout}
    , rootp{&(vlSymsp->TOP)}
{
}

VAdder::VAdder(const char* _vcname__)
    : VAdder(nullptr, _vcname__)
{
}

//============================================================
// Destructor

VAdder::~VAdder() {
    delete vlSymsp;
}

//============================================================
// Evaluation loop

void VAdder___024root___eval_initial(VAdder___024root* vlSelf);
void VAdder___024root___eval_settle(VAdder___024root* vlSelf);
void VAdder___024root___eval(VAdder___024root* vlSelf);
QData VAdder___024root___change_request(VAdder___024root* vlSelf);
#ifdef VL_DEBUG
void VAdder___024root___eval_debug_assertions(VAdder___024root* vlSelf);
#endif  // VL_DEBUG
void VAdder___024root___final(VAdder___024root* vlSelf);

static void _eval_initial_loop(VAdder__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    VAdder___024root___eval_initial(&(vlSymsp->TOP));
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    vlSymsp->__Vm_activity = true;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial loop\n"););
        VAdder___024root___eval_settle(&(vlSymsp->TOP));
        VAdder___024root___eval(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = VAdder___024root___change_request(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("Adder.v", 1, "",
                "Verilated model didn't DC converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = VAdder___024root___change_request(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

void VAdder::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VAdder::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VAdder___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    vlSymsp->__Vm_activity = true;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        VAdder___024root___eval(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = VAdder___024root___change_request(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("Adder.v", 1, "",
                "Verilated model didn't converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = VAdder___024root___change_request(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

//============================================================
// Invoke final blocks

void VAdder::final() {
    VAdder___024root___final(&(vlSymsp->TOP));
}

//============================================================
// Utilities

VerilatedContext* VAdder::contextp() const {
    return vlSymsp->_vm_contextp__;
}

const char* VAdder::name() const {
    return vlSymsp->name();
}

//============================================================
// Trace configuration

void VAdder___024root__traceInitTop(VAdder___024root* vlSelf, VerilatedVcd* tracep);

static void traceInit(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    VAdder___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VAdder___024root*>(voidSelf);
    VAdder__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->module(vlSymsp->name());
    tracep->scopeEscape(' ');
    VAdder___024root__traceInitTop(vlSelf, tracep);
    tracep->scopeEscape('.');
}

void VAdder___024root__traceRegister(VAdder___024root* vlSelf, VerilatedVcd* tracep);

void VAdder::trace(VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addInitCb(&traceInit, &(vlSymsp->TOP));
    VAdder___024root__traceRegister(&(vlSymsp->TOP), tfp->spTrace());
}
