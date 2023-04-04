#include "hamming.h"
#include <string>
#include <stdexcept>

namespace hamming {
  int compute(std::string strand1, std::string strand2) {
    if (strand1.length() != strand2.length()) {
      throw std::domain_error("Unequal strand lengths.");
    }
    int count = 0;
    for (unsigned int i = 0; i < strand1.length(); i++) {
      count += strand1[i] != strand2[i];
    }
    return count;
  }
}  // namespace hamming
