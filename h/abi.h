#ifndef ABI_H
#define ABI_H
#include "../lib/hw.h"
#include "memory_structs.h"

#ifdef __cplusplus
extern "C" {
#endif

void* abi_mem_alloc(ThreadContext* c, size_t blocks);
int abi_mem_free(ThreadContext* c, void* ptr);
int abi_thread_create(ThreadContext* c, thread_t* handle, void(*startRoutine)(void*), void* args, void* stack_space);
int abi_thread_exit(ThreadContext* c);
void abi_thread_dispatch(ThreadContext* c);
size_t abi_mem_get_free_space();
size_t abi_mem_get_largest_free_block();
int abi_sem_open(ThreadContext* t, sem_t* handle, int init);
int abi_sem_wait(ThreadContext* t, sem_t id);
int abi_sem_signal(ThreadContext* t, sem_t id);
int abi_sem_close(ThreadContext* t, sem_t id);
char abi_getc(ThreadContext* t);
void abi_putc(ThreadContext* t, char c);
void abi_time_sleep(ThreadContext* t, time_t slice);
#ifdef __cplusplus
}
#endif
#endif
