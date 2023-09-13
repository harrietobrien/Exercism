module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, findWithDefault, fromList)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)
allNucleotides = [A, C, G, T]

strToNucl = fromList (zip allNucleotides "ACGT")  
nuclCount str chr = length $ filter (== chr) str

validNucleotides :: String -> Bool
validNucleotides xs = all (`elem` "ACGT") xs

getCount :: Nucleotide -> String -> Int
getCount n xs = (nuclCount xs (findWithDefault '-' n strToNucl))
  
countList :: String -> [Int]
countList xs = map(`getCount` xs) allNucleotides

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs | validNucleotides xs = Right 
  (fromList(zip allNucleotides (countList xs)))
  | otherwise = Left "error"