module Anagram (anagramsFor) where
import Data.List (sort)
import Data.Char (toLower)

isAnagram :: String -> String -> Bool
isAnagram w w' | lw == lw' = False
  | otherwise = sort lw == sort lw'
    where 
      lw = map toLower w
      lw' = map toLower w'
    
anagramsFor :: String -> [String] -> [String]
anagramsFor xs = filter (isAnagram xs)