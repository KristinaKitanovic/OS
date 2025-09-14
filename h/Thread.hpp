#ifndef THREAD_HPP
#define THREAD_HPP
#include "memory_structs.h"
#include "List.hpp"
#include "../lib/hw.h"
#include "RiscV.hpp"
#ifdef __cplusplus
extern "C" {
#endif

void save_context_kernel_mode(ThreadContext* oldContext);
void restore_context_kernel_mode(ThreadContext* newContext);
void start_thread_for_the_first_time_dispatch(ThreadContext* newContext);
void thread_wrapper(ThreadContext* context, ThreadWrapperArgs* args);
extern "C" void thread_cpp_entry_point(ThreadContext* tc, ThreadWrapperArgs* wa);


#ifdef __cplusplus
}
#endif

class Thread{
    friend class ThreadPool;
public:
    Thread (void (*body)(void*), void* arg, void* stack_top);
    Thread();
    virtual ~Thread ();
    int start ();
    static int create_thread_kernel(thread_t* handle, void(*routine)(void*) , void* args, void* stack_top);
    static int sleep (time_t);
    static void* operator new(size_t size);
    static void operator delete(void*) noexcept;
    static Thread* running;
    static int thread_exit_kernel();
    static void thread_dispatch_kernel();
    static void wrapper();
    static void clearTimeSliceCounter();
    static uint64 getTimeSliceCounter();
    static void incrementtimeSliceCounter();
    static void dispatch();
    uint64 getTimeSlice();
    ThreadContext* getContext();
    ThreadWrapperArgs* getWrapperArgs();
    Thread* next;
    int semWaitStatus;

    virtual void run (){};
private:
    static int cnt;
    static uint64 timeSliceCounter;

    thread_t threadId;
    ThreadContext context;
    ThreadWrapperArgs wrapperArgs;
    List<Thread>* suspended;
    void (*body)(void*);
    void* arg;

};

#endif
