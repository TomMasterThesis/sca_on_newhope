#include "params.h"

typedef struct {
  uint16_t coeffs[NEWHOPE_N];
} poly __attribute__ ((aligned (32)));

void poly_frommsg(poly *r, const unsigned char *msg);
