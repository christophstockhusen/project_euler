import Data.List

-- remove_dups :: (Ord a, Eq a) => [a] -> [a]
-- remove_dups xs = remove $ sort xs
--   where
--     remove []  = []
--     remove [x] = [x]
--     remove (x1:x2:xs)
--       | x1 == x1  = remove (x1:xs)
--       | otherwise = x1 : remove (x2:xs)

main = do
  print $ length $ nub [a^b | a <- [2..100], b <- [2..100]]
