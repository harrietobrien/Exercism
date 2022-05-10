fun inc n = n + 1;
fun isVowel #"a" = true
  | isVowel #"e" = true
  | isVowel #"i" = true
  | isVowel #"o" = true
  | isVowel #"u" = true
  | isVowel _ = false;
fun getcc word =
let
  val cl = explode(word);
  val cc = ref [];
  val i = ref 0;
in
  while (not (isVowel(List.nth(cl,!i))
  orelse (List.nth(cl,!i) = #"y" andalso List.nth(cl,0) <> #"y")))
  orelse (((List.nth(cl,!i) = #"u" andalso List.nth(cl,0) <> #"u")
  andalso List.nth(cl,!i-1) = #"q"))
  do(
    cc := List.nth(cl,!i)::(!cc);
    i := inc(!i));
rev(!cc)
end;
fun translateWord (input: string): string =
let
  val cl = explode(input);
  val cc = getcc(input);
  val rest = List.drop(cl,length(cc));
in
  if isVowel (List.nth(cl,0)) orelse
  (List.nth(cl,0)= #"x" andalso List.nth(cl,1)= #"r") orelse
  (List.nth(cl,0)= #"y" andalso List.nth(cl,1)= #"t")
  then implode(cl@[#"a",#"y"])
  else implode(rest@cc@[#"a",#"y"])
end;
fun contains (ys, x) = List.exists (fn y => x = y) ys;
fun add_spaces [] = ""
  | add_spaces [s] = s
  | add_spaces (s::ss) = s ^ " " ^ add_spaces ss;
fun translate (input: string): string =
  let
    val wordList = String.tokens Char.isSpace input;
    val index = ref 0;
    val strList = ref [];
  in
    while !index < length wordList do(
      strList := [translateWord(List.nth(wordList,!index))]@(!strList);
      index := inc(!index));
  add_spaces(rev(!strList))
end;