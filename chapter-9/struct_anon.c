#include <stdio.h>

struct d
{
    int a;
    char b;
};

int main(void) {
    struct d teste;

    teste.a = 10;
    teste.b = 'a';

    printf("%d \n", teste.a);

    return 0;
}