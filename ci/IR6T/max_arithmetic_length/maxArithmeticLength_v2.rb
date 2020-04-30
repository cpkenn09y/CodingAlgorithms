require 'pry'

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

def add_the_rest_of_a_to_stack!(stack,a,i)
  while i < a.length do
    stack << a[i]
    i += 1
  end
end

def get_arithmetic_progression_max_length(stack,b)
  arithmetic_progression_value = stack[1] - stack[0]
  x = 2
  while (x <= stack.length) do # [0, 2, 4, 8, 16]
    expected_value = stack[x-1] + arithmetic_progression_value
    if stack[x] == expected_value
      puts "NEXT... #{stack[x]} and #{stack[x-1]} approved"
    else
      if b.delete(expected_value)
        puts "deleted #{expected_value}"
        insert_value(expected_value,stack,x)
        puts "INSERTED #{expected_value} into #{stack}"
      else
        puts "unable to find #{expected_value}"
        if stack[x] == nil
          return stack.length
        else
          return -1
        end
      end
    end
    x += 1
  end
  return a.length
end

def try_with(a,b,i,j)
  stack = []
  # populate stack with the smallest...
  while (stack.length < 2) do
    # 0 .vs. 2
    # 2 .vs. 4
    if a[i] == b[j]
      # since equivalent, only put one in
      stack << a[i]
      j += 1
      i += 1
    elsif a[i] < b[j]
      # a is less than b
      stack << a[i]
      i += 1
    else
      # b is less than a
      stack << b[j]
      j += 1
    end
  end
  add_the_rest_of_a_to_stack!(stack,a,i)
  get_arithmetic_progression_max_length(stack,b)
end

def maxArithmeticLength(a, b)
  possible_solutions = []
  possible_solutions << get_arithmetic_progression_max_length(a,b)
  j = 0
  while j < b.length do
    puts ":: ATTEMPTING #{a[0]} .vs. #{b[j]} ::"
    possible_solutions << try_with(a,b,0,j)# if b[j] < a[1]
    j += 1
  end
  p possible_solutions
  possible_solutions.max
end


a = [0, 4, 8, 16]
b = [0, 2, 6, 12, 14, 20]
p maxArithmeticLength(a, b) == 6

a = [5, 7, 13, 14]
b = [9, 11, 15]
p maxArithmeticLength(a, b) == -1

a = [0, 4, 6, 8, 16]
b = [2, 6, 10, 12, 14]
p maxArithmeticLength(a, b) == 9

# a = [15,20]
# b = [5,10]
# p maxArithmeticLength(a, b) == 4
