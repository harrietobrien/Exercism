#include "pangram.h"
#include <unordered_set>
namespace pangram {
    bool is_pangram(std::string str) {
        if (str.size() < 26) {
            return false;
        }
        std::unordered_set<int> chrs_left {};
        for (int chr: str) {
            if (std::isalpha(chr)) {
                chrs_left.insert(std::tolower(chr));
            }
        }
        if (chrs_left.size() == 26) {
            return true;
        } else {
            return false;
        }
    }
}  // namespace pangram
