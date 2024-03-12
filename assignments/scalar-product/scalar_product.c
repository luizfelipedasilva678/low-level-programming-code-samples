#include<stdio.h>
#include<stdlib.h>

const int arr1[] = {1, 2, 3};
const int arr2[] = {4, 5, 6};

int scalar_product(const int *arr1, const int *arr2, size_t count) {
    long signed int result = 0;
    size_t i;
    
    if(arr1 == NULL || arr2 == NULL) {
        return 0;
    }

    for (i = 0; i < count; i++) {
        result += arr1[i] * arr2[i];
    }

    return result;
}

int main(void) {
    printf("Result: %d \n", scalar_product(arr1, arr2, sizeof(arr1) / sizeof(arr1[0])));

    return 0;
}