fun sum n = (n*(n+1.0))/2.0;
fun squareOfSum n = round((sum (Real.fromInt(n)))*(sum (Real.fromInt(n))));
fun sumOfSquares n = round((Real.fromInt(n)*Real.fromInt(n)*Real.fromInt(n))/3.0 + (Real.fromInt(n)*Real.fromInt(n))/2.0 + Real.fromInt(n)/6.0);

fun differenceOfSquares n =
  squareOfSum n - sumOfSquares n;