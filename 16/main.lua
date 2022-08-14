local value = string.format('%.0f', math.pow(2,1000))
local result = 0
for i = 1, string.len(value) do
  result = result + tonumber(string.sub(value, i, i))
end
print(result)
