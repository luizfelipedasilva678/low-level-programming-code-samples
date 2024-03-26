#include<stdio.h>
#include<malloc.h>

int main(void) {
    int *a = malloc(200);
    a[4] = 2;

    printf("%d \n", a[4]);
}