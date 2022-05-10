fun inc n = n + 1;
fun checkList ([], n) = false |
    checkList (factors: int list, n) =
      let
        val index = ref 0;
        val trues = ref 0;
      in
        while !index < length factors do(
          if n mod List.nth(factors,!index) = 0
          then (trues := inc(!trues); index := inc(!index))
          else index := inc(!index));
      if !trues = 0 then false else true
end;
fun sum (factors: int list, limit: int): int =
  (* if checkList => true then add # to sum *)
  let
    val s = ref 0;
    val n = ref 1;
  in
    while !n < limit do(
      if checkList(factors,!n)
      then (s := (!s + !n);
            n := inc(!n))
      else n := inc(!n));
!s
end;