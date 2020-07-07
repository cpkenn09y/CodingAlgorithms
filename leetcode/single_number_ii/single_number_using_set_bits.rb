<<-NOTES
  * Does not seem possible for this technique to handle negative numbers without taking up O(n) space
      - we could keep track of a hash of the different nums or something...

  Time: O(n+m)
    * O(n) for one iteration over all the numbers
    * O(m) for a final iteration over the bit remainder which should be less than or equal to 32 based on 32-bits
  Space: O(m)
    * the bit remainder string can be up to 32 bits
NOTES


# require 'pry'
# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  return nums[0] if nums.length == 0
  bit_sum = 0
  nums.each do |n|
    bit_sum += ("%b" % n).to_i
  end
  bit_remainder = String.new
  bit_sum.to_s.each_char do |s|
    bit_remainder.concat((s.to_i % 3).to_s)
  end
  puts "FINAL bit_remainder --> #{bit_remainder}" #=> "expectation is 11"
  puts "Convert to int --> #{bit_remainder.to_i(2)}"
  return bit_remainder.to_i(2)
end

# p single_number([2,2,3,2]) == 3
# p single_number([0,1,0,1,0,1,99]) == 99
# p single_number([-2,-2,1,1,-3,1,-3,-3,-4,-2]) == -4 #=> Does not work for negative integers...
