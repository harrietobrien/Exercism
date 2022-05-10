(* Rose tree *)
datatype 'a tree = Empty 
                 | Elem of 'a 
                 | List of 'a tree list
fun flatten Empty = []
  | flatten (List []) = []
  | flatten (Elem x) = [x]
  | flatten (List (x::xs'))= flatten x @ flatten (List xs')