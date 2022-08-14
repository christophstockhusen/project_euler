import Data.List

primesTo :: (Integral a) => a -> [a]
primesTo x = sieve [2..x]
  where
    sieve [] = []
    sieve (p:xs) = p : sieve (xs `minus` [p*p, p*p+p..])
      where
        minus (x:xs) (y:ys)
          | x <  y = x : minus xs (y:ys)
          | x == y = minus xs ys
          | x >  y = minus (x:xs) ys
        minus xs _ = xs

factorWithPrimes :: (Integral a) => a -> [a] -> [(a,a)]
factorWithPrimes x (p:ps)
  | x == 1         = [(1,1)]
  | x `mod` p == 0 = (p, pDiv x p) : factorWithPrimes (x `div` (p^(pDiv x p))) ps
  | otherwise      = factorWithPrimes x ps
  where
    pDiv :: (Integral a) => a -> a -> a
    pDiv x p = maximum [ a | a <- [1..p], x `mod` p^a == 0]
factorWithPrimes x _ = [(x, 1)]

sigma1 :: (Integral a) => [(a, a)] -> a
sigma1 ps = product [ (p^(a+1)-1) `div` (p-1) | (p, a) <- ps, p /= 1]
  
main =
  let
    limit = 28123
    primes = primesTo limit
    abundantNumbers = [ a | a <- [1..limit], (sigma1 (factorWithPrimes a primes) - a) > a]
    abundantSums = nub (sort [ a+b | a <- abundantNumbers, b <- abundantNumbers, a+b <= limit])
  in
    print $ sum [ a | a <- [1..limit], not $ a `elem` abundantSums]
