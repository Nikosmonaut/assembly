#include <utils.h>

char get_bit_value(unsigned int port, int position)
{
    return (port >> position) & 1;
}
