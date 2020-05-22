def rob(nums)
  if nums.empty? || nums == [] || nums == nil
    return 0
  end
  is_odd_length = !(nums.length % 2 == 0)
  if is_odd_length && nums.length > 1
    last_val = nums.pop
    nums[0] = last_val if last_val > nums[0]
  end
  sum_even = 0
  sum_odd = 0
  nums.each_with_index do |n,i|
    if i % 2 == 0
      sum_even += n
      puts "sum_even #{sum_even}"
    else
      sum_odd += n
      puts "sum_odd #{sum_odd}"
    end
  end

  return [sum_even,sum_odd].max
end

# p rob([]) == 0
# p rob([0]) == 0
# p rob([2,3,2]) == 3
# p rob([1,2,3,1]) == 4
# p rob([1,3,1,3,100]) == 103
