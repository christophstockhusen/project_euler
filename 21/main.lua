function sieve(max)
  local sieve = {}
  local primes = {}
  
  for i = 2, max do
    if not sieve[i] then
      table.insert(primes, i)
      local k = i
      while i*k < max do
        sieve[i*k] = true
        k = k + 1
      end
    end
  end

  return sieve, primes
end


function d(num, primes)
  local i = 0
  local factorization = {}
  local input = num
  while num > 1 do
    i = i + 1
    local p = primes[i]
    while num % p == 0 do
      if not factorization[p] then
        factorization[p] = 0
      end
      factorization[p] = factorization[p] + 1 
      num = num / p
    end
  end

  local d = 1
  for p, a in pairs(factorization) do
    local factor = 0
    for i = 0, a do
      factor = factor + math.pow(p, i)
    end
    d = d * factor
  end

  return d - input
end

local time = os.time()

local sieve, primes = sieve(10000)
local amicables = {}
local sum = 0

for i = 1, 10000 do
  local div = d(i, primes)
  if not amicables[i] then
    amicables[div] = i
  else
    if amicables[i] == div then
      sum = sum + i + amicables[i]
    end
  end
end

print(sum)

print(string.format('This took %.2f seconds.', os.time() - time))
