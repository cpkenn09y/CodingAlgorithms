<<-SAMPLE
  1
  11   # 1->11
  21   # 11->21
  1211 # 1->11,12,21
  112121
  {FREQUENCY}{VALUE}
SAMPLE

# TIME COMPLEXITY: O(N)
# SPACE COMPLEXITY: O(N) where N is equal to the length of the string
# NOTE: Could have done memoization...

def decode(number)
  if number == "1"
    return "11"
  end
  stringified_number = number.to_s
  consecutive_count = 1
  last_evaluated_number = stringified_number[0]
  result = ""
  i = 1
  while (i < stringified_number.length) do
    if last_evaluated_number == stringified_number[i]
      consecutive_count += 1
    else
      result += "#{consecutive_count}#{last_evaluated_number}"
      consecutive_count = 1
      last_evaluated_number = stringified_number[i]
    end
    if i == stringified_number.length-1
      result += "#{consecutive_count}#{last_evaluated_number}"
    end
    i += 1
  end
  return result
end

def count_and_say(n)
  if (n == 1)
    return "1"
  end
  decode(count_and_say(n-1))
end


p count_and_say(1) == "1"
p count_and_say(2) == "11"
p count_and_say(3) == "21"
p count_and_say(4) == "1211"
p count_and_say(5) == "111221"
p count_and_say(6) == "312211"
p count_and_say(7) == "13112221"
p count_and_say(8) == "1113213211"
p count_and_say(9) == "31131211131221"
p count_and_say(10) == "13211311123113112211"

