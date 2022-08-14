local c = 100
local sum_square = math.pow(c*(c+1)/2,2)
local square_sum = 0
for i = 1,100 do
  square_sum = square_sum + math.pow(i,2)
end
print(sum_square - square_sum)
