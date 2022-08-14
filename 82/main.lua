local time = os.time()

local matrix = {}

local file = io.open('matrix.txt', 'r')
for line in file:lines() do
  local row = {}
  for number in string.gmatch(line, '%d+') do
    table.insert(row, tonumber(number))
  end
  table.insert(matrix, row)
end

file:close()

print(string.format('Read the input in %.2f seconds.', os.time() - time))

time = os.time()

local last = {}

for i = 1, #matrix do
  last[i] = matrix[i][1]
end

for i = 2, #matrix do
  local current = {}

  current[1] = last[1] + matrix[1][i]

  for j = 2, #matrix do
    current[j] = matrix[j][i] + math.min(current[j-1], last[j])
  end

  for j = #matrix-1, 1, -1 do
    current[j] = math.min(current[j], matrix[j][i] + current[j+1])
  end

  last = current
end

local min = last[1]
for i = 2, #matrix do
  min = math.min(min, last[i])
end

print(min)

print(string.format('Computed the solution in %.2f seconds.', os.time() - time))
