#include "../h/Semaphore.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/Scheduler.hpp"

int Semaphore::cnt = 1;

Semaphore::Semaphore(unsigned init){
    val = init;
    myHandle = cnt++;
}
Semaphore::~Semaphore() {}

int  Semaphore::wait(){
    sem_wait(this->myHandle);
    return 0;
}
int Semaphore::signal(){
    sem_signal(this->myHandle);
    return 0;
}

void* Semaphore::operator new(size_t size) {
    return MemoryAllocator::Instance()->getSemaphorePool().allocate();
}

void Semaphore::operator delete(void *obj) noexcept {
    MemoryAllocator::Instance()->getSemaphorePool().deallocate((Semaphore*)obj);
}
int Semaphore::sem_open(sem_t *handle, unsigned init) {
    Semaphore* semaphore = new Semaphore(init);
    if(!semaphore) return -1;
    *handle = semaphore->myHandle;
    return 0;
}

int Semaphore::sem_close(sem_t id){
    Semaphore* semaphore = MemoryAllocator::Instance()->getSemaphorePool().getSemaphoreById(id);
    if(semaphore == nullptr) return -1;

    //take out all threads that were waiting on this semaphore and put them in Scheduler as ready
    while(!semaphore->waiting.empty()){
        Thread* thread = semaphore->waiting.remove_beginning();
        thread->semWaitStatus = -2;
        scheduler.put(thread);

    }
    delete semaphore;
    return 0;
}

int Semaphore::sem_wait(sem_t id) {
    Semaphore* semaphore = MemoryAllocator::Instance()->getSemaphorePool().getSemaphoreById(id);
    if(semaphore == nullptr) return -1;
    Thread::running->semWaitStatus = 0;
    semaphore->val--;
    if(semaphore->val < 0){
        Thread* oldRunning = Thread::running;
        semaphore->waiting.add_end(Thread::running);

        Thread::running = scheduler.get();
        if(Thread::running == nullptr) return -1;
        if(Thread::running->getContext()->isKernelThread){
            ThreadWrapperArgs* wa = Thread::running->getWrapperArgs();
            wa->userFunc(wa->userArgs);
        }
        if(Thread::running->getContext()->wasActive == 1){
            RiscV::w_last_sstatus();
            RiscV::w_last_sepc();
            restore_context_kernel_mode(Thread::running->getContext());
        }
        else
        {
            context_switch(oldRunning->getContext(), Thread::running->getContext());
        }
    }
    return 0;
}

int Semaphore::sem_signal(sem_t id) {
    Semaphore* semaphore = MemoryAllocator::Instance()->getSemaphorePool().getSemaphoreById(id);
    if(semaphore == nullptr) return -1;
    semaphore->val++;
    if(!semaphore->waiting.empty()){
        //Unblock one thread and put it in Scheduler as ready
        Thread* thread = semaphore->waiting.remove_beginning();
        scheduler.put(thread);
        thread->semWaitStatus = 0;
    }
    return 0;
}
