#include "../h/interrupt.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/Thread.hpp"
#include "../h/Semaphore.hpp"
#include "../h/RiscV.hpp"
#include "../h/codes.h"
#include "../h/Console.hpp"



extern "C" uint64 interrupt(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4, uint64 a5){
    uint64 cause = RiscV::r_scause();
    uint64 sepc  = RiscV::r_sepc();
    uint64 sstatus = RiscV::r_sstatus();

    if(cause == SYS_ECALL || cause == USER_ECALL){
        sepc += 4;

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
            case GET_C:
                //a0 = Console::Instance()->getc();
                a0 = __getc();
                break;
            case PUT_C:
                //Console::Instance()->putc((char)a2);
                __putc((char)a2);
                break;
        }
    }
    else if(cause == CONSOLE_INTERRUPT){

//        int s = plic_claim();
//        if(s == 10){
//            Console::Instance()->setInterrupt();
//        }
        console_handler();
   }


    else if(cause == TIMER_INTERRUPT){
        RiscV::mc_sip(RiscV::SIP_SSIP);
        Thread::incrementtimeSliceCounter();
        if(Thread::running && Thread::getTimeSliceCounter() >= Thread::running->getTimeSlice()){
            Thread::clearTimeSliceCounter();
            Thread::thread_dispatch_kernel();

        }

    }
    else
    {
        return a0;
    }

    RiscV::w_sepc(sepc);
    RiscV::w_sstatus(sstatus);
    return a0;

}

