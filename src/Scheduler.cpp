#include "../h/Scheduler.hpp"

Scheduler scheduler;

Scheduler::Scheduler() {
    head = nullptr;
    tail = nullptr;
}

void Scheduler::put(Thread* t){
    t->next = nullptr;
    if(!head){
        head = t;
    }
    else
    {
        tail->next = t;
    }
    tail = t;
}

Thread* Scheduler::get(){
    if(head == nullptr) return nullptr;
    Thread* thread = head;
    if(thread->getContext()->startedOnce)
    {
        thread->getContext()->wasActive = 1;
    }
    if(thread->getContext()->startedOnce == 0)
    {
        thread->getContext()->startedOnce = 1;
    }
    head = head->next;
    thread->next = nullptr;
    if(!head) tail = nullptr;
    return thread;
}