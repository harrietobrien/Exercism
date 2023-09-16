module ArmstrongNumbers (armstrong) where
  
getDigits :: Integral x => x -> [x]
getDigits 0 = []
getDigits n = (n `mod` 10) : getDigits (n `div` 10)

power :: [Int] -> [Int]
power n = map (\x -> x ^ length n) n

armstrong :: Integral a => a -> Bool
armstrong n | x < 10 = True
  | x > 9 && x < 100 = False
  | otherwise = sum (power d) == x
  where
    x = fromIntegral n
    d = reverse (getDigits x)