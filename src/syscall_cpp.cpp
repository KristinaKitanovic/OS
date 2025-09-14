#include "../h/syscall_cpp.hpp"
#include "../h/syscall_c.h"
#include "../lib/hw.h"
#include "../h/Thread.hpp"

// Povratak statusa čekanja za tekuću nit
int getWaitStatusForRunning() {
    return Thread::running->semWaitStatus;
}

// Singleton MemoryAllocator
MemoryAllocator* MemoryAllocator::Instance() {
    static MemoryAllocator instance;
    return &instance;
}

// Poravnanje adrese
uint64 MemoryAllocator::align(uint64 addr) {
    if (addr % MEM_BLOCK_SIZE == 0) return addr;
    return addr + (MEM_BLOCK_SIZE - addr % MEM_BLOCK_SIZE);
}

// Konstruktor MemoryAllocator-a
MemoryAllocator::MemoryAllocator() {
    fmem_head = (FreeMem*)(align((uint64)HEAP_START_ADDR) + (uint64)DEFAULT_STACK_SIZE);
    fmem_head->next = nullptr;
    fmem_head->prev = nullptr;

    uint64 totalBlocks = (((uint64)HEAP_END_ADDR - (uint64)fmem_head) -
                          (((uint64)HEAP_END_ADDR - (uint64)fmem_head) % MEM_BLOCK_SIZE)) / MEM_BLOCK_SIZE;
    fmem_head->size = totalBlocks;

    void* threadManagerPoolAddress = mem_alloc_for_managers(MAX_THREADS, sizeof(Thread));
    void* threadManagerUsedArrayAddress = mem_alloc_for_managers(MAX_THREADS, sizeof(bool));
    threadPool.init(threadManagerPoolAddress, threadManagerUsedArrayAddress);

    void* semaphoreManagerPoolAddress = mem_alloc_for_managers(MAX_SEMAPHORES, sizeof(Semaphore));
    void* semaphoreManagerUsedArrayAddress = mem_alloc_for_managers(MAX_SEMAPHORES, sizeof(bool));
    semaphorePool.init(semaphoreManagerPoolAddress, semaphoreManagerUsedArrayAddress);
}

ThreadPool& MemoryAllocator::getThreadPool() {
    return threadPool;
}

SemaphorePool& MemoryAllocator::getSemaphorePool() {
    return semaphorePool;
}

// Definicije C++ operatora new/delete
void* operator new(size_t size) {
    return mem_alloc(size);
}

void* operator new[](size_t size) {
    return mem_alloc(size);
}

void operator delete(void* ptr) noexcept {
mem_free(ptr);
}

void operator delete[](void* ptr) noexcept {
mem_free(ptr);
}

