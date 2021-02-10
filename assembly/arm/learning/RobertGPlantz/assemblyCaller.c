#include <stdio.h>

char a(void);
char b(void);
char c(void);

int main() {
    char aChar = a();
    char bChar = b();
    char cChar = c();

    printf("%c\n", aChar);
    printf("%c\n", bChar);
    printf("%c\n", cChar);

    return 0;
}