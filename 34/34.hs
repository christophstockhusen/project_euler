factorial :: Integral a => a -> a
factorial x = product [1..x]

digits :: Integral a => a -> [a]
digits x
  | x == 0 = []
  | x > 0  = digits ((x-(x `mod` 10)) `div` 10) ++ [x `mod` 10]

digitFactorialSum :: Integral a => a -> a
digitFactorialSum x = sum $ map factorial $ digits x

main =
  print $ sum ([ x | x <- [3..factorial 9], digitFactorialSum x == x ])
