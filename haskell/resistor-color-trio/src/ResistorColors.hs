module ResistorColors (Color(..), Resistor(..), label, ohms) where

import Data.Char (intToDigit, digitToInt)
import Data.Maybe (fromJust)

data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Eq, Show, Enum, Bounded, Ord)

newtype Resistor = Resistor { bands :: (Color, Color, Color) }
  deriving Show

allColors = [(minBound :: Color) ..]

colorMap = zip allColors [0..]

resistanceValue :: Color -> Char
resistanceValue c = intToDigit (fromJust (lookup c colorMap))

value :: (Color, Color) -> Int
value (a, b) = read (map resistanceValue [a, b])

label :: Resistor -> String
label (Resistor (x, y, z))
  | r < 10^3 = show r ++ " ohms"
  | r < 10^6 = show (r `div` 10^3) ++ " kiloohms"
  | r < 10^9 = show (r `div` 10^6) ++ " megaohms"
  | otherwise = show (r `div` 10^9) ++ " gigaohms"
  where
    r = ohms (Resistor (x, y, z))

ohms :: Resistor -> Int
ohms (Resistor (x, y, z)) = mainValue*10^k
  where
    mainValue = value (x, y)
    k = digitToInt (resistanceValue z)