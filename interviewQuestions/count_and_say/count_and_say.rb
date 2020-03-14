<<-SAMPLE
  1
  11   # 1->11
  21   # 11->21
  1211 # 1->11,12,21
  112121
  {FREQUENCY}{VALUE}
SAMPLE


def decode(number)
  if number == 1
    return 11
  end
  stringified_number = number.to_s
  consecutive_count = 1
  last_evaluated_number = stringified_number[0]
  result = ""
  i = 1
  while (i < stringified_number.length) do
    if last_evaluated_number == stringified_number[i]
      # puts "DECODING --> MATCH FOUND... #{last_evaluated_number} == #{stringified_number[i]}"
      consecutive_count += 1
    else
      # puts "DECODING --> MISMATCH... #{last_evaluated_number} != #{stringified_number[i]}"
      result += "#{consecutive_count}#{last_evaluated_number}"
      consecutive_count = 1
      last_evaluated_number = stringified_number[i]
    end
    if i == stringified_number.length-1 #
      # puts "DECODING --> FINAL STEP... Concatenating #{consecutive_count}#{last_evaluated_number}"
      result += "#{consecutive_count}#{last_evaluated_number}"
    end
    i += 1
  end
  # puts "FINAL RESULT '#{result}'"
  return result.to_i
end

def count_and_say(n)
  if (n == 1)
    return 1
  end
  decode(count_and_say(n-1))
end


p count_and_say(1) == 1
p count_and_say(2) == 11
p count_and_say(3) == 21
p count_and_say(4) == 1211
p count_and_say(5) == 111221
p count_and_say(6) == 312211
p count_and_say(7) == 13112221
p count_and_say(8) == 1113213211
p count_and_say(9) == 31131211131221
p count_and_say(10) == 13211311123113112211

