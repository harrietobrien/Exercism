module Pangram (isPangram) where
import Data.Char
isPangram :: String -> Bool
isPangram text = 
  all (`elem` map toUpper text) ['A'..'Z']

