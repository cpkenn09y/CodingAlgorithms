def insert_value(value,array,index)
  overwritten = value
  target_length = array.length + 1
  while index < target_length do
    tmp = array[index]
    array[index] = overwritten
    overwritten = tmp
    index += 1
  end
  array
end

def maxArithmeticLength(a, b)
  # TODO: Solve for the case when a1 should be taken from b... eg. 0,2,4
  arithmetic_progression_value = a[1] - a[0]
  i = 1
  original_length = a.length
  while (i <= a.length) do # [0, 4, 8, 12, 16, 20]
    expected_value = a[i-1] + arithmetic_progression_value
    if a[i] == expected_value
      puts "NEXT... #{a[i]} and #{a[i-1]} approved"
    else
      if b.delete(expected_value)
        puts "deleted #{expected_value}"
        insert_value(expected_value,a,i)
        puts "INSERTED #{expected_value} into #{a}"
      else
        puts "unable to find #{expected_value}"
        if a[i] == nil
          return a.length
        else
          return -1
        end
      end
    end
    i += 1
  end
  return a.length
end

# a = [0, 4, 8, 16]
# b = [0, 2, 6, 12, 14, 20]
# p maxArithmeticLength(a, b) == 6

# NAIVE SOLUTION... if we needed to take 0 and 2 from b... my algorithm would not work...

# a = [5, 7, 13, 14]
# b = [9, 11, 15]
# p maxArithmeticLength(a, b) == -1


a = [0, 4, 6, 8, 16]
b = [2, 6, 10, 12, 14]
p maxArithmeticLength(a, b) == 9
