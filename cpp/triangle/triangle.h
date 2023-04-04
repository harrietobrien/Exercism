#if !defined(TRIANGLE_H)
#define TRIANGLE_H
#include <stdexcept>
namespace triangle {
    enum flavor {
        equilateral,
        isosceles,
        scalene,
    };
    bool isTriangle(double a, double b, double c);
    int sameSideCount(double a, double b, double c);
    flavor kind(double a, double b, double c);
}  // namespace triangle
#endif // TRIANGLE_H