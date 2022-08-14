{-- Idea: Reduce the search space.
 -  1. b has to be a prime number
 -  2. |a| has to be odd and less or equal to b
-}

-- import Data.List

primesTo :: Integer -> [Integer]
primesTo x = 2 : [ a | a <- [3,5..x], is_prime a]

primes = sieve [2..]
  where 
    sieve (p:xs) = p : sieve (filter (\x -> x `mod` p /= 0) xs)

prime_points_of_polynome :: Integer -> Integer -> [Integer]
prime_points_of_polynome a b = collect_prime_values a b  [0,1..]
  where 
    collect_prime_values :: Integer -> Integer -> [Integer] -> [Integer]
    collect_prime_values a b (x:xs)
      | is_prime (x^2+a*x+b) = x : collect_prime_values a b xs
      | otherwise = []

is_prime :: Integer -> Bool
is_prime x = x `elem` (takeWhile (\y -> y <= x)  primes)

number_of_prime_points :: Integer -> Integer -> Integer
number_of_prime_points a b = toInteger $ length $ takeWhile (\x -> is_prime (x^2+a*x+b)) [0..] 

set_number_of_prime_points :: (Integer,Integer,Integer) -> (Integer,Integer,Integer)
set_number_of_prime_points (a,b,c) = (a,b,toInteger $ number_of_prime_points a b)

find_maximum :: [(Integer,Integer,Integer)] -> (Integer,Integer,Integer)
find_maximum ((a1,b1,c1):(a2,b2,c2):xs)
  | c1 >  c2 = find_maximum ((a1,b1,c1):xs)
  | c1 <= c2 = find_maximum ((a2,b2,c2):xs)
find_maximum [x] = x

main = 
  print $ (fst max) * (snd max) 
    where
      fst (a,b,c) = a
      snd (a,b,c) = b
      max = find_maximum [ set_number_of_prime_points a | a <- coefficients ]
        where 
          coefficients = [ (a,b,0) | b <- primesTo 999, b < 999, 
                                     a <- [-999,-997..999], abs a <= b]
