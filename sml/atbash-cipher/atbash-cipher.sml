fun inc n = n + 1;
fun contains (ys, x) = List.exists (fn y => x = y) ys;
fun getIndex (x, []) = raise Subscript
  | getIndex (x, y::ys) =
    if x = y then 0 else 1 + getIndex (x, ys)
fun addSpaces l =
  let
    val index = ref 0;
    val count = ref 0;
    val newList = ref [];
  in
    while !index < length l do(
      if !count > 4 then(
      newList := #" "::(!newList);
      newList := List.nth(l,!index)::(!newList);
      index := inc(!index);
      count := 0) else(
      newList := List.nth(l,!index)::(!newList);
      index := inc(!index));
      count := inc(!count));
rev(!newList)
end;
fun decode (phrase: string): string =
let
  val phraseChars = explode phrase;
  val plain = List.tabulate (26, fn i => chr (i + ord #"a"));
  val numbers = explode "1234567890";
  val cipher = rev plain;
  val result = ref [];
  val index = ref 0;
in
  while !index < length phraseChars do(
    if contains(cipher,List.nth(phraseChars,!index)) then (result := List.nth(plain,getIndex(List.nth(phraseChars,!index),cipher))::(!result);
    index := inc(!index)) else(if contains(numbers,List.nth(phraseChars,!index))
    then(result := List.nth(phraseChars,!index)::(!result);
    index := inc(!index)) else (index := inc(!index))));
implode(rev(!result))
end;
fun encode (phrase: string): string =
let
  val allLow = map Char.toLower;
  val phraseChars = allLow (explode phrase);
  val plain = List.tabulate (26, fn i => chr (i + ord #"a"));
  val numbers = explode "1234567890";
  val cipher = rev plain;
  val result = ref [];
  val index = ref 0;
in
  while !index < length phraseChars do(
    if contains(cipher,List.nth(phraseChars,!index)) then (result := List.nth(cipher,getIndex(List.nth(phraseChars,!index),plain))::(!result);
    index := inc(!index)) else(if contains(numbers,List.nth(phraseChars,!index))
    then(result := List.nth(phraseChars,!index)::(!result);
    index := inc(!index)) else (index := inc(!index))));
implode(addSpaces(rev(!result)))
end;