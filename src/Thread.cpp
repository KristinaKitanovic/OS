#include "../h/Thread.hpp"
#include "../h/Pool.hpp"
#include "../h/Scheduler.hpp"
#include "../h/RiscV.hpp"




int Thread::cnt = 0;
extern Scheduler scheduler;
Thread* Thread::running = nullptr;
uint64 Thread::timeSliceCounter = 0;



void Thread::threadWrapper() {

    RiscV::switchToUserMode();
    ThreadWrapperArgs* wa = Thread::running->getWrapperArgs();
    wa->userFunc(wa->userArgs);
    thread_exit();


}
void Thread::kernelThreadWrapper() {

    ThreadWrapperArgs* wa = Thread::running->getWrapperArgs();


    wa->userFunc(wa->userArgs);


    thread_exit_kernel();

}

Thread::Thread(void (*body)(void*), void* arg, void* stack_top) {
    this->next = nullptr;
    this->body = body;
    this->arg = arg;
    threadId = cnt++;
    context.userStack = (uint64*)((char*)stack_top - DEFAULT_STACK_SIZE);
    context.sp = (uint64)stack_top;

    if (Thread::running != nullptr) {

        context.sstatus = Thread::running->getContext()->sstatus;
    } else {
        context.sstatus = 0;
        context.sstatus &= ~RiscV::SSTATUS_SPP;
        context.sstatus |= RiscV::SSTATUS_SPIE;
    }
    context.kernelStack = (uint64*)((char*)stack_top - 2 * DEFAULT_STACK_SIZE);
    context.ssp = (uint64)((char*)context.kernelStack + DEFAULT_STACK_SIZE);
    context.startedOnce = (uint64)0;
    context.wasActive = (uint64)0;
    this->wrapperArgs.userArgs = arg;
    this->wrapperArgs.userFunc = body;
    context.ra = (uint64)&threadWrapper;
    context.timeSlice = DEFAULT_TIME_SLICE;
    context.isKernelThread = 0;
}
Thread::Thread() {
    size_t numOfBlocks = (2 * DEFAULT_STACK_SIZE + sizeof(Header) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    void* result = MemoryAllocator::Instance()->mem_alloc(numOfBlocks);
    void* stack = (char*)result + sizeof(Header);
    void* stack_top = (char*)stack + 2 * DEFAULT_STACK_SIZE;

    this->next = nullptr;
    this->body = nullptr;  // C++ nit nema body
    this->arg = nullptr;
    threadId = cnt++;

    context.userStack = (uint64*)((char*)stack_top - DEFAULT_STACK_SIZE);
    context.sp = (uint64)stack_top;


    if (Thread::running != nullptr) {

        context.sstatus = Thread::running->getContext()->sstatus;
    } else {
        context.sstatus = 0;
        context.sstatus &= ~RiscV::SSTATUS_SPP;
        context.sstatus |= RiscV::SSTATUS_SPIE;
    }
    context.kernelStack = (uint64*)((char*)stack_top - 2 * DEFAULT_STACK_SIZE);
    context.ssp = (uint64)((char*)context.kernelStack + DEFAULT_STACK_SIZE);
    context.startedOnce = 0;
    context.wasActive = 0;
    context.timeSlice = DEFAULT_TIME_SLICE;
    context.ra = (uint64)&threadWrapper;
    wrapperArgs.userArgs = this;
    wrapperArgs.userFunc = this->body = [](void* obj){
        static_cast<Thread*>(obj)->run();
    };
    context.isKernelThread = 0;

}


Thread::Thread(void (*kernelBody)(void*), void* arg)
{
    this->next = nullptr;
    this->body = kernelBody;
    this->arg = arg;
    threadId = cnt++;

    // alokacija stacka
    size_t numOfBlocks = (2 * DEFAULT_STACK_SIZE + sizeof(Header) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    void* result = MemoryAllocator::Instance()->mem_alloc(numOfBlocks);
    void* stack = (char*)result + sizeof(Header);
    void* stack_top = (char*)stack + 2 * DEFAULT_STACK_SIZE;

    context.userStack = nullptr;                 // kernel nit nema user stack
    context.sp = (uint64)stack_top;
    context.sstatus = 0;
    context.sstatus &= ~RiscV::SSTATUS_SPP;
    context.sstatus |= RiscV::SSTATUS_SPIE;

    context.kernelStack = (uint64*)((char*)stack_top - 2 * DEFAULT_STACK_SIZE);
    context.ssp = (uint64)((char*)context.kernelStack + DEFAULT_STACK_SIZE);

    context.startedOnce = 0;
    context.wasActive = 0;
    context.timeSlice = DEFAULT_TIME_SLICE;

    wrapperArgs.userArgs = arg;
    wrapperArgs.userFunc = kernelBody;

    context.ra = (uint64)&kernelThreadWrapper;
    context.isKernelThread = 1;
}



int Thread::create_thread_kernel(thread_t* handle, void(*routine)(void*) , void* args, void* stack_top){
    if(!handle || !routine || !stack_top)return -1;
    Thread* thread = new Thread(routine, args, stack_top);
    if(!thread) return -2;
    *handle =  thread->threadId;
    if(!Thread::running){
        Thread::running = thread;
        return 0;
    }
    scheduler.put(thread);


    return 0;
}


void Thread::clearTimeSliceCounter() {
    Thread::timeSliceCounter = 0;
}
uint64 Thread::getTimeSliceCounter() {
    return Thread::timeSliceCounter;
}
void Thread::incrementtimeSliceCounter() {
    Thread::timeSliceCounter++;
}
uint64 Thread::getTimeSlice() {
    return this->context.timeSlice;
}

int Thread::thread_exit_kernel(){
    Thread* oldRunning = Thread::running;
    //Take the thread out of ThreadManager array

    Thread::running = scheduler.get();
    if(Thread::running){
        if(Thread::running->getContext()->wasActive == 1){
            RiscV::w_last_sstatus();
            RiscV::w_last_sepc();
            restore_context_kernel_mode(&Thread::running->context);
        }
        else
        {
            context_switch(&oldRunning->context, &Thread::running->context);
        }
    }
    return 0;
}
void Thread::thread_dispatch_kernel() {
    Thread* oldRunning = Thread::running;
    if(oldRunning)
    {
        scheduler.put(oldRunning);
    }


    Thread::running = scheduler.get();
    if(Thread::running->getContext()->isKernelThread){
        ThreadWrapperArgs *wa = Thread::running->getWrapperArgs();
        wa->userFunc(wa->userArgs);
    }
    if(Thread::running->getContext()->wasActive == 1){
        RiscV::w_last_sstatus();
        RiscV::w_last_sepc();
        restore_context_kernel_mode(&Thread::running->context);
    }
    else {
        Thread::running->getContext()->wasActive = 1;
        context_switch(&oldRunning->context, &Thread::running->context);
    }

}

Thread::~Thread(){}

ThreadContext* Thread::getContext() {
    return &this->context;
}

ThreadWrapperArgs* Thread::getWrapperArgs() {
    return &this->wrapperArgs;
}
void* Thread::operator new(size_t size){

    void* mem = (void*)MemoryAllocator::Instance()->getThreadPool().allocate();
    return mem;
}
void Thread::operator delete(void* mem )noexcept{
MemoryAllocator::Instance()->getThreadPool().deallocate((Thread*) mem);
}

void Thread::dispatch(){
    thread_dispatch();
}

int Thread::start() {
    scheduler.put(this);

    if(Thread::running == nullptr) {
        Thread::running = scheduler.get();
        if(Thread::running == nullptr) return -1;

    }
    return 0;
}
extern "C" ThreadContext* getRunningThreadContext(){
    if(Thread::running == nullptr){
        return nullptr;
    }
    return Thread::running->getContext();
};

extern "C" int getWaitStatusForRunning(){
    return Thread::running->semWaitStatus;
}

