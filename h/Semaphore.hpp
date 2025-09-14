#ifndef SEMAPHORE_HPP
#define SEMAPHORE_HPP
#include "../lib/hw.h"

#include "List.hpp"
class Thread;



class Semaphore {
    friend class SemaphorePool;
public:
    Semaphore (unsigned init = 1);
    virtual ~Semaphore ();
    int wait ();
    int signal ();
    static int sem_open(sem_t* handle, unsigned init);
    static int sem_close(sem_t id);
    static int sem_wait(sem_t id);
    static int sem_signal(sem_t id);
    static void* operator new(size_t size);
    static void operator delete(void*) noexcept;

private:
    sem_t myHandle;
    int val;
    static int cnt;
    List<Thread> waiting;

};


#endif