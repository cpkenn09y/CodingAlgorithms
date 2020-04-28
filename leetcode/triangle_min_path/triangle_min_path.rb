def triangle_min_path(t)
  sum = 0
  t.each do |r|
    sum = sum + r.min
  end
  return sum
end
t = [
     [2],
    [3,4],
   [6,5,7],
  [4,1,8,3]
]
p triangle_min_path(t) == 11
