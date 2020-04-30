# This is just a simple shared plaintext pad, with no execution capabilities.

# When you know what language you would like to use for your interview,
# simply choose it from the dropdown in the top bar.

# Enjoy your interview!


# Given a string, find longest substring with at most N unique characters. If multiple such substrings exist, you can return any one. Input given are: string itself and n the number of unique characters allowed.

# 1. given "abdcceefhijkl" and 3, the answer should be "dccee" or "cceef".
# 2. given "aabbbac" and 2, the answer should be "aabbba".
# 3. given "abb" and 3, the answer should be "abb"

# @param {String} string
# @param {Integer} n_unique_characters
def longest_sub_str_with_n_unique_characters(string, n_unique_characters)
  def add_letter_to_counter(letter_counter, string, pointer)
    if letter_counter.has_key?(string[pointer])
      letter_counter[string[pointer]] += 1
    else
      letter_counter[string[pointer]] = 1
    end
  end
  max_length = 0 #=> 3
  max_length_substring = ""
  p1 = 0
  p2 = 1 #=> 2
  letter_counter = {} #=> { "b" => 1, "d" => 1, "c" => 1 }
  letter_counter[string[p1]] = 1
  while (p2 < string.length) do # => "abd" #=> "bdc"
    add_letter_to_counter(letter_counter, string, p2)
    if letter_counter.length >= n_unique_characters # 3 > 3 # bdc
      # over the number of allowed unique characters... therefore, increment p1
      p2 += 1
      add_letter_to_counter(letter_counter, string, p2)
      until (letter_counter.length == 3) do
        # remove_letters_from_front
        if letter_counter[p1] == 1
          letter_counter.delete(letter_counter[p1])
        else
          letter_counter[p1] -= 1
        end
        p1 += 1
      end
    else
      # we are still within our allowed number of unique characters... therefore, increment p2
      p2 += 1
    end
    if p2 - p1 > max_length
      max_length = p2 - p1
      max_length_substring = string[p1..p2]
    end
  end
  max_length_substring
end

p longest_sub_str_with_n_unique_characters("abdcceefhijkl", 3) == 4

<<-SANDBOX
  max_length = 4
  current_number_of_unique_characters = 3
  p1 = 1
  p2 = 4
  abdcceefhijkl
  abdc
   bdcc
SANDBOX
