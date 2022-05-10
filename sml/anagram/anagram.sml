fun contains (ys, x) = List.exists (fn y => x = y) ys;
fun isSubsetOf (xs, ys) = List.all (fn x => contains (ys, x)) xs;
fun count c s = List.length (List.filter (fn x => x = c) (String.explode s))
fun inc x = x + 1;
fun clCheck s1 s2 =
let
  val index = ref 0;
  val check = ref true;
in
  while !index < size s1 do(
    let
      val c1 = List.nth(explode s1,!index);
    in
      if count c1 s1 <> count c1 s2 then check := false else ();
      index := inc(!index)
  end);
!check
end;
fun anagramsFor subject candidates =
  let
    val allLow = map Char.toLower;
    val index = ref 0;
    val cl = allLow (explode(subject));
    val nl = ref [];
  in
    while !index < length candidates do(
    let
      val currWord = List.nth(candidates,!index);
      val currList = allLow (explode(currWord));
    in
      if isSubsetOf(cl, currList) andalso
         isSubsetOf(currList, cl) andalso
         cl <> currList andalso
         length cl = length currList andalso
         clCheck (implode(cl)) (implode(currList))
      then nl := List.nth(candidates,!index)::(!nl) else();
      index := inc(!index)
  end);
rev (!nl)
end;