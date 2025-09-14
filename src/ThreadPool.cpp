#include "../h/ThreadPool.hpp"

ThreadPool::ThreadPool() : pool(nullptr), used(nullptr) {}

void ThreadPool::init(void* poolStartAddress, void* usedStartAddress) {
    pool = (Thread*)poolStartAddress;
    used = (bool*)usedStartAddress;
    for (int i = 0; i < MAX_THREADS; i++) used[i] = false;
}

Thread* ThreadPool::getSemaphoreById(thread_t id){
    for(int i = 0; i < MAX_THREADS; i++){
        if(used[i] == true && pool[i].threadId == id){
            return &pool[i];
        }
    }
    return nullptr;
}
Thread* ThreadPool::allocate() {
    for (int i = 0; i < MAX_THREADS; i++) {
        if (!used[i]) {
            used[i] = true;
            return &pool[i];
        }
    }
    return nullptr;
}

void ThreadPool::deallocate(Thread* obj) {
    for (int i = 0; i < MAX_THREADS; i++) {
        if (&pool[i] == obj) {
            used[i] = false;
            return;
        }
    }
}

