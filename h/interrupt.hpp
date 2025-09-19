#ifndef INTERRUPT_HPP
#define INTERRUPT_HPP
#include "../lib/hw.h"

extern "C" void handle_interrupt();

extern "C" uint64 interrupt(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4, uint64 a5);

#endif