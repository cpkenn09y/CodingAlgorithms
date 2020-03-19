# TIME COMPLEXITY  = O(n)
# SPACE COMPLEXITY = O(1)

def max_sub_array(array)
  max_sum = current_val = array[0]
  array.each_with_index do |num, i|
    if (i > 0)
      sum = current_val + num
      if (sum > num)
        current_val = sum
      else
        current_val = num
      end
      if current_val > max_sum
        max_sum = current_val
      end
    end
  end
  max_sum
end

# p max_sub_array([-2])      == -2
# p max_sub_array([-2,1])    == 1
# p max_sub_array([-2,1,-3]) == 1
p max_sub_array([-2,1,-3,4]) == 4
# p max_sub_array([-2,1,-3,4,-1,2,1,-5,4]) == 6



# Explanation: [4,-1,2,1] has the largest sum = 6.

<<-WORKING_WITH_THE_DATA
  current_sum = [-2,1] #=> sum -1 <  1 => KEEP 1 AS IS
  max_sum = 1
  current_sum = [1,-3] #=> sum -2 > -3 => KEEP -2 SUM
  max_sum = 1
  current_sum = [-3,4] #=> sum +1 <  4 => KEEP 4 AS IS
WORKING_WITH_THE_DATA
