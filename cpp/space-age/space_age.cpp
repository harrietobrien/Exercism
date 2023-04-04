#include "space_age.h"

const long earth = 31557600;

double space_age::space_age::on_earth() const {
    return s/(1.0*earth);
}
double space_age::space_age::on_mercury() const {
    return s/(0.2408467*earth);
}
double space_age::space_age::on_venus() const {
    return s/(0.61519726*earth);
}
double space_age::space_age::on_mars() const {
    return s/(1.8808158*earth);
}
double space_age::space_age::on_jupiter() const {
    return s/(11.862615*earth);
}
double space_age::space_age::on_saturn() const {
    return s/(29.447498*earth);
}
double space_age::space_age::on_uranus() const {
    return s/(84.016846*earth);
}
double space_age::space_age::on_neptune() const {
    return s/(164.79132*earth);
}