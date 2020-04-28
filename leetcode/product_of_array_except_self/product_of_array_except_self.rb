<<-METRICS
  Time Complexity = O(n^2)
  The challenge says to solve it in O(n)... see v2.
METRICS

def product_of_array_except_self(arr)
  i = 0
  j = 0
  result = []
  product = 1
  while (i < arr.length) do
    if i == j
      j += 1
      next
    end
    if j >= arr.length
      result[i] = product
      product = 1
      i += 1
      j = 0
    else
      product *= arr[j]
      j += 1
    end
  end
  result
end

input = [1,2,3,4]
output = [24,12,8,6]
p product_of_array_except_self(input) == output

<<-SANDBOX
  1,2,3,4
  product = 24
  i = 0
  j = 1
  while (i < arr.length) do
    arr[i] = arr[j]
    if j > arr
      j += 1

  end
SANDBOX
