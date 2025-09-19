#ifndef THREAD_HPP
#define THREAD_HPP
#include "memory_structs.h"
#include "List.hpp"
#include "../lib/hw.h"
#include "RiscV.hpp"
#ifdef __cplusplus
extern "C" {
#endif

void restore_context_kernel_mode(ThreadContext* newContext);

void context_switch(ThreadContext* c1, ThreadContext* c2);

#ifdef __cplusplus
}
#endif

class Thread{
    friend class ThreadPool;
public:
    Thread();
    Thread(void(*kernelBody)(void*), void* arg);
    virtual ~Thread ();
    int start ();
    static void dispatch();
    static void* operator new(size_t size);
    static void operator delete(void*) noexcept;
    virtual void run (){};
    static Thread* running;
    int semWaitStatus;
    ThreadContext* getContext();
    ThreadWrapperArgs* getWrapperArgs();
    static int create_thread_kernel(thread_t* handle, void(*routine)(void*) , void* args, void* stack_top);
    static int sleep (time_t);
    static int thread_exit_kernel();
    static void thread_dispatch_kernel();
    Thread* next;
    static void threadWrapper();
    static void kernelThreadWrapper();
    void clearTimeSliceCounter();
    uint64 getTimeSliceCounter();
    void incrementtimeSliceCounter();
    bool isSleeping() const { return sleeping; }
    void setSleeping(bool value) { sleeping = value; }


    uint64 getTimeSlice();
private:
    static int cnt;
    uint64 timeSliceCounter;

    bool sleeping;
    thread_t threadId;

    ThreadContext context;
    ThreadWrapperArgs wrapperArgs;
    List<Thread>* suspended;
    void (*body)(void*);
    void* arg;

    Thread (void (*body)(void*), void* arg, void* stack_top);

    static void wrapper();


};

#endif
