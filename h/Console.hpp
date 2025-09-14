//
// Created by os on 9/13/25.
//

#ifndef PROJECT_BASE_CONSOLE_HPP
#define PROJECT_BASE_CONSOLE_HPP
#include "../lib/hw.h"
#include "../lib/console.h"

class Console {
public:
    static void putc(char chr) {
        __putc(chr);   // poziva funkciju iz console.h
    }

    static char getc() {
        return __getc(); // poziva funkciju iz console.h
    }
};


#endif //PROJECT_BASE_CONSOLE_HPP
