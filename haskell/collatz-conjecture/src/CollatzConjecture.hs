module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n = if n <= 0 then Nothing
  else if n == 1 then Just 0
  else Just $ collatzHelper n 0
  where -- c: count
    collatzHelper n c | n == 1 = c
      | n `mod` 2 == 0 = collatzHelper (n `div` 2) c + 1
      | otherwise = collatzHelper (3 * n + 1) c + 1