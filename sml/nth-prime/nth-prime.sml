fun inc x = x + 1;
fun isPrime 2 = true
  | isPrime n =
  if n < 2 orelse n mod 2 = 0 then false
  else(
    let
      fun helper m =
        if m * m > n then true
        else if n mod m = 0 then false
        else helper (m+2)
     in helper 3
     end);
fun nthPrime 0 = NONE
  | nthPrime 1 = SOME 2
  | nthPrime n =
    let
      val found = ref 1;
      val guess = ref 1;
    in 
      while !found <= n do (
        guess := inc(!guess);
        if isPrime(!guess)
        then found := inc(!found)
        else()
      );
SOME (!guess)
end;