local found = false
local u = 1

while not found do
  u = u + 1 
  for v = 1,u-1 do
    local x = u*u - v*v
    local y = 2*u*v
    local z = u*u + v*v
    if x+y+z == 1000 then
      found = true
      print(x*y*z)
    end
  end
end
