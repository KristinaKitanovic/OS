#ifndef SYSCALL_CPP_HPP
#define SYSCALL_CPP_HPP
#include "../lib/hw.h"
#include "memory_structs.h"
#include "ThreadPool.hpp"
#include "SemaphorePool.hpp"
#include "Pool.hpp"
#include "Thread.hpp"
#include "syscall_c.hpp"
#include "Console.hpp"

#ifdef __cplusplus
extern "C" {
#endif
#ifdef __cplusplus
}
#endif

class MemoryAllocator{
public:
    static MemoryAllocator* Instance();
    ThreadPool& getThreadPool();
    SemaphorePool& getSemaphorePool();
    size_t free_memory_remaining();
    size_t get_largest_mem_block();
    void* mem_alloc(uint64 numOfBlocks);
    int mem_free(void* ptr);
private:
    MemoryAllocator();
    FreeMem* fmem_head;
    uint64 align(uint64 addr);
    void tryToJoin(FreeMem* node);
    ThreadPool threadPool;
    SemaphorePool semaphorePool;

    void* mem_alloc_for_managers(size_t N, size_t sizeOfElem);
    int mem_free_kernel(void* ptr, size_t N, size_t sizeOfElem);

};



#endif