<<-METRICS
  Time Complexity = O(n)
METRICS

def product_of_array_except_self(arr)
  product = arr.inject { |a,b| a * b }
  i = 0
  while (i < arr.length) do
    arr[i] = product / arr[i]
    i += 1
  end
  arr
end

input = [1,2,3,4]
output = [24,12,8,6]
p product_of_array_except_self(input) == output
