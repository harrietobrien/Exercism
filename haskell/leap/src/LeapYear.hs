module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year | 0 == year`mod`100 = 0 == year`mod`400
	            | otherwise = 0 == year`mod`4