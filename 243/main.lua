function sieve(max)
  local sieve = {}
  local primes = {}

  for i = 2, max do
    if not sieve[i] then
      table.insert(primes, i)
      local j = i
      while i*j < max do
        sieve[i*j] = true
        j = j + 1
      end
    end
  end

  return primes, sieve
end

function euler(prime_factorization)
  local result = 1
    for prime, exp in pairs(prime_factorization) do
      if exp > 0 then
        result = result * ( math.pow(prime, exp) - math.pow(prime, exp-1) )
      end
    end
  return result
end

function prime_factorization(n, primes)
  local prime_factorization = {}

  local i = 1
  while n > 1 do
    local prime = primes[i]
    while n % prime == 0 do
      prime_factorization[prime] = prime_factorization[prime] or 0
      prime_factorization[prime] = prime_factorization[prime] + 1
      n = n / prime
    end
    i = i + 1
  end

  return prime_factorization
end

local time = os.time()

local primes, sieve = sieve(1000000)

local limit = 15499/94744
local denominator = 94744

while true do
  local nominator = euler(prime_factorization(denominator, primes))
  if nominator/(denominator-1) < limit then
    print(denominator)
    break
  else
    denominator = denominator + 1
  end

  if denominator % 100000 == 0 then
    print(denominator)
  end
end

print(string.format('This took %.2f seconds.', os.time() - time))
