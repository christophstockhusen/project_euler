local BigInt = {}
BigInt.__index = BigInt

function BigInt.new(val)
  local big_int = {}
  big_int.value = val
  setmetatable(big_int, BigInt)
  return big_int
end

function BigInt:set(val)
  self.value = val
end

function BigInt:get()
  return self.value
end

function BigInt:add(big_int)
  local v1 = self.value
  local v2 = big_int:get()

  if #v2 > #v1 then
    local tmp = v1
    v1 = v2
    v2 = tmp
  end

  local carry = 0
  local result = {}

  for i = 1, #v1 do
    local a = v1[i] or 0
    local b = v2[i] or 0
    local tmp = a + b + carry
    result[i] = tmp % 10
    carry = math.floor(tmp/10)
  end

  if carry == 1 then
    result[#result + 1] = 1
  end

  self.value = result
end

function BigInt:__tostring()
  return string.reverse(table.concat(self.value))
end

function BigInt:clone()
  local clone = BigInt.new(self.value)
  return clone
end

return BigInt
