require 'pry'

def check_subarray_sum(nums, k)
    sum = 0
    map = {}
    map[0] = -1
    i = 0
    while (i < nums.length) do
      # binding.pry
      sum += nums[i] # sum #=> 23
      if (k != 0)
        sum = sum % k # 5... this is the remainder of 23 % 6...
      end
      if (map.has_key?(sum))
        # binding.pry
        if (i - map[sum] > 1)
          return true
        end
      else
        map[sum] = i
      end
      i += 1
    end
    return false
end


# a = [23,2,4,6,7]
# k = 6
# p check_subarray_sum(a,k) == true

# a = [23,2,6,4,7]
# k = 6
# p check_subarray_sum(a,k) == true

# a = [0,0]
# k = 0
# p check_subarray_sum(a,k) == true

# a = [23,2,6,4,7]
# k = 0
# p check_subarray_sum(a,k) == false


a = [15,0,0,3]
k = 4
p check_subarray_sum(a,k) == false
