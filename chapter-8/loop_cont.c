#include<stdio.h>

int main(void) {
    int n = 0;

    for (n = 0; n < 20; n++)
    {
        if(n % 2 == 0)
            continue;

        printf("%d is odd \n", n);
    }

    return 0;
}