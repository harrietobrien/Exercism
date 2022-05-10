datatype classification = Abundant | Deficient | Perfect;
fun factors(n,k) =
  if k >= n then [] else
    if n mod k = 0
    then k::factors(n,k+1)
    else factors(n,k+1);
fun sum [] = 0
  | sum (x::xs) = x + sum xs
fun classify (input: int): classification option =
if input <= 0 then NONE else
let
  val fl = factors(input,1);
  val s = sum fl;
in
  if s = input then SOME Perfect else
    if s > input then SOME Abundant else
      SOME Deficient
end;