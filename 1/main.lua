local result = 0
for i = 1,999 do
  if (i % 3 == 0) or (i % 5 == 0) then
    result = result + i
  end
end
print(result)
