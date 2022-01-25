#include "inttypes.h"
#include "math.h"

#include "../new_hope/crypto_stream_chacha20.h"
#include "../new_hope/params.h"
#include "../new_hope/poly.h"
#include "../new_hope/randombytes.h"


extern void asm_helprec(poly *c, const unsigned char *seed, poly *v);

void helprec(poly *c, const poly *v, const unsigned char *seed, unsigned char nonce);
