#ifndef ABI_H
#define ABI_H
#include "../lib/hw.h"
#include "memory_structs.h"


void* abi_mem_alloc(ThreadContext* ,size_t blocks);
int abi_mem_free(ThreadContext*, void* ptr);
int abi_thread_create(ThreadContext*, thread_t* handle, void(*startRoutine)(void*), void* args, void* stack_space);
int abi_thread_exit(ThreadContext*);
void abi_thread_dispatch(ThreadContext*);
size_t abi_mem_get_free_space();
size_t abi_mem_get_largest_free_block();
int abi_sem_open(ThreadContext* t, sem_t* handle, int init);
int abi_sem_wait(ThreadContext* t, sem_t id);
int abi_sem_signal(ThreadContext* t, sem_t id);
int abi_sem_close(ThreadContext* t, sem_t id);
#endif
