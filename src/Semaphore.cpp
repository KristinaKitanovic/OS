#include "../h/Semaphore.hpp"
#include "../h/syscall_cpp.hpp"
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
        semaphore->waiting.add_end(Thread::running);

        Thread::running = scheduler.get();
        if(Thread::running == nullptr) return -1;
        if(Thread::running->getContext()->wasActive == 1){
            restore_context_kernel_mode(Thread::running->getContext());
        }
        else
        {
            Thread::running->getContext()->wasActive = 1;
            ThreadContext* tc = Thread::running->getContext();
            ThreadWrapperArgs* wa = Thread::running->getWrapperArgs();
            //start_thread_for_the_first_time_dispatch(&Thread::running->context);
            thread_wrapper(tc, wa);
        }
    }
    return 0;
}

int Semaphore::sem_signal(sem_t id) {
    Semaphore* semaphore = MemoryAllocator::Instance()->getSemaphorePool().getSemaphoreById(id);
    if(semaphore == nullptr) return -1;
    semaphore->val++;
    if(semaphore->val >= 0 && !semaphore->waiting.empty()){
        //Unblock one thread and put it in Scheduler as ready
        Thread* thread = semaphore->waiting.remove_beginning();
        scheduler.put(thread);
        thread->semWaitStatus = 0;
    }
    return 0;
}
