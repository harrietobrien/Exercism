module Luhn (isValid) where

import Data.Char (isSpace, isLetter, isDigit, chr, ord)

rmSpaces :: String -> String
rmSpaces = filter (not . isSpace)

digitToInt :: Char -> Int
digitToInt c | isDigit c = ord c - ord '0'
  | otherwise = -1

allToInt :: String -> [Int]
allToInt n | null n = []
  | otherwise = map digitToInt n

luhnDouble :: Int -> Int
luhnDouble n | n * 2 > 9 = n * 2 - 9
  | otherwise = n * 2

doubleSeconds :: String -> [Int]
doubleSeconds n = zipWith ($) (cycle [id, luhnDouble]) (map digitToInt n)

isValid :: String -> Bool
isValid n | length digits <= 1 = False
  | not (all isDigit digits) = False
  | sum (doubleSeconds (reverse digits))  `mod` 10 == 0 = True
  | otherwise = False
    where digits = rmSpaces n