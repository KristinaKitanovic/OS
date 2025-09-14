#ifndef SEMAPHORE_POOL_HPP
#define SEMAPHORE_POOL_HPP
#include "Semaphore.hpp"


class SemaphorePool {
public:
    SemaphorePool();

    void init(void* poolStartAddress, void* usedStartAddress);

    Semaphore* getSemaphoreById(sem_t id);

    Semaphore* allocate();

    void deallocate(Semaphore* obj);

private:
    Semaphore* pool;
    bool* used;
};
#endif