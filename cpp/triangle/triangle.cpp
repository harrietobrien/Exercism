#include "triangle.h"

namespace triangle {
    bool isTriangle(double a, double b, double c){
        if (a <= 0 || b <= 0 || c <= 0) {
            return false;
        } else if ((a + b < c) || (a + c < b) || (b + c < a)) {
            return false;
        } else {
            return true;
        }
    } 
    int sameSideCount(double a, double b, double c){
        if (a == b && a == c) {
            return 3;
        } else if  ((a == b && a != c) ||
                    (a == c && a != b) ||
                    (b == c && a != b)) {
            return 2;
        } else {
            return 0;
        }
    }
    flavor kind(double a, double b, double c){
        if (!isTriangle(a, b, c)) {
            throw std::domain_error("Invalid triangle!");
        } else if (sameSideCount(a, b, c) == 2) {
            return isosceles;
        } else if (sameSideCount(a, b, b) == 3) {
            return equilateral;
        } else {
            return scalene;
        }
    } 
}  // namespace triangle
