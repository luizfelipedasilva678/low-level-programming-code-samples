#include<stdio.h>

const long array[] = {1, 2, 3};

const int arr[] = { 1, 2, 3 };

void f(int const arr[]) {
    printf("%lu\n", sizeof(arr));
}

int main(void) {
    printf("%lu \n", sizeof(array));
    printf("%lu \n", sizeof(array) / sizeof(array[0]));
    printf("%lu \n", sizeof("hello"));
    printf("%lu \n", sizeof(0));
    printf("%lu \n", sizeof('x'));

    f(arr);
    return 0;
}