datatype allergen = Eggs | Peanuts | Shellfish | Strawberries
                  | Tomatoes | Chocolate | Pollen | Cats | NONE;
val al = [Eggs, Peanuts, Shellfish, Strawberries,
              Tomatoes, Chocolate, Pollen, Cats];
fun inc n = n + 1;
fun compound 0 f x = x 
  | compound n f x = compound (n-1) f (f x)
fun exp b e = compound e (fn x => b*x) 1;
fun getScore a =
  let
    val start = ref 0wx01;
    val index = ref 0;
  in
    while !index < length al do(
      if List.nth(al,!index) = a then
      (start := (!start) * Word.fromInt (exp 2 (!index));
      index := inc(!index))
      else index := inc(!index));
!start
end;

fun allergicTo score a = 
  Word.andb(getScore a, Word.fromInt score) <> 0wx0;

fun allergies (score: int): allergen list =
  let 
    val index = ref 0;
    val result = ref [];
  in
    while !index < length al do(
      if allergicTo score (List.nth(al,!index))
      then (result := List.nth(al,!index)::(!result);
      index := inc(!index)) else index := inc(!index));
  rev(!result)
end;