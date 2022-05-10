fun inc n = n + 1;
fun accumulate (f, xs) =
let
  val index = ref 0;
  val newlist = ref [];
in
  while !index < length xs do(
  let
    val n = f(List.nth(xs,!index));
  in
    newlist := n::(!newlist);
    index := inc(!index)
  end);
rev(!newlist)
end;