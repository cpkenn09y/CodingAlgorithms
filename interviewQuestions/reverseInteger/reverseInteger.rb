# @param {Integer} x
# @return {Integer}
def reverse(x)
  is_negative = x < 0
  multiplier = 1
  if is_negative
    multiplier = -1
  end
  result = x.abs.to_s.reverse.to_i * multiplier
  if result.abs > 2 ** 31
    return 0
  else
    return result
  end
end

puts reverse(123) == 321
puts reverse(-123) == -321
puts reverse(120) == 21
