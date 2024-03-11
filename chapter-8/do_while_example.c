#include<stdio.h>

int main(void) {
    int x = 10;

    do {
        printf("Hello \n");
        x = x - 1;
    } while(x != 0);

    return 0;
}