#include<stdio.h>

#define TRUE 1
#define FALSE 0

int number_of_divisors(unsigned long n) {
    size_t i;
    int count = 0;

    for (i = 1; i <= n; i++) {
        if(n % i == 0) {
            count++;
        }
    }

    return count;

}

int is_prime(unsigned long n) {
    if(n == 1 || n <= 0 || number_of_divisors(n) > 2) {
        return FALSE;
    }
    
    return TRUE;
}

int main(void) {
    unsigned long n;

    while (! scanf("%lu", &n) );

    printf(is_prime(n) ? "yes \n" : "no \n");

    return 0;
}