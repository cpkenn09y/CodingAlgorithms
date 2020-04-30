# This is just a simple shared plaintext pad, with no execution capabilities.

# When you know what language you would like to use for your interview,
# simply choose it from the dropdown in the top bar.

# Enjoy your interview!


# Given a string, find longest substring with at most N unique characters. If multiple such substrings exist, you can return any one. Input given are: string itself and n the number of unique characters allowed.

# 1. given "abdcceefhijkl" and 3, the answer should be "dccee" or "cceef".
# 2. given "aabbbac" and 2, the answer should be "aabbba".
# 3. given "abb" and 3, the answer should be "abb"

require 'pry'

# @param {String} string
# @param {Integer} n_unique_characters
def longest_sub_str_with_n_unique_characters(string, n_unique_characters)
  def add_letter_to_counter(letter_counter, letter)
    if letter_counter.has_key?(letter)
      letter_counter[letter] += 1
    else
      letter_counter[letter] = 1
    end
  end
  max_length = 0
  max_length_substring = ""
  p1 = 0
  p2 = 1
  letter_counter = {}
  letter_counter[string[p1]] = 1
  # puts "INITIAL state #{letter_counter}"
  while (p2 < string.length) do
    add_letter_to_counter(letter_counter, string[p2])
    # puts "ADDING letter #{string[p2]} to counter '#{letter_counter}'"
    if letter_counter.length > n_unique_characters # 3 > 3 # bdc
      # puts "OVER the allowed unique characters... #{letter_counter}."
      until (letter_counter.length <= n_unique_characters) do # 3 <= 2
        # puts "BEFORE: #{letter_counter}. REMOVING '#{string[p1]}'"
        if letter_counter[string[p1]] == 1
          letter_counter.delete(string[p1])
        else
          letter_counter[string[p1]] -= 1
        end
        p1 += 1
      end
    end
    if p2 - p1 > max_length - 1
      max_length = (p2 - p1) + 1
      max_length_substring = string[p1..p2]
      # puts "MAX LENGTH = #{max_length} for #{max_length_substring}"
    end
    p2 += 1
  end
  max_length_substring
end

p longest_sub_str_with_n_unique_characters("abdcceefhijkl", 3) == "dccee"
p longest_sub_str_with_n_unique_characters("aabbbac", 2) == "aabbba"
p longest_sub_str_with_n_unique_characters("abb", 3) == "abb"

<<-SANDBOX
  max_length = 4
  current_number_of_unique_characters = 3
  p1 = 1
  p2 = 4
  abdcceefhijkl
  abdc
   bdcc
SANDBOX
