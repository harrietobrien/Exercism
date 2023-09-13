module Bob (responseFor) where
  
import Data.Char (isLetter, isUpper, isSpace)

inList :: Char -> String -> Bool
inList chr lst = chr `elem` lst

dropSpaces :: String -> String
dropSpaces = filter (not . isSpace)

allUpper :: String -> Bool
allUpper xs | filter isLetter xs == "" = False
 | otherwise = all isUpper (filter isLetter xs)

responseFor :: String -> String
responseFor xs | dropSpaces xs == "" = "Fine. Be that way!"
  | allUpper (dropSpaces xs) && last (dropSpaces xs) == '?' =
   "Calm down, I know what I'm doing!"
  | last (dropSpaces xs) == '?' = "Sure."
  | allUpper (dropSpaces xs) = "Whoa, chill out!"
  | otherwise = "Whatever."