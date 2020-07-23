# ERROR: Above mentioned time complexity is incorrect... according to the solution, it says this is O(n^3)



# Time complexity: O(n^2)... where n is the size of the array... For example: An array of size 5 would be: 5+4+3+2+1 = 15... This would never be more than 5^2 which is 25...


def check_subarray_sum(a,k)
  p1 = 0
  while (p1 < a.length - 1) do
    p2 = p1 + 1
    while (p2 < a.length) do
      sum = a[p1..p2].sum
      if k == 0
        if k == sum
          return true
        else
          puts "Not accepted #{a[p1..p2]}"
        end
      else
        if (sum % k == 0)
          # it's a multiple of k
          puts "MATCHED #{a[p1..p2]}"
          return true
        end
      end
      p2 += 1
    end
    p1 += 1
  end
  return false
end

a = [23,2,4,6,7]
k = 6
p check_subarray_sum(a,k) == true

a = [23,2,6,4,7]
k = 6
p check_subarray_sum(a,k) == true

a = [0,0]
k = 0
p check_subarray_sum(a,k) == true

a = [23,2,6,4,7]
k = 0
p check_subarray_sum(a,k) == false
