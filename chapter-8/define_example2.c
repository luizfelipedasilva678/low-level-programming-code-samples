#include<stdio.h>

#define MACRO_SQUARE(x) ((x) * (x))

int main(void) {
    int x = MACRO_SQUARE(3);

    return 0;
}