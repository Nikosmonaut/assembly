#include <stdio.h>

int a2i(char* text);
int fibonacci(int n);

int main() {
    char numberString[100];

    fgets(numberString, sizeof(numberString), stdin);

    int index = a2i(numberString);
    printf("Index : %d", index);
    int fib = fibonacci(index);

    printf("Fibonacci index : %s : %d\n", numberString, fib);

    return 0;
}