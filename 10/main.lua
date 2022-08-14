local sieve = {}
local sum = 0
local max = 2000000

for i = 2, max do
  if not sieve[i] then
    sum = sum + i
    local j = i
    while i*j <= max do
      sieve[i*j] = true
      j = j + 1
    end
  end
end

print(sum)
