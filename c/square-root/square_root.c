#include "square_root.h"
#include <stdint.h>

int  square_root(int radicand) {
  int sq_rt;
  if (radicand < 2) {
      sq_rt = radicand;
  }
  for (int i = 0; i <= (2 * radicand / 3); i++) {
    if (i * i == radicand) {
      sq_rt =  i;
    }
  }
  return sq_rt;
}


