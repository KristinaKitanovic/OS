#include "../h/RiscV.hpp"

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
    __asm__ volatile("csrr %[val], sepc" : [val] "=r"(val));
    return val;
}

void RiscV::w_sepc(uint64 val) {
    __asm__ volatile("csrw sepc, %[val]" :: [val] "r"(val));
}

// --- SSTATUS manipulacija ---
void RiscV::ms_sstatus(uint64 mask) {
    __asm__ volatile("csrs sstatus, %[mask]" :: [mask] "r"(mask));
}

void RiscV::mc_sstatus(uint64 mask) {
    __asm__ volatile("csrc sstatus, %[mask]" :: [mask] "r"(mask));
}

uint64 RiscV::r_sstatus() {
    uint64 val;
    __asm__ volatile("csrr %[val], sstatus" : [val] "=r"(val));
    return val;
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



void RiscV::switchToUserMode(){
    uint64 sstatus = r_sstatus();
    sstatus = sstatus & (~SSTATUS_SPP);
    sstatus = sstatus | SSTATUS_SPIE;
    w_sstatus(sstatus);

    return;
}