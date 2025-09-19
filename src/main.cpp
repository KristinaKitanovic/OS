#include "../lib/hw.h"
#include "../lib/console.h"
#include "../h/codes.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/List.hpp"
#include "../h/Thread.hpp"
#include "../h/console.hpp"
#include "../h/Scheduler.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/Pool.hpp"
#include "../h/RiscV.hpp"
#include "../h/interrupt.hpp"
#include "../h/syscall_c.hpp"
#include "../h/syscall_cpp.hpp"


extern "C" void userMain();


extern "C" {

int __cxa_atexit(void (*func)(void *), void *arg, void *d) {
    return 0;
}

}
void* __dso_handle = nullptr;


void userMainWrapper(void* args){

    //RiscV::switchToUserMode();
    userMain();
}
void idleBody(void*) {
    while (true){
        thread_dispatch();
    }
}

void main() {



    __asm__ volatile("csrw stvec, %[val]" : : [val] "r" (&handle_interrupt));

//    uint64 stack_start;
//    if((uint64)HEAP_START_ADDR % MEM_BLOCK_SIZE == 0){
//        stack_start = (uint64)HEAP_START_ADDR;
//    }
//    else {
//        stack_start = (uint64)HEAP_START_ADDR + (MEM_BLOCK_SIZE - (uint64)HEAP_START_ADDR % MEM_BLOCK_SIZE);
//    }
//    uint64 sp = stack_start + 3*(uint64)DEFAULT_STACK_SIZE;
    size_t numOfBlocks = (2 * DEFAULT_STACK_SIZE + sizeof(Header) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
     void* result = MemoryAllocator::Instance()->mem_alloc(numOfBlocks);
    void* stack = (char*)result + sizeof(Header);
    void* stack_top = (char*)stack + 2*DEFAULT_STACK_SIZE;

    __asm__ volatile("mv sp, %[sp]" : : [sp] "r" ((uint64)(stack_top)));

     numOfBlocks = (2 * DEFAULT_STACK_SIZE + sizeof(Header) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;

    result = MemoryAllocator::Instance()->mem_alloc(numOfBlocks);
    stack = (char*)result + sizeof(Header);
    stack_top = (char*)stack + 2*DEFAULT_STACK_SIZE;
    thread_t  pid;
    Thread::create_thread_kernel(&pid, idleBody, nullptr, stack_top);
    result = MemoryAllocator::Instance()->mem_alloc(numOfBlocks);
    stack = (char*)result + sizeof(Header);
    stack_top = (char*)stack + 2*DEFAULT_STACK_SIZE;

    Thread::create_thread_kernel(&pid, userMainWrapper, nullptr, stack_top);
    Console::Instance();
    thread_dispatch();

}



