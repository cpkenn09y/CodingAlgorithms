def helper(arr)
  lowest = Float::INFINITY
  highest = -Float::INFINITY
  btm_req_index = 0
  top_req_index = arr.length - 1
  arr.each do |n|
    if n < lowest
      lowest = n
    end
    if n > highest
      highest = n
    end
  end
  was_able_to_reduce = false
  if arr[0] == lowest
    puts "allowed lowest of #{lowest}"
    btm_req_index += 1
    was_able_to_reduce = true
  end
  if arr[arr.length-1] == highest
    puts "allowed highest of #{highest}"
    top_req_index -= 1
    was_able_to_reduce = true
  end
  if was_able_to_reduce
    arr_to_check = arr.slice(btm_req_index..top_req_index)
    puts "Successfully reduced... attempting further reduction #{arr_to_check}"
    return helper(arr_to_check)
  else
    puts "UNABLE TO REDUCE FURTHER... returning #{arr.length}"
    return arr.length
  end
end

# @param {Integer[]} nums
# @return {Integer}
def find_unsorted_subarray(nums)
  return helper(nums)
end


# p find_unsorted_subarray([2, 6, 4, 8, 10, 9, 15]) == 5
# p find_unsorted_subarray([1, 2, 6, 4, 8, 10, 14, 15]) == 2
