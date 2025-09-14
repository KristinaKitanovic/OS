#ifndef LIST_HPP
#define LIST_HPP
#include "../lib/hw.h"

class MemoryAllocator;
class Header;

template<typename T>
class ListNode {
public:
    ListNode* next;
    ListNode* prev;
    T* object;

    ListNode(T* t);

    // Samo deklaracije ovde
    void* operator new(size_t size);
    void operator delete(void* obj);
};

template<typename T>
class List {
public:
    List();
    ~List();

    void add_end(T* t);
    T* remove_beginning();
    bool empty();

private:
    ListNode<T>* head;
    ListNode<T>* tail;
};

#endif
