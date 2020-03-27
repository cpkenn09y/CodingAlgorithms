require 'pry'

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  first_number = nums[0]
  i = (nums.length / 2).floor # i == 3
  middle_num = nums[i]
  if middle_num == target
    return i
  elsif target > first_number && target < middle_num
    new_collection = nums.slice(1,i-1) # slice(1,2)
  else
    new_collection = nums.slice(i+1,nums.length-i-1) # slice(4,3)
  end

  # RECURSE...?
  i = (new_collection.length / 2).floor
  middle_number = new_collection[i]
  if middle_number == target
    return i
  elsif target < middle_number
    puts "target #{target} LESS THAN #{middle_number}. new_collection is #{new_collection[0..i]}"
    new_collection = new_collection[0..i]
  else
    puts "target #{target} GREATER THAN #{middle_number}. new_collection is #{[i..new_collection.length-1]}"
    new_collection = new_collection[i..new_collection.length-1]
  end
  new_collection
end

p search([4,5,6,7,0,1,2],0)# == 4
