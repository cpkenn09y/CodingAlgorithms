# We take our find_profit method from the first House Robber problem and use it to find the max profit from the array without the first house and the array without the last house since we can't rob both of them or we'll get caught.

# A really quick overview of the House Robber 1 part of the problem. For every index, we want to find the maximum profit we could make at that index so far. For the first index, it would simply be nums[0] and the second the max between index 0 and 1.

# From there on out, the maximum at each index is either the previous max profit or the previous-previous + current since you can't rob adjacent houses.

require 'pry'

def rob(nums)
    return 0 if nums.length==0
    return nums[0] if nums.length==1
    return [nums[0], nums[1]].max if nums.length==2
    puts "for front_to_back #{nums[0...-1]}"
    puts "for back_to_front #{nums[1..-1].reverse}"
    binding.pry
    front_to_back = find_profit(nums[0...-1])
    back_to_front = find_profit(nums[1..-1].reverse)
    [front_to_back, back_to_front].max
end

def find_profit(nums)
    profit = Array.new(nums.length)
    profit[0] = nums[0]
    profit[1] = [nums[0], nums[1]].max
    (2...nums.length).each do |i|
        profit[i] = [profit[i-2] + nums[i], profit[i - 1]].max
    end
    profit.last
end

# p rob([]) == 0
# p rob([0]) == 0
# p rob([2,3,2]) == 3
p rob([2,3,9]) == 11
# p rob([1,2,3,1]) == 4
# p rob([1,3,1,3,100]) == 103
