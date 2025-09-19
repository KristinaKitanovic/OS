#ifndef PROJECT_BASE_BUFFER_HPP
#define PROJECT_BASE_BUFFER_HPP
#include "../lib/hw.h"
#include "Semaphore.hpp"

class ConsoleBuffer {
public:
    ConsoleBuffer();

    void putc(char c);
    char getc();

    uint64 getCount() const { return count; }
    uint64 getCapacity() const;
    static const uint64 BUFF_SIZE = 512;
private:

    char buffer[BUFF_SIZE];

    uint64 head ;
    uint64 tail;
    uint64 count;

    Semaphore *itemAvailable;
    Semaphore *spaceAvailable;
    Semaphore *mutex;
};


#endif
