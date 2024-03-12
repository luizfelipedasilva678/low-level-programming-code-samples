#include<stdio.h>

int main(void) {
    int y = 10;
    int w = 11;
    int * const x = &y;

    *x = 11;

    printf("%d \n", *x);
    printf("%d \n", y);

    return 0;
}