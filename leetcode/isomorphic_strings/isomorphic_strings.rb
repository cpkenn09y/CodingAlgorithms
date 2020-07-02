# Time Complexity: O(n) where n is the length of s
# Space Complexity: O(n) for the iso_map and the already_used_values Set.
require 'set'

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
  return false if s.length != t.length
  iso_map = {}
  already_used_values = Set.new
  i = 0
  while (i < s.length) do
    if iso_map[s[i]]
      # entry exists
      puts "entry exists #{s[i]}... trying #{t[i]}"
      if iso_map[s[i]] != t[i] # foo -> bar... making the second 'o' map to 'r'
        # attempting to map the value to a different value
        return false
      end
    else
      # no entry exists
      if already_used_values.include?(t[i])
        puts "RETURNING FALSE b/c '#{t[i]}' already existed in the used values"
        return false
      else
        puts "adding #{t[i]} to used values"
        iso_map[s[i]] = t[i]
        already_used_values.add(t[i])
      end
      puts "ISO_MAP #{iso_map}"
    end
    i += 1
  end
  return true
end

# s,t = "egg","add"
# p is_isomorphic(s,t) == true

# s,t = "foo","bar"
# p is_isomorphic(s,t) == false

# s,t = "paper","title"
# p is_isomorphic(s,t) == true

# s,t = "ab","aa"
# p is_isomorphic(s,t) == false
