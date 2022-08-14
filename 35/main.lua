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
  return primes, sieve
end

function rotations(n)
  local time = os.time()
  local results = {}
  local n = tostring(n)
  local length = string.len(n)
  table.insert(results, n)
  for i = 1, string.len(n)-1 do
    local s = string.sub(n, 2) .. string.sub(n, 1, 1) 
    n = tonumber(s)
    table.insert(results, n)
  end
  return results
end

function have_same_length(strings)
  local length = string.len(strings[1])
  for _, s in pairs(strings) do
    if string.len(s) ~= length then
      return false
    end
  end
  return true
end

local time = os.time()

local max = 1000000
local primes, sieve = primes_to(max)
local rot_primes = {}
local cnt = 0

for _, prime in ipairs(primes) do
  local rotations = rotations(prime)
  local rot_prime = true
  if have_same_length(rotations) then
    for _, prime in pairs(rotations) do
      if sieve[prime] then
        rot_prime = false
        break
      end
    end
    if rot_prime then
      cnt = cnt + 1
    end
  end
end

print(cnt)

print(string.format("Time spend: %.2f seconds.", os.time() - time))
