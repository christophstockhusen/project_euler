-- We compute the factorial representation of 1000000 and then use the
-- factorial representation to compute the permutations, using the
-- Lehmer code.

function fac(n)
  local result = 1
  for i = 2, n do
    result = result * i
  end
  return result
end

local n = 1000000 - 1

-- Compute factorial representation

local factorial_representation = {}
for i = 9, 1, -1 do
  local coefficient = math.floor( n / fac(i) )
  table.insert(factorial_representation, coefficient)
  n = n - coefficient*fac(i)
end

table.insert(factorial_representation, 0)

-- Compute permutation

local permutation = {}
local number_list = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 }

for i = 1, #factorial_representation do
  local next = table.remove(number_list, factorial_representation[i] + 1)
  table.insert(permutation, next)
end

print(table.concat(permutation))
