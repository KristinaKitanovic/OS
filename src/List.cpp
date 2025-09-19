#include "../h/List.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/Thread.hpp"

template<typename T>
ListNode<T>::ListNode(T* t) : next(nullptr), prev(nullptr), object(t) {}


template<typename T>
void* ListNode<T>::operator new(size_t size) {
    uint64 numOfBlocks = (size + sizeof(Header) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    return MemoryAllocator::Instance()->mem_alloc(numOfBlocks);
}

template<typename T>
void ListNode<T>::operator delete(void* obj) {
    char* header = (char*)obj - sizeof(Header);
    MemoryAllocator::Instance()->mem_free(header);
}


template<typename T>
List<T>::List() : head(nullptr), tail(nullptr) {}

template<typename T>
List<T>::~List() {
    ListNode<T>* current = head;
    while (current) {
        ListNode<T>* next = current->next;
        delete current;
        current = next;
    }
    head = tail = nullptr;
}

template<typename T>
bool List<T>::empty() {
    return head == nullptr;
}

template<typename T>
void List<T>::add_end(T* t) {
    ListNode<T>* newnode = new ListNode<T>(t);
    if (!head) {
        head = newnode;
    } else {
        tail->next = newnode;
        newnode->prev = tail;
    }
    tail = newnode;
}

template<typename T>
T* List<T>::remove_beginning() {
    if (!head) return nullptr;
    ListNode<T>* node = head;
    head = head->next;
    if (head)
        head->prev = nullptr;
    else
        tail = nullptr;

    node->next = nullptr;
    node->prev = nullptr;
    T* obj = node->object;
    delete node;
    return obj;
}




template class ListNode<Thread>;
template class List<Thread>;
