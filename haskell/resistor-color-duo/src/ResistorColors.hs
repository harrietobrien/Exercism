module ResistorColors (Color(..), value) where
  
import Data.Char (intToDigit)
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
  deriving (Eq, Show, Enum, Bounded)
  
allColors = [(minBound :: Color) ..]

colorMap = zip allColors [0..]

resistanceValue :: Color -> Char
resistanceValue c = intToDigit (fromJust (lookup c colorMap))

value :: (Color, Color) -> Int
value (a, b) = read (map resistanceValue [a,b])