#ifndef _console_h
#define _console_h
#ifdef __cplusplus
extern "C" {
#endif

void putc(char);
char getc();
void console_handler();

#ifdef __cplusplus
}
#endif

#endif