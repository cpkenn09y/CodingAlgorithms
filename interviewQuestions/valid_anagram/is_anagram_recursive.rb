# :: LeetCode Results ::
# Runtime: 100 ms, faster than 42.68% of Ruby online submissions for Valid Anagram.
# Memory Usage: 14.9 MB, less than 100.00% of Ruby online submissions for Valid Anagram.

# :: Complexity ::
# Time Complexity = O(n) b/c iterate over the string. Once for S, and once for T. We remove the coefficient while results in O(n)
# Space Complexity = O(n) b/c we create an instance of the helper function for each character in the string. We do this twice. Once for string s, and once for string t.

# NOTE: I believe that my answers regarding the complexity are correct...

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  def helper(full_string, letter_counter={}, index=0)
    if index > full_string.length - 1 # 0
      return letter_counter
    end
    if letter_counter.has_key?(full_string[index])
      letter_counter[full_string[index]] += 1
    else
      letter_counter[full_string[index]] = 1
    end
    index += 1
    return helper(full_string, letter_counter,index)
  end
  if s.length != t.length
    return false
  end
  return helper(s) == helper(t)
end

<<-PSEUDOCODE
  "anagram"
  * check to see if the number of characters match up
  s_letter_count = {
    a: 3,
    n: 1,
    g: 1,
    r: 1,
    m: 1
  }
  * determine of s_letter_count == t_letter_count
PSEUDOCODE

# s = "anagram"
# t = "nagaram"
# puts is_anagram(s,t) == true

# s = "rat"
# t = "car"
# puts is_anagram(s,t) == false

# s = "aa"
# t = "longstring"
# puts is_anagram(s,t) == false

# s = "a"
# t = "b"
# puts is_anagram(s,t) == false
