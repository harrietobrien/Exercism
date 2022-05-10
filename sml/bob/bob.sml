fun contains (ys, x) = List.exists (fn y => x = y) ys;
fun inc n = n + 1;
fun stripchars (string, chars) =
let
  fun aux c = 
    if String.isSubstring (str c) chars
    then "" else str c
in
  String.translate aux string
end;
fun alpha c = c >= #"A" andalso c <= #"Z"
			 orelse c >= #"a" andalso c <= #"z";
fun removePunct cl = 
let
  val index = ref 0;
  val nl = ref [];
in 
  while !index < length cl do(
    if alpha(List.nth(cl,!index))
    then(nl := List.nth(cl,!index)::(!nl);
    index := inc(!index))
    else index := inc(!index));
!nl
end
fun response "" = "Fine. Be that way!"
  | response s =
  if stripchars(s," \t\n\r") = ""
  then "Fine. Be that way!" else
  let
    val allUp = map Char.isUpper;
    val cl = explode (stripchars(s," \t\n\r"));
    val n = length cl;
    val np = removePunct(cl);
    val upList = allUp(np);
    val resp = ref "";
in
   if (List.nth(cl,n-1) = #"?" andalso
  (upList = [] orelse contains(List.take(upList,(length np)-1),false)))
    then resp := "Sure." else(if List.nth(cl,n-1) = #"?"
    then resp := "Calm down, I know what I'm doing!" else(
    if contains(allUp(removePunct(cl)),false)
    orelse allUp(removePunct(cl)) = []
    then resp := "Whatever." else resp := "Whoa, chill out!"));
!resp
end;