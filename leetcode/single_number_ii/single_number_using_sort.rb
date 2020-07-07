# Time: O(nlog(n) + n)
# Space: O(1)

# require 'pry'
# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  return nums[0] if nums.length == 1
  curr_val = nil
  curr_count = nil
  nums.sort.each_with_index do |n,i|
    if i == 0
      curr_val,curr_count = n,1
      next
    end
    if curr_val == n
      curr_count += 1
      puts "Incrementing #{n} to #{curr_count}"
    else
      return curr_val if curr_count != 3 # this means we've found the item that does not have 3 occurences
      curr_val = n
      curr_count = 1
      puts "Found #{n}. Setting to #{curr_count}"
    end
    return n if (i == nums.length - 1 && curr_count == 1)
  end
  raise "Nums passed in is invalid based on the problem description."
end

# p single_number([2,2,3,2]) == 3
# p single_number([0,1,0,1,0,1,99]) == 99
# p single_number([-2,-2,1,1,-3,1,-3,-3,-4,-2]) == -4
