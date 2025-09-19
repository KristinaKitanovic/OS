#include "../h/RiscV.hpp"


uint64 RiscV::last_sepc = 0;
uint64 RiscV::last_sstatus = 0;

// --- Initial SSTATUS za novu nit ---
uint64 RiscV::initialSstatusForThread() {
    uint64 sstatus = 0;

    // SPP = 0 → naredni sret instrukcija ide u user mode
    sstatus &= ~(1UL << 8);

    // SPIE = 1 → prekidi dozvoljeni kada se vrati u user mode
    sstatus |= (1UL << 5);

    // SIE = 0 → trenutno maskirani svi prekidi u kernel modu
    sstatus &= ~(1UL << 1);

    return sstatus;
}

// --- SIP manipulacija ---
void RiscV::ms_sip(uint64 mask) {
    __asm__ volatile("csrs sip, %[mask]" :: [mask] "r"(mask));
}

void RiscV::mc_sip(uint64 mask) {
    __asm__ volatile("csrc sip, %[mask]" :: [mask] "r"(mask));
}

uint64 RiscV::r_sip() {
    uint64 val;
    __asm__ volatile("csrr %[val], sip" : [val] "=r"(val));
    return val;
}

// --- STVEC manipulacija ---
uint64 RiscV::r_stvec() {
    uint64 val;
    __asm__ volatile("csrr %[val], stvec" : [val] "=r"(val));
    return val;
}

void RiscV::w_stvec(uint64 val) {
    __asm__ volatile("csrw stvec, %[val]" :: [val] "r"(val));
}

// --- SEPC manipulacija ---


 uint64 RiscV::r_sepc() {
    uint64 val;
    __asm__ volatile("csrr %0, sepc" : "=r"(val));
    last_sepc = val;
    return val;
}

 uint64 RiscV::r_sstatus() {
    uint64 val;
    __asm__ volatile("csrr %0, sstatus" : "=r"(val));
    last_sstatus = val;
    return val;
}
// --- SSTATUS manipulacija ---
void RiscV::ms_sstatus(uint64 mask) {
    __asm__ volatile("csrs sstatus, %[mask]" :: [mask] "r"(mask));
}

void RiscV::mc_sstatus(uint64 mask) {
    __asm__ volatile("csrc sstatus, %[mask]" :: [mask] "r"(mask));
}



void RiscV::w_sstatus(uint64 val) {
    __asm__ volatile("csrw sstatus, %[val]" :: [val] "r"(val));
}


uint64 RiscV::r_ra() {
    uint64 val;
    __asm__ volatile("mv %[val], ra" : [val] "=r"(val));
    return val;
}

void RiscV::w_ra(uint64 val) {
    __asm__ volatile("mv ra, %[val]" :: [val] "r"(val));
}

void RiscV::w_sepc(uint64 val) {
    __asm__ volatile("csrw sepc, %0" :: "r"(val));
}


void RiscV::switchToUserMode(){
    __asm__ volatile("csrc sstatus, %0" ::"r"(SSTATUS_SPP)); // prebaci u U-mode
    __asm__  volatile("csrw sepc, ra");
    __asm__  volatile("sret");
}

void RiscV::w_last_sepc() {
    __asm__ volatile("csrw sepc, %0" :: "r"(last_sepc));
}

void RiscV::w_last_sstatus() {
    __asm__ volatile("csrw sstatus, %0" :: "r"(last_sstatus));
}
uint64 RiscV::r_scause() {
    uint64 val;
    __asm__ volatile("csrr %0, scause" : "=r"(val));

    return val;
}