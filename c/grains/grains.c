#include "grains.h"
#include <math.h>
uint64_t square(uint8_t index) {
  if (index == 0 || index > 64) {
    return 0;
  }
  uint8_t i = index - ((uint8_t) 1);
  uint64_t grains = pow(2, i);
  return grains;
}
uint64_t total(void) {
  int squares = 64;
  uint64_t sum = 0;
  int index = 1;
  while (index <= squares) {
    sum += square(index);
    ++index;
  }
  return sum;
}
