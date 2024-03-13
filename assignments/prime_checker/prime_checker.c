#include<stdio.h>
#define TRUE 1
#define FALSE 0


int is_prime(unsigned long n) {
    size_t i;

    if(n == 0UL || n == 1UL) return FALSE;

    for (i = 1; i < n; i++) {
        if (n % i == 0UL && i != 1UL && i != n) return FALSE;
    }

    return TRUE;
}

int main(void) {
    unsigned long n = 0UL;

    while (!scanf("%lu", &n));

    printf(is_prime(n) ? "Prime\n" : "Not Prime\n");
    return 0;
}