#include<stdio.h>

int main(void) {
    int a = 10;
    void* pa = &a;

    printf("%d\n", (*(int*) pa));

    return 0;
}