function primes_to(max)
  local sieve = {}
  local primes = {}
  for i = 2, max do
    if not sieve[i] then
      table.insert(primes, i)
      local j = i
      while i*j <= max do
        sieve[i*j] = true
        j = j+1
      end
    end
  end
  return primes
end

function num_of_divisors(x, primes)
  local divisor_cnt = 1
  local i = 1
  while x > 1 do
    local p = primes[i]
    local cnt = 0
    while x % p == 0 do
      cnt = cnt + 1
      x = x/p
    end
    i = i + 1
    divisor_cnt = divisor_cnt * (cnt + 1)
  end
  return divisor_cnt
end

local time = os.clock()

local k = 2
local found = false
local last_num_of_divisors = 1
local current_num_of_divisors

local primes = primes_to(20000)

while not found do

  if k % 2 == 0 then
    current_num_of_divisors = num_of_divisors(k/2, primes)
  else
    current_num_of_divisors = num_of_divisors(k, primes)
  end
  
  if last_num_of_divisors * current_num_of_divisors > 500 then
    found = true
  end

  last_num_of_divisors = current_num_of_divisors
  k = k + 1

end

print(((k-2)*(k-1))/2)

print(string.format("This took %.2f seconds.", os.clock() - time))
