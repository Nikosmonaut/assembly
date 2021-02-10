#ifndef ADC_H_INCLUDED
#define ADC_H_INCLUDED

#include <stdint.h>

/**
 * Init Vcc ref
 * Align ADC bit to left
 **/
void adc_init(void);

/**
 * Return adc value from mux port
 **/
uint16_t adc_read_value(char mux);

#endif