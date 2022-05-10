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
fun inc n = n + 1;
fun primeFactors n =
  let
    val nn = ref n;
    val index = ref 2;
    val rl = ref []; 
  in
    while !nn <> 1 do(
      if !nn mod !index <> 0 then(
      index := inc(!index)) else(
      nn := !nn div !index;
      rl := (!index)::(!rl)));
rev (!rl)
end;