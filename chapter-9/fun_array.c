#include<stdio.h>

int first (int array[], size_t sz) {
    if(sz == 0)
        return -1;

    return array[0];
}

int first(int * array, size_t sz) {
    if(sz == 0)
        return -1;

    return *array;
}

int first(int * array, size_t sz) {
    if(sz == 0)
        return -1;

    return array[0];
}