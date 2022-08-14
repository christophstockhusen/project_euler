function factorial(n)
  local result = 1
  while n > 1 do
    result = result * n
    n = n - 1
  end
  return result
end

print(factorial(40)/(factorial(20)*factorial(20)))
