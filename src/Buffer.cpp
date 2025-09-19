#include "../h/Buffer.hpp"

ConsoleBuffer::ConsoleBuffer() {
    head = tail = count = 0;
    itemAvailable  = new Semaphore(0);
    spaceAvailable = new Semaphore(BUFF_SIZE);
    mutex          = new Semaphore(1);
}

void ConsoleBuffer::putc(char c) {

    spaceAvailable->wait();


    buffer[tail] = c;
    tail = (tail + 1) % BUFF_SIZE;
    count++;


    itemAvailable->signal();
}

char ConsoleBuffer::getc() {
    itemAvailable->wait();

    char c = buffer[head];
    head = (head + 1) % BUFF_SIZE;
    count--;


    spaceAvailable->signal();

    return c;
}
uint64 ConsoleBuffer::getCapacity() const {
    return BUFF_SIZE;
}
