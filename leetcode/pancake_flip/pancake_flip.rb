# ASSUMPTION:
# * no repeated integers...

# NOTE: Does not solve for repeated integers... if we need to solve for that, I will have to do an index_of check of the array

require 'pry'

def flip_at_index!(a, index)
  a.slice(0,index+1).reverse.each_with_index do |num,i|
    a[i] = num
  end
end

def flip_full_pancake!(a,flip_record)
  flip_record << a.length
  flip_at_index!(a,a.length)
end


def flip_at_highest_index!(a,flip_record=[]) # [4, 2, 3, 1]
  puts "NEW FLIPPING... #{a}... #{flip_record}"
  return flip_record if a == []
  highest = -Float::INFINITY
  index_of_numbers = {}
  a_length_minus_one = a.length-1
  a.each_with_index do |num,i|
    highest = num if (num > highest)
    index_of_numbers[num] = i
  end
  if index_of_numbers[highest] == a_length_minus_one
    # Our desired number is at the end... then we need to pancake sort with a subarray
    flip_at_highest_index!(a.slice(0,a_length_minus_one),flip_record)
  else
    # Flip at the the index of the highest number
    # [3,2,4,1]
    target_index = index_of_numbers[highest]
    flip_record << target_index + 1
    puts "BEFORE: #{a}"
    flip_at_index!(a,target_index)
    puts "AFTER: #{a}"
  end

  if a[0] == highest
    # We successfully got the highest number to the front... therefore, we need to flip the whole pancake
    puts "FLIPPING THE WHOLE PANCAKE BEFORE: #{a}"
    flip_full_pancake!(a,flip_record)
    puts "FLIPPING THE WHOLE PANCAKE AFTER: #{a}"

    puts "HIGHEST NOW AT END... USING SUBARRAY... #{a.slice(0,a_length_minus_one)}"
    flip_at_highest_index!(a.slice(0,a_length_minus_one),flip_record) # Reflip using the SUBARRAY...
  else
    flip_at_highest_index!(a,flip_record)
  end
  return flip_record
end

# @param {Integer[]} a
# @return {Integer[]}
def pancake_sort(a)
  flip_at_highest_index!(a)
end

pancake_sort([3,2,4,1])
