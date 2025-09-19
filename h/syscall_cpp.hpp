#ifndef SYSCALL_HPP_CPP
#define SYSCALL_HPP_CPP

#include "../lib/hw.h"

void* operator new(size_t size) ;

void* operator new[](size_t size) ;

void operator delete(void* ptr) noexcept ;

void operator delete[](void* ptr) noexcept ;
#endif