#include<stdio.h>

int x = 100;

int main(void) {
    if (42) {
        puts("42 is not equal to zero and thus considered truth");
    }

    if(x > 3) {
        puts("X is greater than 3");
    } else {
        puts("X is less than 3");
    }

    return 0;
}
