import Data.List

divisors x = [ a | a <- [1..(x `div` 2)], x `rem` a == 0]

main = 
  print $ sum [ a | a <- [1..limit], not $ a `elem` abundantSums]
    where
      limit = 28123
      abundantNumbers = [ a | a <- [1..limit], (sum $ divisors a) > a]
      abundantSums = nub [ a+b | a <- abundantNumbers, b <- abundantNumbers, a+b <= limit]
