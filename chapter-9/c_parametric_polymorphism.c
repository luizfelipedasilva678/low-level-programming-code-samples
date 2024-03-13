#include<stdio.h>
#include<stdbool.h>

#define pair(T) pair_##T

#define DEFINE_PAIR(T) struct pair(T) {\
    T fst;\
    T snd;\
};\