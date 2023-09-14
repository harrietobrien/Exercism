module Prime (nth) where
  
getSqrt x = floor . sqrt $ (fromIntegral x :: Float)

hasFactors :: Integer -> Integer -> [Integer] 
-- mf: max factor
hasFactors n mf = filter(\f -> n `mod` f == 0) [3..mf]

isPrime :: Integer -> Bool
isPrime n | n < 2 = False
  | n == 2 = True
  | even n = False
  | null (hasFactors n (getSqrt n)) = True
  | otherwise = False
  
nthHelper :: Int -> Integer -> Integer -> Integer
nthHelper n g f | f >= fromIntegral n = g
  | otherwise = do
  let guess = g + 1
  if isPrime guess
    then nthHelper n guess (f+1)
  else nthHelper n guess f

nth :: Int -> Maybe Integer
nth 0 = Nothing 
nth n = Just (fromIntegral (nthHelper n 0 0))