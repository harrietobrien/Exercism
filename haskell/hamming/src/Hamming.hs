module Hamming (distance) where

hammingHelper :: String -> String -> Integer -> Integer
hammingHelper xs ys count | null xs && null ys = count
  | otherwise = do 
    if head xs /= head ys then 
      hammingHelper (tail xs) (tail ys) (count +1)
    else hammingHelper (tail xs) (tail ys) count

distance :: String -> String -> Maybe Int
distance xs ys | length xs /= length ys = Nothing
  | otherwise = Just (fromIntegral (hammingHelper xs ys 0))
