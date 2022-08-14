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

local last = {}
last[1] = matrix[1][1]
for i = 2, #matrix[1] do
  last[i] = last[i-1] + matrix[1][i]
end

local new = {}
for i = 2, #matrix do
  new = {}
  new[1] = last[1] + matrix[i][1]
  for j = 2, #last do
    new[j] = matrix[i][j] + math.min(new[j-1], last[j])
  end
  last = new
end

print(new[#matrix])

print(string.format('This took %.2f seconds.', os.time() - time))
