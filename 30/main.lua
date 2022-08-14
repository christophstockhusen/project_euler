function powerize(n)
  local result = 0
  local s = tostring(n)
  for i = 1, string.len(s) do
    result = result + math.pow(tonumber(string.sub(s, i, i)), 5)
  end
  return result
end

local sum = 0

local time = os.time()

for i = 2, 999999 do
  if powerize(i) == i then
    sum = sum + i
  end
end

print(sum)
print(string.format('This took %.2f seconds.', os.time() - time))
