local input = {}

function diagup(i, j)
  local result = 1
  for k = 0,3 do
    result = result * input[i-k][j+k]
  end
  return result
end

function diagdown(i, j)
  local result = 1
  for k = 0,3 do
    result = result * input[i+k][j+k]
  end
  return result
end

function down(i, j)
  local result = 1
  for k = 0,3 do
    result = result * input[i+k][j]
  end
  return result
end

function right(i, j)
  local result = 1
  for k = 0,3 do
    result = result * input[i][j+k]
  end
  return result
end

local f = io.open('input.txt', 'r')

local i = 0
for line in f:lines() do
  i = i + 1
  local t = {}
  local j = 0
  for v in string.gmatch(line, '%d%d') do
    j = j + 1
    t[j] = tonumber(v)
  end
  input[i] = t
end

local max_value = 0

for i = 1, #input do
  for j = 1, #input do
    if i < #input - 2  and j < #input - 2 then
      max_value = math.max(max_value, diagdown(i,j))
    end
    if i > 3  and j < #input - 2 then
      max_value = math.max(max_value, diagup(i,j))
    end
    if i < #input - 2 then
      max_value = math.max(max_value, down(i,j))
    end
    if j < #input - 2 then
      max_value = math.max(max_value, right(i,j))
    end
  end
end

print(max_value)
