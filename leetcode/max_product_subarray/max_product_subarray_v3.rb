# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  curr_max = nums[0]
  curr_min = nums[0]
  total_max = nums[0]
  i = 1
  while (i < nums.length) do
    n = nums[i]
    prod_of_max = curr_max * n
    prod_of_min = curr_min * n
    curr_max = [n,prod_of_max,prod_of_min].max
    curr_min = [n,prod_of_max,prod_of_min].min
    total_max = [total_max,curr_max,curr_min].max
    i += 1
  end
  return total_max
end

# p max_product([2,3,-2,4]) == 6

# p max_product([-2,0,-1]) == 0

# p max_product([-2,3,-4]) == 24

# p max_product([-2,3,0,-4,-7]) == 28

# p max_product([2,-5,-2,-4,3]) == 24

