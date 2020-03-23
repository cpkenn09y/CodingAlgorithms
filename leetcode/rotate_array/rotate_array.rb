# Time Spent: Completed in 17 minutes. Began at 5:18, end at 5:35.

# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modifying nums in-place instead.
<<-SOLUTION_1
  Time Complexity: O(N*M)
                     WHERE N is the number of elements in num
                     WHERE M is the value of k
  Space Complexity: 0(1)
SOLUTION_1
def rotate(nums, k)
  # nums # [1,2,3,4,5,6,7]
  last_used_num = nil
  k.times do
    nums.each_with_index do |num, i| # [7,2,3,4,5,6,7]
      if (i == 0)
        # Grab from the back
        nums[i] = nums[nums.length-1] # replacing the 1 with 7
      else
        # Grab from 1 index before
        nums[i] = last_used_num
      end
      last_used_num = num
    end
  end
  nums
end

<<-SOLUTION_2
  Time Complexity: O(N)
                     WHERE N is the number of elements in num
  Space Complexity: 0(1)
SOLUTION_2
def rotate(nums, k)
  # nums # [1,2,3,4,5,6,7]
  last_used_num = nil
  nums.each_with_index do |num, i| # [1,2,3,4,5,6,7]
    # 6 --> 0->1->2
    if (i == 0)
      # Grab from the back
      nums[i] = nums[nums.length-1] # replacing the 1 with 7
    else
      # Grab from 1 index before
      nums[i] = last_used_num
    end
    last_used_num = num
  end
  nums
end

def get_index_downstream(current_index, overall_length, k)
  current_index + k - overall_length # 6 + 1 - 7
end

p get_index_downstream(6,7,1) == 0 # [1,2,3,4,5,6,7]
p get_index_downstream(6,7,2) == 1 # [1,2,3,4,5,6,7]
p get_index_downstream(0,7,2) == 2 # [1,2,3,4,5,6,7]


# array = [1,2,3,4,5,6,7]
# p rotate(array, 3) == [5,6,7,1,2,3,4]

# array = [-1,-100,3,99]
# p rotate(array, 2) == [3,99,-1,-100]

<<-WORKING_WITH_THE_DATA
  [1,2,3,4,5,6,7]
  [7,1,2,3,4,5,6] # GRAB THE LAST ELEMENT
WORKING_WITH_THE_DATA


