local input = {}

local file = io.open('matrix.txt', 'r')
for line in file:lines() do
  local row = {}
  for num in string.gmatch(line, '%d+') do
    table.insert(row, tonumber(num))
  end
  table.insert(input, row)
end

file:close()

function distance(i,j,k,l,matrix)
  local dist = 0
  if not math.abs(i - k) + math.abs(j - k) == 1 then
    return -1
  else
    return ( matrix[i][j] + matrix[k][l] ) / 2
  end
end

local visited = {}
local distances = {}

function set_visited(i, j, visited)
  visited[i] = visited[i] or {}
  visited[i][j] = true
  return visited
end

function get_visited(i, j, visited)
  visited[i] = visited[i] or {}
  return visited[i][j] or false
end

function set_distance(i, j, dist, distances)
  distances[i] = distances[i] or {}
  distances[i][j] = dist
end

function get_distance(i, j, distances)
  distances[i] = distances[i] or {}
  return distances[i][j] or -1
end

function queue_next(queue)
  local element = table.remove(queue, 1)
  return element[1], element[2], element[3]
end

function queue_insert(i, j, priority, queue)
  table.insert(queue, { i, j, priority })
end

set_visited(1, 1, visited)

local queue = {}


-- dont forget to add start and end values
