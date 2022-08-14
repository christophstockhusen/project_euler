function isPalindrome(p)
  local p = tostring(p)
  return p == string.reverse(p)
end

function makePalindromeNumber(p)
  return tonumber(tostring(p)..string.reverse(tostring(p)))
end

local found = false
local c = 997

while c > 1 and not found do
  local p = makePalindromeNumber(c)
  local d1 = math.floor(math.sqrt(p))
  local d2 = p / d1

  while d1 < 1000 and d2 > 99 and not found do
    if p % d1 == 0 and p % d2 == 0 then
      found = true
      print(d1 .. " * " .. d2 .. " = " .. d1*d2)
    end
    d1 = d1 + 1
    d2 = p / d1
  end

  c = c - 1
end
