# @param {Integer} d
# @param {Integer} f
# @param {Integer} target
# @return {Integer}
def num_rolls_to_target(d, f, target)
  counter = 0
  if d == 1
    f.times do |i|
      counter += 1 if (i + 1 == target)
    end
  else
    # puts "inside else"
    i = 1
    j = 1
    while (i <= f) do
      # puts "i == #{i}"
      while (j <= f) do
        # puts "j == #{j}"
        if (i + j == target)
          # puts "MATCH: #{i} + #{j} == #{target}"
          counter += 1
        end
        j += 1
      end
      j = 1
      i += 1
    end
  end
  counter
end

# p num_rolls_to_target(1,6,3) == 1
# p num_rolls_to_target(2,6,7) == 6
# p num_rolls_to_target(2,5,10) == 1
# p num_rolls_to_target(1,2,3) == 0
p num_rolls_to_target(30,30,500) == 222616187
