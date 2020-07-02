# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  return nums[0] if nums.length == 1
  curr_max = nums[0]
  # current_product is either the current num or the multiplication of the a series of numbers
  curr_product = nums[0]
  # Keep track of a max product which is the max number... absolute powered...
  i = 1
  while (i < nums.length) do
    n = nums[i]
    curr_product = [
      n,
      curr_product * n
    ].max
    curr_max = curr_product if curr_product > curr_max
    i += 1
  end
  return curr_max
end

# p max_product([2,3,-2,4]) == 6
# p max_product([-2,0,-1]) == 0
p max_product([-2,3,-4]) == 24

