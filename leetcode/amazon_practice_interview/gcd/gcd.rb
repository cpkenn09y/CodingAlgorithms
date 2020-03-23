# Space Complexity
# Time Complexity: O(n * m) where n is the length of the array & where m is the largest integer within the array

# @param  Integer   num
# @param  Integer[] arr
# @return Integer
def generalizedGCD(num, arr)
  max_gcd = 1
  largest_num = arr.max
  i = 2
  until (i > largest_num) do
    counter = 0
    arr.each do |positive_integer|
      if positive_integer % i == 0
        counter += 1
      end
    end
    if counter == arr.length
      max_gcd = i
    end
    i += 1
  end
  max_gcd
end

p generalizedGCD(5,[2,4,6,8,10]) == 2
p generalizedGCD(5,[2,3,4,5,6]) == 1











<<-PSEUDOCODE
  gcd_counter = {}
  max_gcd = 1
  i = 2
  largest_num = nil
  until (i > largest_num) do
    arr.each do |num|
      num % i == 0
    end
  end

  max_gcd

PSEUDOCODE
