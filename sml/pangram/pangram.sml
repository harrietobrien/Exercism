
val lowercase_letters = List.tabulate (26, fn x => chr (x + ord #"a"));

val lower = String.map Char.toLower;

fun contains (ys, x) = List.exists (fn y => x = y) ys;
fun isSubsetOf (xs, ys) = List.all (fn x => contains (ys, x)) xs;

fun isPangram s = isSubsetOf(lowercase_letters, explode(lower(s)));