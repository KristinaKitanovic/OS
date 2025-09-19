#ifndef POOL_HPP
#define POOL_HPP

#include "../lib/hw.h"
#include "MemoryAllocator.hpp"

template<typename T, int N>

class Pool {
public:
    Pool() : pool(nullptr), used(nullptr) {}

    void init(void* poolStartAddress, void* usedStartAddress) {
        pool = (T*)poolStartAddress;
        used = (bool*)usedStartAddress;
        for (int i = 0; i < N; i++) used[i] = false;
    }
    T* allocate() {
        for (int i = 0; i < N; i++) {
            if (!used[i]) {
                used[i] = true;
                return &pool[i];
            }
        }
        return nullptr;
    }

    void deallocate(T* obj) {
        for (int i = 0; i < N; i++) {
            if (&pool[i] == obj) {
                used[i] = false;
                return;
            }
        }
    }

private:
    T* pool;
    bool* used;
};


#endif
