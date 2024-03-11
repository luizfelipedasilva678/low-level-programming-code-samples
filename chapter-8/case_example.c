#include<stdio.h>


int main(void) {
    int i = 4;

    switch(i) {
        case 1:
            puts("One");
            break;
        case 2:
            puts("Two");
            break;
        case 3:
            puts("Three");
            break;
        case 4:
            puts("Four");
            break;
        default:
            puts("Default");
    }

    return 0;
}