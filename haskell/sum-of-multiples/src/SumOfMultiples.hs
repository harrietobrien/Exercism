module SumOfMultiples (sumOfMultiples) where
  
import Data.List (nub)

multiples :: Integer ->  Integer ->[Integer]
multiples 0 _ = []
multiples n l = [x | x <- [1..l - 1], x `mod` n == 0]

mergeFactors :: [Integer] -> Integer -> [Integer]
mergeFactors [] _ = []
mergeFactors ns lim = nub (multiples (head ns) lim ++ mergeFactors (tail ns) lim)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum (mergeFactors factors limit)