module DNA (toRNA) where

swapAt str ch = [ y | (x, y) <- zip str [0..], x == ch ]
    
getComplement :: Int -> Char
getComplement p = "CGAU" !! p

notNucleotides = filter(`notElem` "GCTA")

validStrand :: String -> String
validStrand str | null (notNucleotides str) = []
  | otherwise = [head (notNucleotides str)]
  
swapAll = map(getComplement . head . swapAt "GCTA")

toRNA :: String -> Either Char String
toRNA xs | null (validStrand xs) = Right (swapAll xs)
  | otherwise = Left (head (validStrand xs))