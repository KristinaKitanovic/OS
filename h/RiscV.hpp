#ifndef RISCV_HPP
#define RISCV_HPP
#include "../lib/hw.h"

class RiscV {
public:
    static uint64 last_sepc;
    static uint64 last_sstatus;

    // Bit maskovi za SIP (interrupt pending)
    enum BitMask : uint64 {
        SIP_SSIP = (1ULL << 1),  // Software interrupt
        SIP_STIP = (1ULL << 5),  // Timer interrupt
        SIP_SEIP = (1ULL << 8)   // External interrupt

    };

    // Bit maskovi za SSTATUS (status register)
    enum BitMaskStatus : uint64 {
        SSTATUS_SIE  = (1ULL << 1),  // Supervisor Interrupt Enable
        SSTATUS_SPIE = (1ULL << 5),  // Supervisor Previous Interrupt Enable
        SSTATUS_SPP  = (1ULL << 8)   // Supervisor Previous Privilege
    };

    // Pocetno stanje sstatus za niti
    static uint64 initialSstatusForThread();

    // --- SIP manipulacija ---
    static void ms_sip(uint64 mask);  // set mask
    static void mc_sip(uint64 mask);  // clear mask
    static uint64 r_sip();            // read

    // --- STVEC manipulacija ---
    static uint64 r_stvec();
    static void w_stvec(uint64 val);

    static uint64 r_ra();
    static void w_ra(uint64 val);

    // --- SEPC manipulacija ---
    static uint64 r_sepc();
    static void w_sepc(uint64 val);

    // --- SSTATUS manipulacija ---
    static void ms_sstatus(uint64 mask);  // set mask
    static void mc_sstatus(uint64 mask);  // clear mask
    static uint64 r_sstatus();            // read
    static void w_sstatus(uint64 val);    // write


    static void switchToUserMode();
    static uint64 r_scause();


    static void w_last_sstatus();
    static void w_last_sepc();
};

#endif
