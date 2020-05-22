def rob(nums)
  return 0 if nums.empty?
  with_front = nums[0..nums.length-2]
  with_back = nums[1..nums.length-1]
  front = get_profit(with_front)
  back = get_profit(with_back)
  return [front,back].max
end

def get_profit(nums)
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

# p rob([]) == 0
# p rob([0]) == 0
# p rob([2,3,2]) == 3
# p rob([1,2,3,1]) == 4
# p rob([1,3,1,3,100]) == 103

# [1,3,1,3,100]

[rob([1,3,1,3]), rob([3,1,3,100])].max

