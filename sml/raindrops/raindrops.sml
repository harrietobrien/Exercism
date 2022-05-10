fun convert n =
  let
    val mod3 = (fn n => if n mod 3 = 0 then "Pling" else "");
    val mod5 = (fn n => if n mod 5 = 0 then "Plang" else "");
    val mod7 = (fn n => if n mod 7 = 0 then "Plong" else "");
    val result = (mod3 n)^(mod5 n)^(mod7 n);
  in
    if result = "" then Int.toString(n) else result
end;