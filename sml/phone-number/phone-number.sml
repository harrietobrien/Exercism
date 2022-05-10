fun contains (ys, x) = List.exists (fn y => x = y) ys;
fun inc x = x + 1;
fun numberList s =
let
  val index = ref 0;
  val nl = ref [];
  val cl = explode s;
in
  while !index < size s do(
    if Char.isDigit(List.nth(cl,!index)) = true
    then nl := [List.nth (cl,!index)]@(!nl) else ();
    index := inc (!index));
rev (!nl)
end;
fun charCheck s =
let
  val cl = String.explode(s);
  val index = ref 0;
  val accepts = [#"(",#")",#"-",#".",#"+",#"*",#" "]
  val check = ref true;
in
  while !index < length cl do(
    if contains(accepts,List.nth(cl,!index))=false
    andalso Char.isDigit(List.nth(cl,!index))=false
    then check := false else ();
    index := inc(!index)
  );
!check
end;
fun tenDigitCheck l =
(List.nth(l,0) > #"1" andalso List.nth(l,0) <= #"9")
andalso (List.nth(l,3) > #"1" andalso List.nth(l,3) <= #"9");
fun clean (text: string): string option =
  if charCheck text = false then NONE else(
  let
    val nl = numberList text;
  in
    if length nl = 11 andalso List.nth(nl,0) = #"1" then
    (if tenDigitCheck (tl nl) then SOME (String.implode(tl nl)) else NONE)
    else (if length nl = 10 then (if tenDigitCheck nl
    then SOME (String.implode(nl)) else NONE) else NONE)
end);