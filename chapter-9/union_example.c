#include<stdio.h>

union dword {
    int integer;
    short shorts[2];
};

int main(void)
{
    union dword test;

    test.integer = 0xAABBCCDD;

    printf("%x \n", test.shorts[0]);

    return 0;
}