#ifndef SCHEDULER_HPP
#define SCHEDULER_HPP
#include "Thread.hpp"

class Scheduler
{
public:
    Scheduler();

    void put(Thread* t);
    Thread* get();
private:
    Thread* head;
    Thread* tail;
};

extern Scheduler scheduler;
#endif