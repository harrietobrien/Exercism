#include "reverse_string.h"
#include <string>
using std::string;
namespace reverse_string {
    string reverse_string(string s){
        string rs = "";
        for(int i = s.length()-1; i>=0; i--) {
            rs += s[i];
        }
        return rs;
    }
}  // namespace reverse_string