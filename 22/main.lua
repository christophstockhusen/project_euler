function name_to_score(name)
  local result = 0
  for i = 1, string.len(name) do
    result = result + string.byte(string.sub(name, i, i)) - 64
  end
  return result
end

local time = os.time()

local names = {}

local f = io.open('names.txt', 'r')
local name_string = f:read('*all')
for name in string.gmatch(name_string, '%u+') do
  table.insert(names, name)
end
f:close()

table.sort(names)
local score = 0
for i = 1, #names do
  score = score + name_to_score(names[i])*i
end

print(score)
print(string.format('This took %.2f seconds.', os.time() - time))
