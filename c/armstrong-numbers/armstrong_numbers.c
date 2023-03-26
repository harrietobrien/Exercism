#include "armstrong_numbers.h"
#include <math.h>
#include <stdlib.h>

int digit_count(int n) {
  n = abs(n);
  if (n == 0) {
    return 1;
  }
  int count = 0;
  while (n > 0) {
    ++count;
    n /= 10;
  }
  return count;
}
bool is_armstrong_number(int candidate) {
  int dc = digit_count(candidate);
  int n = candidate;
  int sum = 0;
  while (n > 0) {
    sum += pow(n % 10, dc);
    n /= 10;
  }
  if (sum != candidate) {
    return 0;
  } else {
    return 1;
  }
}
