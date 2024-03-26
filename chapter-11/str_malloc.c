#include<malloc.h>
#include<string.h>

int main(int argc, char **argv) {
    char *str = (char *)malloc(14);
    strcpy(str, "Hello, World!");

    free(str);
    return 0;
}