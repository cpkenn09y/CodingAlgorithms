def binary_search(num, array)
  mid_index = array.length/2
  return mid_index if (num == array[mid_index]) # mid check
  return 0 if (num == array[0]) # lowest check
  return array.length-1 if (num == array[-1]) # highest check

  low_index = 0
  high_index = array.length
  answer = -1

  until answer != -1

    break if (high_index - low_index == 1)

    if num < array[mid_index]
      high_index = mid_index
      mid_index = get_mid(high_index, low_index)
      return answer = mid_index if are_equal?(num, array[mid_index])
    end

    if num > array[mid_index]
      low_index = mid_index
      mid_index = get_mid(low_index, high_index)
      return answer = mid_index if are_equal?(num, array[mid_index])
    end
  end

  answer
end

def are_equal?(x,y)
  x == y
end

def get_mid(upper, lower)
  (upper + lower) / 2
end

# TDD/DRIVER CODE:

arr = [2,5,7]

p binary_search(3, [3]) == 0
p binary_search(5, arr) == 1
p binary_search(2, arr) == 0
p binary_search(7, arr) == 2

arr = [11, 20, 26, 30, 44]

p binary_search(26, arr) == 2
p binary_search(11, arr) == 0
p binary_search(44, arr) == 4
p binary_search(20, arr) == 1
p binary_search(30, arr) == 3

arr = [2, 5, 7, 11, 15, 16, 18, 20, 21]
p binary_search(7, arr) == 2
p binary_search(18, arr) == 6
p binary_search(20, arr) == 7

test_array = (100..200).to_a
p binary_search(135, test_array) == 35

test_array = [13, 19, 24, 29, 32, 37, 43]
p binary_search(35, test_array) == -1