/*
int thread_create(thread_t* handle, void(*startRoutine)(void*), void* args){
    return ::thread_create(handle, startRoutine, args);
}
int thread_exit(){
    return ::thread_exit();
}
void thread_dispatch(){
    ::thread_dispatch();
}
size_t mem_get_free_space(){
    return ::mem_get_free_space();
}
size_t mem_get_largest_free_block(){
    return ::mem_get_largest_free_block();
}

int sem_open(sem_t* handle, unsigned init){
    return ::sem_open(handle, init);
}

int sem_wait(sem_t id){
    ::sem_wait(id);
    int status = getWaitStatusForRunning();
    return status;
}

int sem_signal(sem_t id){
    return ::sem_signal(id);
}

int sem_close(sem_t id){
    return ::sem_close(id);
}
*/
void* MemoryAllocator::mem_alloc(uint64 numOfBlocks) {
    FreeMem* temp = fmem_head;

    while(temp)
    {
        if(temp->size >= numOfBlocks)
        {
            char* addr = (char*)temp;

            if(temp->size == numOfBlocks){
                // ceo blok se koristi - ukloni ga iz liste
                if(temp->prev)
                    temp->prev->next = temp->next;
                else
                {
                    fmem_head = temp->next;

                }

                if(temp->next)
                    temp->next->prev = temp->prev;
            }
            else
            {

                FreeMem* newnode = (FreeMem*)((char*)temp + numOfBlocks * MEM_BLOCK_SIZE);

                newnode->size = temp->size - numOfBlocks;
                newnode->next = temp->next;
                newnode->prev = temp->prev;

                if(newnode->prev)
                    newnode->prev->next = newnode;
                else
                {
                    fmem_head = newnode;

                }


                if(newnode->next)
                    newnode->next->prev = newnode;
            }
            Header* header = (Header*)addr;
            header->numOfBlocks = numOfBlocks;

            return addr;
        }

        temp = temp->next;
    }

    return nullptr;
}
void* MemoryAllocator::mem_alloc_for_managers(size_t N, size_t sizeOfElem){
    size_t numOfBlocks = (N * sizeOfElem + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    FreeMem* temp = fmem_head;

    while(temp)
    {
        if(temp->size >= numOfBlocks)
        {
            char* addr = (char*)temp;

            if(temp->size == numOfBlocks){
                // ceo blok se koristi - ukloni ga iz liste
                if(temp->prev)
                    temp->prev->next = temp->next;
                else
                {
                    fmem_head = temp->next;
                }


                if(temp->next)
                    temp->next->prev = temp->prev;
            }
            else
            {

                FreeMem* newnode = (FreeMem*)((char*)temp + numOfBlocks * MEM_BLOCK_SIZE);

                newnode->size = temp->size - numOfBlocks;
                newnode->next = temp->next;
                newnode->prev = temp->prev;

                if(newnode->prev)
                    newnode->prev->next = newnode;
                else
                {
                    fmem_head = newnode;
                }


                if(newnode->next)
                    newnode->next->prev = newnode;
            }


            return addr;
        }

        temp = temp->next;
    }

    return nullptr;
}

void MemoryAllocator::tryToJoin(FreeMem *node) {
    if(!node) return;
    FreeMem* nextnode = node->next;
    if(nextnode && (char*)nextnode == ((char*)node + node->size * MEM_BLOCK_SIZE)){
        node->size += nextnode->size;
        node->next = nextnode->next;
        if(node->next)node->next->prev = node;
    }
}

int MemoryAllocator::mem_free(void *ptr) {
    if(!ptr) return -1;

    Header* header = (Header*)ptr;

    //outside of the heap error
    if((uint64)header < (uint64)HEAP_START_ADDR || (uint64)header > (uint64)HEAP_END_ADDR) return -2;
    //not aligned to a block error
    //if(((char*)header - (char*)fmem_head) % MEM_BLOCK_SIZE != 0) return -3;

    FreeMem* newnode = (FreeMem*)header;
    newnode->size = header->numOfBlocks;
    newnode->prev = nullptr;
    newnode->next = nullptr;
    FreeMem* temp = 0;
    if(!fmem_head || (char*)fmem_head > (char*)newnode)
    {
        temp = 0;
    }
    else
    {
        temp = fmem_head;
        while(temp->next && (char*)temp->next < (char*)newnode)
        {
            temp = temp->next;
        }
    }
    if(temp)
    {
        newnode->next = temp->next;
    }
    else {
        newnode->next = fmem_head;
    }
    if(newnode->next)
    {
        newnode->next->prev = newnode;
    }
    if(temp){
        temp->next = newnode;
        newnode->prev = temp;
    }
    else
    {
        fmem_head = newnode;
    }
    tryToJoin(newnode);
    tryToJoin(temp);
    return 0;
}

int MemoryAllocator::mem_free_kernel(void* ptr, size_t N, size_t sizeOfElem){
    if(!ptr) return -1;


    //outside of the heap error
    if((uint64)ptr < (uint64)HEAP_START_ADDR || (uint64)ptr > (uint64)HEAP_END_ADDR) return -2;
    //not aligned to a block error
    if(((char*)ptr - (char*)fmem_head) % MEM_BLOCK_SIZE != 0) return -3;
    size_t numOfBlocks = (N * sizeOfElem + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;

    FreeMem* newnode = (FreeMem*)ptr;
    newnode->size = numOfBlocks;
    newnode->prev = nullptr;
    newnode->next = nullptr;
    FreeMem* temp = 0;
    if(!fmem_head || (char*)fmem_head > (char*)newnode)
    {
        temp = 0;
    }
    else
    {
        temp = fmem_head;
        while(temp->next && (char*)temp->next < (char*)newnode)
        {
            temp = temp->next;
        }
    }
    if(temp)
    {
        newnode->next = temp->next;
    }
    else {
        newnode->next = fmem_head;
    }
    if(newnode->next)
    {
        newnode->next->prev = newnode;
    }
    if(temp){
        temp->next = newnode;
        newnode->prev = temp;
    }
    else
    {
        fmem_head = newnode;
    }
    tryToJoin(newnode);
    tryToJoin(temp);
    return 0;
}

size_t MemoryAllocator::free_memory_remaining() {
    return fmem_head->size * MEM_BLOCK_SIZE;
}
size_t MemoryAllocator::get_largest_mem_block() {
    if(fmem_head == nullptr) return 0;
    FreeMem* temp = fmem_head;
    size_t maxBlocks = temp->size;
    while(temp)
    {
        if(temp->size > maxBlocks){
            maxBlocks = temp->size;
        }
        temp = temp->next;
    }
    return maxBlocks * MEM_BLOCK_SIZE;

}
