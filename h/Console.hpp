#ifndef PROJECT_BASE_CONSOLE_HPP
#define PROJECT_BASE_CONSOLE_HPP

#include "../lib/hw.h"
#include "../lib/console.h"
#include "Buffer.hpp"
#include "Semaphore.hpp"
#include "Thread.hpp"

class Console {
public:
    static Console* Instance();

    // korisničke funkcije
    static void putc(char c);   // user -> txBuffer
    static char getc();         // rxBuffer -> user

    static void put(char c);    // koristi consumer za rx
    static uint64 getTxCount();
    static void setInterrupt();

private:
    Console();
    ~Console() = default;

    // Buffers
    ConsoleBuffer rxBuffer;   // getcBuffer
    ConsoleBuffer txBuffer;   // putcBuffer

    // Semaphores
    Semaphore* putcSemaphore; // blokira producer dok nema podataka
    Semaphore* getcSemaphore; // blokira korisnika dok nema podataka

    // Threads
    Thread* producerThread;   // šalje iz txBuffer ka hardveru
    Thread* consumerThread;   // čita iz hardvera i puni rxBuffer

    static Console* instance;
    bool isInterrupted;

    // thread funkcije (moraju biti static da se proslede Thread-u)
    static void producerRoutine(void* arg);
    static void consumerRoutine(void* arg);
};

#endif // PROJECT_BASE_CONSOLE_HPP
