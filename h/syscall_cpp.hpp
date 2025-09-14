#ifndef SYSCALL_CPP_HPP
#define SYSCALL_CPP_HPP
#include "../lib/hw.h"
#include "memory_structs.h"
#include "ThreadPool.hpp"
#include "SemaphorePool.hpp"
#include "Pool.hpp"
#include "Thread.hpp"
#include "syscall_c.h"
#include "Console.hpp"

#ifdef __cplusplus
extern "C" {
#endif

/*
int thread_create(thread_t* handle, void(*startRoutine)(void*), void* args);
int thread_exit();
void thread_dispatch();
size_t mem_get_free_space();
size_t get_largest_mem_block();
int sem_open (sem_t* handle, unsigned init);
int sem_wait(sem_t id);
int sem_signal(sem_t id);
int sem_close(sem_t id);
*/
#ifdef __cplusplus
}
#endif

class MemoryAllocator{
public:
    static MemoryAllocator* Instance();
    //jel ove treba da budu public??
    void* mem_alloc(uint64 numOfBlocks);
    int mem_free(void* ptr);
    void* mem_alloc_for_managers(size_t N, size_t sizeOfElem);
    int mem_free_kernel(void* ptr, size_t N, size_t sizeOfElem);
    size_t free_memory_remaining();
    size_t get_largest_mem_block();
    ThreadPool& getThreadPool();
    SemaphorePool& getSemaphorePool();

private:
    MemoryAllocator();
    FreeMem* fmem_head;
    uint64 align(uint64 addr);
    void tryToJoin(FreeMem* node);
    ThreadPool threadPool;
    SemaphorePool semaphorePool;
    //Pool<Thread, MAX_THREADS> threadPool;
    //Pool<Semaphore, MAX_SEMAPHORES> semaphorePool;

};



#endif