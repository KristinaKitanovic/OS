#include "../lib/hw.h"
#include "../lib/console.h"
#include "../h/codes.h"
#include "../h/syscall_cpp.hpp"
#include "../h/List.hpp"
#include "../h/Thread.hpp"
#include "../h/console.hpp"
#include "../h/Scheduler.hpp"
#include "../h/syscall_cpp.hpp"
#include "../h/Pool.hpp"
#include "../h/RiscV.hpp"

extern "C" void userMain();


extern "C" {

int __cxa_atexit(void (*func)(void *), void *arg, void *d) {
    return 0;
}

} // kraj extern "C"

// __dso_handle sa C++ linkage-om (ne stavljaj ga u extern "C")
void* __dso_handle = nullptr;

extern "C" void handle_interrupt();

extern "C" void interrupt(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4, uint64 a5){
    uint64 cause, sepc;
    __asm__ volatile("csrr %[cause], scause" : [cause] "=r" (cause));
    __asm__ volatile("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    sepc += 4;
    __asm__ volatile("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));

    if(cause == SYS_ECALL || cause == USER_ECALL){
        switch(a0){
            case MEM_ALLOC_SYSCALL:
                a0 = (uint64)MemoryAllocator::Instance()->mem_alloc(a2);
                break;
            case MEM_FREE_SYSCALL:
                a0 = (uint64)MemoryAllocator::Instance()->mem_free((void*)a2);
                break;
            case CREATE_THREAD:
                a0 = Thread::create_thread_kernel((thread_t*) a2, (void(*)(void*)) a3, (void*) a4, (void*) a5);
                break;
            case THREAD_EXIT:
                a0 = Thread::thread_exit_kernel();
                break;
            case THREAD_DISPATCH:
                Thread::thread_dispatch_kernel();
                break;
            case GET_FREE_MEM:
                a0 = MemoryAllocator::Instance()->free_memory_remaining();
                break;
            case GET_LARGEST_MEM_BLOCK:
                a0 = MemoryAllocator::Instance()->get_largest_mem_block();
                break;
            case SEM_OPEN:
                a0 = Semaphore::sem_open((sem_t*)a2, (unsigned)a3);
                break;
            case SEM_WAIT:
                a0 = Semaphore::sem_wait((sem_t)a2);
                break;
            case SEM_SIGNAL:
                a0 = Semaphore::sem_signal((sem_t)a2);
                break;
            case SEM_CLOSE:
                a0 = Semaphore::sem_close((sem_t)a2);
                break;
        }
    }

//    if(cause == TIMER_INTERRUPT){
//        Thread::incrementtimeSliceCounter();
//        if(Thread::getTimeSliceCounter() >= Thread::running->getTimeSlice()){
//            Thread::clearTimeSliceCounter();
//            Thread::thread_dispatch_kernel();
//            putc('T');
//        }
//        RiscV::mc_sip(RiscV::SIP_SSIP);
//    }


    return;
}


void userMainWrapper(void* args){

    //RiscV::switchToUserMode();
    userMain();
}





void main() {


    MemoryAllocator::Instance();

    __asm__ volatile("csrw stvec, %[val]" : : [val] "r" (&handle_interrupt));

    uint64 stack_start;
    if((uint64)HEAP_START_ADDR % MEM_BLOCK_SIZE == 0){
        stack_start = (uint64)HEAP_START_ADDR;
    }
    else {
        stack_start = (uint64)HEAP_START_ADDR + (MEM_BLOCK_SIZE - (uint64)HEAP_START_ADDR % MEM_BLOCK_SIZE);
    }
    uint64 sp = stack_start + (uint64)DEFAULT_STACK_SIZE;
    __asm__ volatile("mv sp, %[sp]" : : [sp] "r" (sp));
    __asm__ volatile("mv s0, %[sp]" : : [sp] "r" (sp));
    thread_t pid;
    thread_create(&pid, userMainWrapper, nullptr);


}



