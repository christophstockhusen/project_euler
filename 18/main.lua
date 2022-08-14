local input = {}
local file = io.open('input.txt', 'r')

for line in file:lines() do
  local t = {}
  local i = 0
  for v in string.gmatch(line, '%d%d') do
    i = i + 1
    t[i] = tonumber(v)
  end
  table.insert(input, t)
end

local last = input[#input]

local current = {}
for i = #input-1, 1, -1 do
  current = {}
  for j = 1, i do
    current[j] = math.max(last[j]+input[i][j], last[j+1]+input[i][j])
  end
  last = current
end

print(last[1])
