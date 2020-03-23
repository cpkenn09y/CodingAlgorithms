# LeetCode results:
# Runtime: 84 ms, faster than 63.41% of Ruby online submissions for Valid Anagram.
# Memory Usage: 9.9 MB, less than 100.00% of Ruby online submissions for Valid Anagram.

# :: Complexity ::
# Time Complexity = O(n) b/c the while loop's number of iterations directly parallels the length of the string
# Space Complexity = O(n) b/c as the length of the string increases, the hash sizes also increase

# NOTE: Not sure about my answer to the Space Complexity... the two hashes do get larger based on the size of the string...
#        however, it does not get large as quickly as the recursive solution

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  def add_to_collection_count(hash, letter)
    if hash.has_key?(letter)
      hash[letter] += 1
    else
      hash[letter] = 1
    end
    return hash
  end

  if s.length != t.length
    return false
  end
  s_letter_count = {}
  t_letter_count = {}
  i = 0
  while (i < s.length) do
    s_letter_count = add_to_collection_count(s_letter_count, s[i])
    t_letter_count = add_to_collection_count(t_letter_count, t[i])
    i += 1
  end
  s_letter_count == t_letter_count
end

s = "anagram"
t = "nagaram"
puts is_anagram(s,t) == true

s = "rat"
t = "car"
puts is_anagram(s,t) == false
<<-WORKING_WITH_THE_DATA
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
WORKING_WITH_THE_DATA
