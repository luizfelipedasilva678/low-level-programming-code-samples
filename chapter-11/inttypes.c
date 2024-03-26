#include<inttypes.h>
#include<stdio.h>

void f(void) {
    int64_t i64 = -10;

    printf("The value of i64 is %" PRId64 "\n", i64);
}


int main(void) {

    f();
    return 0;
}