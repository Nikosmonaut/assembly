#include <stdio.h>
#include "sum.h"

int main(void) {
    int total;
    int a = 1;
    int b = 2;
    int c = 3;
    int d = 4;
    int e = 5;
    int f = 6;
    int g = 7;
    int h = 8;
    int i = 9;

    total = sum(a, b, c, d, e, f, g, h, i);

    printf("Total = %d\n", total);

    return 0;
}
