fun inc n = n + 1;
fun distance (strand1: string, strand2: string): int option = 
  if size strand1 <> size strand2 then NONE else
    if strand1 = "" orelse strand2 = "" then SOME 0 else
      let
        val count = ref 0;
        val index = ref 0;
        val sl1 = String.explode(strand1);
        val sl2 = String.explode(strand2);
      in
        while !index < length sl1 do(
          if List.nth(sl1,!index) <> List.nth(sl2,!index)
          then count := inc(!count)
          else ();
          index := inc(!index)
         );
     SOME (!count)
end;