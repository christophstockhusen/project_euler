function isPrime(p)
  if p == 1 then
    return false
  end

  if p == 2 then
    return true
  end

  for i = 2,math.floor(p/2) do
    if p % i == 0 then
      return false
    end
  end

  return true
end

local i = 2
local c = 0
while (c < 10001) do
  if isPrime(i) then
    c = c + 1
  end
  i = i + 1
end
print(i-1)
