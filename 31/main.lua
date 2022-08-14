local coins = {1,2,5,10,20,50,100,200}
local target = 200
local d = {}

for i = 0, target do
  d[i] = 1
end

for coin = 2,#coins do
  for value = coins[coin],target do
    d[value] = d[value] + d[value-coins[coin]]
  end
end

print(d[target])

-- 73682
