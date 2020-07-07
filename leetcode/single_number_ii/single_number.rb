# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  freq_map = {}
  nums.each do |n|
    if freq_map[n]
      freq_map[n] += 1
    else
      freq_map[n] = 1
    end
  end
  freq_map.each do |k,v|
    return k if v == 1
  end
  raise "Invalid input. No number with only one occurence."
end

p single_number([2,2,3,2]) == 3
p single_number([0,1,0,1,0,1,99]) == 99
