# NOTE: This is based on the solution_rob.java which is directly from leetcode...
def rob(nums)
  return 0 if nums.length == 0
  return nums[0] if nums.length == 1
  curr_max = 0
  prev_max = 0
  nums.each do |n|
    temp = curr_max
    curr_max = [prev_max + n, curr_max].max
    prev_max = temp
  end
  return curr_max
end

p rob([])  == 0
p rob([2]) == 2
p rob([1,2,3,1]) == 4
p rob([2,7,9,3,1]) == 12
p rob([7,2,3,5]) == 12
p rob([7,8,3,5]) == 13
p rob([4,1,2,7,5,3,1]) == 14
