local BigInt = require('BigInt')

local v1 = BigInt.new({1})

for i = 1, 100 do
  local v2 = v1:clone()
  local j = 1
  while j < i do
    v1:add(v2)
    j = j + 1
  end
end

print(v1)

local result = 0
for v in string.gmatch(tostring(v1), '%d') do
  result = result + v
end
print(result)
