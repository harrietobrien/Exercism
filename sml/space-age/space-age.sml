datatype planet = Mercury | Venus | Earth | Mars
                | Jupiter | Saturn | Neptune | Uranus

local val years : real = 31557600.0

fun period Mercury = years*0.2408467
| period Venus = years*0.61519726
| period Earth = years*1.0
| period Mars = years*1.8808158
| period Jupiter = years*11.862615
| period Saturn = years*29.447498
| period Neptune = years*164.79132
| period Uranus = years*84.016846

in fun age_on planet seconds = Real.fromInt seconds/period planet

end

