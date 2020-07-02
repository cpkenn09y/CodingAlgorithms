# CURRENTLY 173 / 187 test cases passed.

# require 'pry'
# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  return nums[0] if nums.length == 1
  curr_max = nums[0]
  curr_product = nums[0] # current_product is either the current num or the multiplication of the a series of numbers
  hypothetical_product = nums[0] # Keep track of a max product which is the max number...
  i = 1
  while (i < nums.length) do
    n = nums[i]
    curr_product = [
      n,
      curr_product * n
    ].max
    if hypothetical_product == 0
      hypothetical_product = n
    else
      hypothetical_product = hypothetical_product * n
    end
    puts "CURRENT_PROD #{curr_product}"
    puts "HYPO #{hypothetical_product}"
    curr_max = [curr_max,curr_product,hypothetical_product].max
    puts ":: CURRENT_MAX --> #{curr_max}"
    i += 1
  end
  return curr_max
end

p max_product([2,3,-2,4]) == 6

#            2, 3, -2, 4
# curr_prod  2  6  -2  4
# hypo       2  6  -12 -48
# curr_max   2  6  6   6

# p max_product([-2,0,-1]) == 0

#            -2 0 -1
# curr_prod  -2 0  0
# hypo       -2 0  0
# curr_max   -2 0  0

# p max_product([-2,3,-4]) == 24

#            -2  3 -4
# curr_prod  -2  3 -4
# hypo       -2 -6 24
# curr_max   -2  3 24

# p max_product([-2,3,0,-4,-7]) == 28
#           -2,  3,  0,  -4,  -7
# curr_prod -2   3   0   -4   28
# hypo      -2  -6   0   -4   28
# curr_max  -2   3   3    3   28
# p max_product([7,-2,-4]) == 56

p max_product([2,-5,-2,-4,3]) == 24 # not passing... need to use -2,-4,3...

           2,  -5,  -2,  -4,  3
curr_prod  2   -5   10   20  24
curr_min   2  -10   -2  -80
total_max  2    2   20   20

