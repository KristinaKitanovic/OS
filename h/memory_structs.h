#ifndef MEMORY_STRUCTS_H
#define MEMORY_STRUCTS_H
#include "../lib/hw.h"


typedef struct FreeMem{
    struct FreeMem* next;
    struct FreeMem* prev;
    size_t size;
}FreeMem;

typedef struct Header{
    uint64 numOfBlocks;
}Header;

typedef struct ThreadContext{
    uint64 pc;
    uint64* userStack;
    uint64* kernelStack;
    uint64 sp;
    uint64 ssp;
    uint64 sstatus;
    uint64 startedOnce;
    uint64 wasActive;
    uint64 timeSlice;
}ThreadContext;

typedef struct ThreadWrapperArgs{
    void (*userFunc)(void*);
    void* userArgs;
}ThreadWrapperArgs;
#endif
