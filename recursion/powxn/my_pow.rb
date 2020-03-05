def num_of_desired_decimal_places(num)
  if num % 1 == 0
    return nil
  else
    num.to_s.split(".")[1].length
  end
end

# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow(x, n)
  result = 1
  puts "x,n -> #{x},#{n}"
  if (n < 0) # true
    multiplier = 1.0 / x # 1/2
    puts "multiplier #{multiplier}"
  else
    multiplier = x
  end
  n.abs.times do |i|
    result = result * multiplier
    # puts "result #{result}"
  end
  decimal_places = num_of_desired_decimal_places(x)
  if decimal_places
    result.round(decimal_places)
  else
    result
  end
end


puts my_pow(2.00000, 10) == 1024.00000
puts my_pow(2.10002, 3) == 9.26126
puts my_pow(2, -2) == 0.25
