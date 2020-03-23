# TIME_COMPLEXITY = O(n^2) where n is relative to the length of the string
# SPACE_COMPLEXITY = O(n) because we letter_counter could grow in size relative to string's length

# @param {String} string
def length_of_longest_substring(string)
  if string.length == 1
    return 1
  end
  max_length = 0
  p1 = 0
  p2 = 1
  current_length = 1
  letter_counter = {}
  letter_counter[string[p1]] = 1
  while (p2 < string.length) do
    if letter_counter.has_key?(string[p2])
      p1 += 1
      p2 = p1 + 1
      letter_counter = {}
      letter_counter[string[p1]] = 1
      # puts "COLLISION has letter #{string[p2]}"
    else
      # puts "new letter #{string[p2]}"
      letter_counter[string[p2]] = 1
      p2 += 1
    end
    current_length = p2 - p1
    max_length = current_length if current_length > max_length
    # puts "current_length #{current_length}. Max length #{max_length}"
  end
  max_length
end

<<-SAMPLE_TESTS
SAMPLE_TESTS
# p length_of_longest_substring("aab") == 2
# p length_of_longest_substring("abcabcbb") == 3
# p length_of_longest_substring("bbbbb") == 1
# p length_of_longest_substring("pwwkew") == 3
# p length_of_longest_substring("dvdf") == 3



<<-WORKING_WITH_THE_DATA
  dvdf
  p0 = 0
  p1 = 1
  {
    d: 1
  }
  p1 += 1 #=> 2

  {
    d: 1
  }

WORKING_WITH_THE_DATA
