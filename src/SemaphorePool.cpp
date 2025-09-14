
#include "../h/SemaphorePool.hpp"

SemaphorePool::SemaphorePool() : pool(nullptr), used(nullptr) {}

void SemaphorePool::init(void* poolStartAddress, void* usedStartAddress) {
    pool = (Semaphore*)poolStartAddress;
    used = (bool*)usedStartAddress;
    for (int i = 0; i < MAX_SEMAPHORES; i++) used[i] = false;
}

Semaphore* SemaphorePool::getSemaphoreById(sem_t id){
    for(int i = 0; i < MAX_SEMAPHORES; i++){
        if(used[i] == true && pool[i].myHandle == id){
            return &pool[i];
        }
    }
    return nullptr;
}
Semaphore* SemaphorePool::allocate() {
    for (int i = 0; i < MAX_SEMAPHORES; i++) {
        if (!used[i]) {
            used[i] = true;
            return &pool[i];
        }
    }
    return nullptr;
}

void SemaphorePool::deallocate(Semaphore* obj) {
    for (int i = 0; i < MAX_SEMAPHORES; i++) {
        if (&pool[i] == obj) {
            used[i] = false;
            return;
        }
    }
}

