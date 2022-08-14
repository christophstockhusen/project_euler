local input = 600851475143
local i = 2
while (input > 1) do
  while (input % i == 0) do
    input = input / i
  end
  i = i + 1
end
print(i-1)
