module Phone (number) where
  
import Data.Char (isDigit) 
  
rmPunct :: String -> String
rmPunct = concatMap (\c -> 
  if isDigit c then [c] else "")

areaCode :: String -> String
areaCode = take 3

exchangeCode :: String -> String
exchangeCode xs = take 3 (drop 3 xs)

validCodes :: String -> Bool
validCodes s = head (areaCode s) > '1' 
  && head (exchangeCode s) > '1'

number :: String -> Maybe String
number xs | null s = Nothing
  | n == 10 && validCodes s = Just s
  | n == 11 && head s == '1' 
    && validCodes (tail s) = Just (tail s)
  | otherwise = Nothing
  where
    s = rmPunct xs
    n = length s