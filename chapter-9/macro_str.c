#include <stdio.h>
#define mystr "hello"
#define res mystr
#define x1 "Hello"
#define x2 "World"
#define str(i) x##i


int main(void) {
    puts(res);

    puts(str(1));
    return 0;
}