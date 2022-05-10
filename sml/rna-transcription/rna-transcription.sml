fun replace nucleotide =
  case nucleotide of
    #"G" => #"C"
  | #"C" => #"G"
  | #"T" => #"A"
  | #"A" => #"U";
fun inValid #"G" = false
  | inValid #"C" = false
  | inValid #"T" = false
  | inValid #"A" = false
  | inValid _ = true;
fun toRna (dna: string): string option =
  if List.find inValid (String.explode(dna)) <> NONE
  then NONE else
  let
    val dnaList = String.explode(dna);
    val rnaList = map replace dnaList;
  in
    SOME (String.implode(map replace dnaList))
end;