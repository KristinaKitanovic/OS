#include "../h/syscall_c.hpp"
#include "../h/abi.h"
#include "../lib/hw.h"
#include "../h/memory_structs.h"
#include "../lib/console.h"
#include "../h/Thread.hpp"



extern "C" ThreadContext * getRunningThreadContext();
extern int getWaitStatusForRunning();

void* mem_alloc(size_t size) {
    size_t numOfBlocks = (size + sizeof(Header) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE ;
    ThreadContext *t = getRunningThreadContext();
    return (char*)abi_mem_alloc(t, numOfBlocks) + sizeof(Header);
}
int mem_free(void* ptr){
    if(!ptr) return 0;
    Header* header = (Header*)((char*)ptr - sizeof(Header));
    ThreadContext *t = getRunningThreadContext();
    return abi_mem_free(t, header);
}

int thread_create(thread_t* handle, void(*startRoutine)(void*), void* args)
{
    size_t numOfBlocks = (2 * DEFAULT_STACK_SIZE + sizeof(Header) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    ThreadContext *t = getRunningThreadContext();
    void* result = abi_mem_alloc(t, numOfBlocks);
    void* stack = (char*)result + sizeof(Header);
    void* stack_top = (char*)stack + 2*DEFAULT_STACK_SIZE;
    return abi_thread_create(t, handle, startRoutine, args, stack_top);
}

int thread_exit(){
    ThreadContext *t = getRunningThreadContext();
    return abi_thread_exit(t);
}
void thread_dispatch(){
    ThreadContext *t = getRunningThreadContext();
    abi_thread_dispatch(t);
}
size_t mem_get_free_space(){
    return abi_mem_get_free_space();
}
size_t mem_get_largest_free_block(){
    return abi_mem_get_largest_free_block();
}

int sem_open(sem_t* handle, unsigned init){
    ThreadContext *t = getRunningThreadContext();
    return abi_sem_open(t, handle, init);
}

int sem_wait(sem_t id){
    ThreadContext *t = getRunningThreadContext();
    abi_sem_wait(t, id);
    int status = getWaitStatusForRunning();
    return status;
}

int sem_signal(sem_t id){
    ThreadContext* t = getRunningThreadContext();
    return abi_sem_signal(t, id);
}

int sem_close(sem_t id){
    ThreadContext* t = getRunningThreadContext();
    return abi_sem_close(t, id);
}

char getc () {

    ThreadContext* t = getRunningThreadContext();
    return abi_getc(t);
}

void putc (char c){
    ThreadContext* t = getRunningThreadContext();
    abi_putc(t, c);
}












