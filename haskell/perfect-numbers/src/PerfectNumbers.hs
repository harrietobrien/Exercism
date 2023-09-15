module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

getDivisors :: Int -> [Int]
getDivisors n = filter ((==0) . rem n) [1 .. n `div` 2]

classify :: Int -> Maybe Classification
classify n | n <= 0 = Nothing
  | (sum (getDivisors n)) == n = Just Perfect
  | (sum (getDivisors n)) >= n = Just Abundant
  | (sum (getDivisors n)) <= n = Just Deficient

