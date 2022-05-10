fun inc x = x + 1;
fun contains (ys, x) = List.exists (fn y => x = y) ys;
fun isSubsetOf (xs, ys) = List.all (fn x => contains (ys, x)) xs;
fun isEmpty l = case l of [] => true | _ => false;
fun bracketList s =
let
  val al = [40,41,91,93,123,125];
  val index = ref 0;
  val nl = ref [];
  val cl = explode s;
in
  while !index < size s do(
    if contains(al, ord(List.nth (cl,!index))) = true
    then nl := [List.nth (cl,!index)]@(!nl) else ();
    index := inc (!index));
rev (!nl)
end;
fun isMatch(i,j) = 
  if i = #"(" andalso j = #")" orelse
  i = #"[" andalso j = #"]" orelse
  i = #"{" andalso j = #"}"
  then true else false;
fun checkList(c, cl) = 
  if c = #"(" orelse c = #"[" orelse c = #"{"
  then [c] @ cl else
    if cl <> nil then
      if isMatch(hd cl, c) then tl cl else [c] @ cl
    else [c] @ cl;
fun isBalanced s =
  let
    val cl = bracketList s;
    val bl = foldl checkList [] cl;
  in
    if isEmpty bl then true else false
  end;
