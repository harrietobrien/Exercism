fun inc n = n + 1;
fun dec n = n - 1;
fun compound 0 f x = x 
  | compound n f x = compound (n-1) f (f x)
fun exp b e = compound e (fn x => b*x) 1;
fun positive xs =
  let
    fun positive' [] p = rev p
      | positive' (y::ys) p =
        if y < 0 then
          positive' ys p
        else
          positive' ys (y :: p)
  in
    positive' xs []
  end;
fun lessThan b d =
if d >= b then true else false;
fun rebase (inBase: int, outBase: int, digits: int list) =
if inBase <= 1 orelse outBase <= 1
orelse length (positive digits) <> length digits
orelse List.filter (lessThan inBase) digits <> []
then NONE else
let
  val count = ref (length digits);
  val index = ref 0;
  val bt = ref 0;
  val bo = ref [];
in
  while !count > 0 do(
    bt := !bt + ((exp inBase (!count-1))*List.nth(digits,!index));
    index := inc(!index);
    count := dec(!count));
  while !bt > 0 do(
    bo := (!bt mod outBase)::(!bo);
    bt := (!bt div outBase));
if !bo = [] then NONE else SOME (!bo)
end;