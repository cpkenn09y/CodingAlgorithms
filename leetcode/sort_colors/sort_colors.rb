# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
  curr = 0
  p0 = 0 # leftmost boundary for zeros
  p2 = nums.length - 1 # rightmost boundary for 2's
  while (curr <= p2) do # [2,0,2,1,1,0]
    # [2,0,2,1,1,0]
    # [0,0,2,1,1,2]
    # [0,0,2,1,1,2]
    # [0,0,2,1,1,2]
    # [0,0,1,1,2,2]
    # p0 = 0
    # p2 = 5
    # curr = 0
    case nums[curr]
    when 0
      nums[curr] = nums[p0]
      nums[p0] = 0 # we know nums[curr] is zero due to the case statement
      p0 += 1
      curr += 1
    when 2
      nums[curr] = nums[p2] # [0,0,2,1,1,2]
      nums[p2] = 2 # we know nums[curr] is two due to the case statement
      p2 -= 1
    when 1
      curr += 1
    else
      raise "invalid value for #{nums[curr]}"
    end
  end
end


# 0 = red
# 1 = white
# 2 = blue


sort_colors([2,0,2,1,1,0]) == [0,0,1,1,2,2]


# [2,0,2,1,1,0]

# [0,2,2,1,1,0]
