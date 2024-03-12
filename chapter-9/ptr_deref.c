#include<stdio.h>

int main(void) {
    int  x = 10;
    int* px = &x;

    *px = 20;

    printf("%d\n", *px);
    printf("%d\n", x);

    return 0;
}