fun inc n = n + 1;
fun concat ([]) = []
  | concat (lists: int list list): int list =
let
  val io = ref 0;
  val fl = ref [];
in
  while !io < length lists do(
    let
      val cl = List.nth(lists,!io);
      val ii = ref 0;
    in
      while !ii < length cl do(
        fl := List.nth(cl,!ii)::(!fl);
        ii := inc(!ii));
    io := inc(!io)
    end);
rev(!fl)
end;
fun reverse ([]) = []
  | reverse (list: int list): int list =
let
  val index = ref 0;
  val revl = ref [];
in
  while !index < length list do(
    revl := List.nth(list,!index)::(!revl);
    index := inc(!index));
!revl
end;
fun append (list1: int list, list2: int list): int list =
let
  val index = ref 0;
  val fl = ref (rev list1);
in
  while !index < length list2 do(
    fl := List.nth(list2,!index)::(!fl);
    index := inc(!index));
rev(!fl)
end;
fun filter (function: int -> bool, list: int list): int list =
let
  val fxn = function;
  val index = ref 0;
  val bl = ref [];
in 
  while !index < length list do(
    if fxn(List.nth(list,!index))
    then(bl := List.nth(list,!index)::(!bl);
    index := inc(!index))else index := inc(!index));
rev(!bl)
end;
fun map (function: int -> int, list: int list): int list =
let
  val fxn = function;
  val index = ref 0;
  val fl = ref [];
in
  while !index < length list do(
    fl := fxn(List.nth(list,!index))::(!fl);
    index := inc(!index));
rev(!fl)
end;
fun length ([]) = 0
  | length (ns: int list): int =
let
  val n = ref ns;
  val count = ref 0;
in
  while !n <> [] do(
    n := List.drop(!n,1);
    count := inc(!count));
!count
end;
fun foldl (function: int * int -> int, initial: int, list: int list): int =
let
  val index = ref 0;
  val fxn = function;
  val result = ref initial;
in
  while !index < length list do(
    result := fxn(!result,List.nth(list,!index));
    index := inc(!index));
!result
end;
fun foldr (function: int * int -> int, initial: int, list: int list): int =
let
  val index = ref 0;
  val fxn = function;
  val result = ref initial;
  val n = length list;
in
  while !index < length list do(
    result := fxn(List.nth(list,n-((!index)+1)),!result);
    index := inc(!index));
!result
end;