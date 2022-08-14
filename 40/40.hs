import Data.Char

main = 
  print $ product $ map snd $ filter (\x -> fst x `elem` [ 10^i | i<- [0,1,2,3,4,5,6] ]) $ zip [1..] digits
    where 
      digits = map digitToInt (take 1000000 $ concat [show a | a <- [1..]])
