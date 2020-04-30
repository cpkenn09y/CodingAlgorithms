## Solved bruteforce
def sum_of_all_3s_and_5s_below(target_number)
  sum = 0
  (0...target_number).to_a.each do |num|
    sum += num if (num % 3 == 0 || num % 5 == 0)
  end
  sum
end

puts sum_of_all_3s_and_5s_below(10) == 23
puts sum_of_all_3s_and_5s_below(1000) == 233168
