#include "../h/abi.h"
#include "../h/codes.h"

uint64 mem_alloc_trap(ThreadContext* c, size_t blocks);
int thread_create_trap(ThreadContext* c, thread_t* handle, void(*startRoutine)(void*), void* args, void* stack_space);
int mem_free_trap(ThreadContext* c, void* ptr);
int thread_exit_trap(ThreadContext* c);
void thread_dispatch_trap(ThreadContext* c);
size_t mem_get_free_space_trap();
size_t mem_get_largest_free_block_trap();
int sem_open_trap(ThreadContext *t, sem_t* handle, int init);
int sem_wait_trap(ThreadContext* t, sem_t id);
int sem_signal_trap(ThreadContext* t, sem_t id);
int sem_close_trap(ThreadContext* t, sem_t id);
char getc_trap(ThreadContext* t);
void putc_trap(ThreadContext* t, char c);


void* abi_mem_alloc(ThreadContext* c, size_t blocks) {

    uint64 result =  mem_alloc_trap(c, blocks);
    void* res = (void*)result;
    return res;

}

int abi_mem_free(ThreadContext* c, void* ptr){
    return mem_free_trap(c, ptr);
}

int abi_thread_create(ThreadContext* c, thread_t* handle, void(*startRoutine)(void*), void* args, void* stack_space){
    return thread_create_trap(c, handle, startRoutine, args, stack_space);
}
int abi_thread_exit(ThreadContext* c){
    return thread_exit_trap(c);
}

void abi_thread_dispatch(ThreadContext* c){
   return thread_dispatch_trap(c);
}

size_t abi_mem_get_free_space(){
    return mem_get_free_space_trap();
}
size_t abi_mem_get_largest_free_block(){
    return mem_get_largest_free_block_trap();
}
int abi_sem_open(ThreadContext* t, sem_t* handle, int init){
    return sem_open_trap(t, handle, init);
}
int abi_sem_wait(ThreadContext* t, sem_t id){
    return sem_wait_trap(t, id);
}
int abi_sem_signal(ThreadContext* t, sem_t id){
    return sem_signal_trap(t, id);
}
int abi_sem_close(ThreadContext* t, sem_t id){
    return sem_close_trap(t, id);
}

char abi_getc(ThreadContext* t){
    return getc_trap(t);
}
void abi_putc(ThreadContext* t, char c){
     putc_trap(t, c);
}