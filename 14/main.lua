local succ = {}
succ[1] = 1
local length = {}
length[1] = 1

local save = 0

local max_length = 1
local max_start = 1

for i = 1, 1000000 do
  local v = i
  local sequence = {}
  while v > 1 and not succ[v] do
    table.insert(sequence, v)
    if v % 2 == 0 then
      v = v/2
    else
      v = 3*v+1
    end
  end

  local current_length = length[v]
  local last = v
  for j = #sequence, 1, -1 do
    current_length = current_length + 1
    succ[sequence[j]] = last
    length[sequence[j]] = current_length
    last = sequence[j]
  end

  if length[last] > max_length then
    max_length = length[last]
    max_start = last
  end
end

print('Chain from '..max_start..' has length '..max_length..'.')
