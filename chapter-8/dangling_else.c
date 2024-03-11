#include<stdio.h>


int x = 100;
int y = 2;

int main(void) {
    if(x == 0)  {
        if(y == 0) {
            puts("A");
        }
        else {
            puts("B");
        }
    }
    
    if(x == 0) {
        if(y == 0) {
            printf("A");
        }
        else {
            puts("B");
        }
    }

    if(x == 0) {
        if(y == 0) {
            printf("A");
        }
        else {
            puts("B");
        }
    }

    return 0;
}