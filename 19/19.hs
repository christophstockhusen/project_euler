is_leap :: Integral a => a -> Bool
is_leap x = (x `mod` 4 == 0 && x `mod` 100 /= 0) || x `mod` 400 == 0

days_of_year :: Integral a => a -> a
days_of_year x
  | is_leap x = 366
  | otherwise = 365

days_of_month_with_year (month, year)
  | month `elem` [1,3,5,7,8,10,12] = 31
  | month == 2 && is_leap year = 29
  | month == 2 = 28
  | otherwise = 30

days_since :: Integral a => (a, a) -> a
days_since (month, year) =
  sum [ days_of_year a | a <- [1900..year-1] ] + 
  sum [ days_of_month_with_year (a, year) | a <- [1..month-1] ]


main =
  print $ length [ (month, year) | year <- [1901..2000], month <- [1..12],
                                   days_since (month, year) `mod` 7 == 6]
    -- print [ (a, b) | b <- [1..10], a <- [1..10]]
    -- print $ last firsts
  -- max_number_of_days = 1
  -- print $ is_leap 1985
