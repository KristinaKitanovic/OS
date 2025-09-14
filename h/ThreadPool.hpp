#ifndef THREAD_POOL_HPP
#define THREAD_POOL_HPP
#include "Thread.hpp"
#include "../lib/hw.h"

class ThreadPool {
public:
    ThreadPool();

    void init(void* poolStartAddress, void* usedStartAddress);

    Thread* getSemaphoreById(thread_t id);

    Thread* allocate();

    void deallocate(Thread* obj);

private:
    Thread* pool;
    bool* used;
};
#endif