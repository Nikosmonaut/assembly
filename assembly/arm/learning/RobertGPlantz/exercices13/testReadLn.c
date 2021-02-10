#include <stdio.h>

int readLn(char* str);

int main() {
    char* str = "Bonjour";
    int total = 0;

    total = readLn(str);

    printf("String is : %s\nNumber of characters is : %d\n", str, total);

    return 0;
}