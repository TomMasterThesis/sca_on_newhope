#include "stm32f4xx_hal.h"

#define TRIG_Pin GPIO_PIN_12
#define TRIG_GPIO_Port GPIOA

void trigger_high(void);
void trigger_low(void);
