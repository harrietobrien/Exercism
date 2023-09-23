module Isogram (isIsogram) where

import Data.Set (fromList)
import Data.Char (isLetter, toLower)

rmPunct :: String -> String
rmPunct = concatMap (\c -> 
  if isLetter c then [c] else "")
 
isIsogram :: String -> Bool
isIsogram xs = length s == length (fromList s)
  where
    s = map toLower (rmPunct xs)