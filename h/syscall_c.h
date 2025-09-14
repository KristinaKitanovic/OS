#ifndef C_API_H
#define C_API_H

#include <stddef.h>
#include "../lib/hw.h"

#ifdef __cplusplus
extern "C" {
#endif

// C API deklaracije
void* mem_alloc(size_t size);
int mem_free(void* ptr);
int thread_create(thread_t* handle, void(*startRoutine)(void*), void* args);
int create_initial_thread(thread_t* handle, void(*startRoutine)(void*), void* args);
int thread_exit();
void thread_dispatch();
size_t mem_get_free_space();
size_t mem_get_largest_free_block();
int sem_open(sem_t* handle, unsigned init);
int sem_wait(sem_t id);
int sem_signal(sem_t id);
int sem_close(sem_t id);
void putc(char x);
char getc();

#ifdef __cplusplus
} // kraj extern "C"

// C++ operatori – samo deklaracija ovde
void* operator new(size_t size);
void* operator new[](size_t size);
void operator delete(void* ptr) noexcept;
void operator delete[](void* ptr) noexcept;

#endif

#endif
