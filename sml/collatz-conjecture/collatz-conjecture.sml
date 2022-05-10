fun inc x = x + 1;

fun collatz_helper n =
let
  val counter = ref 0;
  val sn = ref n;
  val coll = fn n => if n mod 2 = 0 then n div 2 else 3 * n + 1;
in
  while (!sn) <> 1 do(
    counter := inc (!counter);
    if !sn mod 2 = 0 then !sn div 2 else 3 * !sn + 1;
    sn := coll(!sn));
!counter
end;

fun collatz n =
  if n = 0 orelse n < 0 then NONE 
  else SOME (collatz_helper n);