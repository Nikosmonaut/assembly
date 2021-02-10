#include <stdio.h>

int main(void) {
    register int x, y;
    int z;

    x = 123;
    y = 4567;

    z = x + y;

    printf("%i + %i = %i\n", x, y, z);

    return 0;
}