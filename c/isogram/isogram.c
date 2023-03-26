#include "isogram.h"
#include <stdio.h>
#include <ctype.h>
#include <string.h>
bool is_isogram(const char phrase[]) {
  if (phrase == NULL) {
    return 0;
  } else if (strlen(phrase) == 0) {
    return 1;
  }
  size_t i, j;
  size_t n = strlen(phrase);
  for (i = 0; i < n; i++) {
    for (j = i + 1; j < n; j++) {
      if (isalpha(phrase[i]) != 1) {
        continue;
      } else {
        char chr1 = tolower(phrase[i]);
        char chr2 = tolower(phrase[j]);
        if (chr1 == chr2) {
          return 0;
        }
      }
    }
  }
  return 1;
}
