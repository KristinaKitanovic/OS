#include "../h/Console.hpp"
#include "../lib/hw.h"
#include "../h/Scheduler.hpp"

Console* Console::Instance() {
    static Console instance;
    return &instance;
}

void Console::producerRoutine(void* arg) {
//    for (;;) {
//        // Ako nema podataka u txBuffer-u, čekaj
//        if (Console::Instance()->txBuffer.getCount() == 0) {
//
//            Console::Instance()->putcSemaphore->wait();
//        }
//
//        uint8 cstatus = *((volatile uint8*) CONSOLE_STATUS);
//        uint8 txReady = cstatus & CONSOLE_TX_STATUS_BIT;
//        uint8 rxReady = cstatus & CONSOLE_RX_STATUS_BIT;
//
//        if (txReady && Console::Instance()->isInterrupted) {
//            char c = Console::Instance()->txBuffer.getc();
//            *((volatile uint8*) CONSOLE_TX_DATA) = (uint8)c;
//            break;
//        } else if (!rxReady && !txReady && Console::Instance()->isInterrupted) {
//            Console::Instance()->isInterrupted = false;
//            plic_complete(CONSOLE_IRQ);
//        } else {
//            Thread::thread_dispatch_kernel();
//        }
//    }
}

void Console::consumerRoutine(void* arg) {
//    for (;;) {
//        // Čekaj dok rxBuffer nije pun
//        while (Console::Instance()->rxBuffer.getCount() == Console::Instance()->rxBuffer.getCapacity()) {
//
//            Thread::thread_dispatch_kernel();
//        }
//
//        uint8 cstatus = *((volatile uint8*) CONSOLE_STATUS);
//        uint8 txReady = cstatus & CONSOLE_TX_STATUS_BIT;
//        uint8 rxReady = cstatus & CONSOLE_RX_STATUS_BIT;
//
//        if (rxReady && Console::Instance()->isInterrupted) {
//            uint8 c = *((volatile uint8*) CONSOLE_RX_DATA);
//            Console::Instance()->rxBuffer.putc((char)c);
//            //izmenila
//            Console::Instance()->putcSemaphore->signal();
//        } else if (!rxReady && !txReady && Console::Instance()->isInterrupted) {
//            Console::Instance()->isInterrupted = false;
//            plic_complete(CONSOLE_IRQ);
//        } else {
//            Thread::thread_dispatch_kernel();
//        }
//    }
}

Console::Console() {
    isInterrupted = false;

    // Kreiranje semafora
    putcSemaphore = new Semaphore(0);
    getcSemaphore = new Semaphore(0);

    // Kernel niti
//    producerThread = new Thread(producerRoutine, this);
//    consumerThread = new Thread(consumerRoutine, this);
//    scheduler.put(consumerThread);
//    scheduler.put(producerThread);
}

void Console::setInterrupt() {
    Console::Instance()->isInterrupted = true;
}

void Console::putc(char c) {
    Console::Instance()->txBuffer.putc(c);
    Console::Instance()->putcSemaphore->signal();
}

char Console::getc() {
    Console::Instance()->getcSemaphore->wait();
    return Console::Instance()->rxBuffer.getc();
}

uint64 Console::getTxCount() {
    return Console::Instance()->txBuffer.getCount();
}
