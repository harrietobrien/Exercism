#include "difference_of_squares.h"
#include <math.h>
unsigned int sum_of_squares(unsigned int number) {
  unsigned int sum = 0;
  unsigned int n = number;
  while (n != 0) {
    sum += pow(n, 2);
    --n;
  }
  return sum;
}
unsigned int square_of_sum(unsigned int number) {
  unsigned int sum = 0;
  unsigned int n = number;
  while (n != 0) {
    sum += n;
    --n;
  }
  return pow(sum, 2);
}
unsigned int difference_of_squares(unsigned int number) {
  return square_of_sum(number) - sum_of_squares(number);
}

