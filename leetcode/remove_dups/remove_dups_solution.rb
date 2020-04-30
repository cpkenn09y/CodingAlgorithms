def remove_duplicates(nums)
  p nums
  if nums.length == 0
    return 0
  end
  turtle = 0
  hare = 1
  while (hare < nums.length) do # for (var j=0;j<nums.length;i++)
    if (nums[turtle] == nums[hare])
      # do nothing...
    else
      turtle += 1
      nums[turtle] = nums[hare]
    end
    nums[hare] = "_"
    hare += 1
    p nums #=> [x,y]
  end
  return turtle + 1
end

a = ["x", "x", "y"]

<<-PSEUDOCODE
  ["x", "x", "y"]
  ["x", "_", "y"]
  ["x", "y", "_"]
PSEUDOCODE

puts remove_duplicates(a)
