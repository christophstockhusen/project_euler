function to_binary(num)
  local num = tonumber(num)
  local result = {}
  while num > 0 do
    local rest = math.fmod(num, 2)
    table.insert(result, rest)
    num = (num-rest)/2
  end
  return string.reverse(table.concat(result))
end

function from_binary(num)
  local num = string.reverse(num)
  local result = 0
  local b = 0.5
  for i = 1, string.len(num) do
    b = 2*b
    if string.sub(num, i, i) == 1 then
      result = result + b
    end
  end
  return result
end

function is_palindrome(s)
  return string.reverse(s) == s
end

local result = 0 + 1 + 3 + 5 + 7 + 9

local mid = { '', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' }

for i = 1,1000 do
  for _,v in pairs(mid) do
    local decimal_palindrome = tostring(i)..v..string.reverse(tostring(i))
    local binary_palindrome = to_binary(decimal_palindrome)
    if is_palindrome(decimal_palindrome) and is_palindrome(binary_palindrome) and 
      tonumber(decimal_palindrome) < 1000000 then
        result = result + tonumber(decimal_palindrome)
    end
  end
end

print(result)
