local result = 2
local a = 1
local b = 2
local c = a + b

while (c <= 4000000) do
  if (c % 2 == 0) then
    result = result + c
  end
  a = b
  b = c
  c = a + b
end

print(result)
