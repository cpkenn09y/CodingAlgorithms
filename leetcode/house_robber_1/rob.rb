def rob(nums)
  sum_even = 0
  sum_odd = 0
  nums.each_with_index do |num, i|
    if i % 2 == 0
      sum_even += num
    else
      sum_odd += num
    end
  end
  if sum_even > sum_odd
    return sum_even
  else
    return sum_odd
  end
end

p rob([1,2,3,1]) == 4

p rob([2,7,9,3,1]) == 12


p rob([7,2,3,5]) == 12
# choose 7

p rob([7,8,3,5]) == 12
# choose 8

# p rob([4,1,2,7,5,3,1]) == 14
