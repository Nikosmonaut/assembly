#include <stdio.h>

int writeStr(char* c);

int main() {
    char* str = "Hello world!!!!";
    int total = 3;

    total = writeStr(str);

    printf("Total : %d\n", total);

    return 0;
}