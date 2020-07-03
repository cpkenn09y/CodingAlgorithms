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
      return false if iso_map[s[i]] != t[i]
    else
      return false if already_used_values.include?(t[i])
      iso_map[s[i]] = t[i]
      already_used_values.add(t[i])
    end
    i += 1
  end
  return true
end


s,t = "egg","add"
<<-COMMENT

  iso_map = { "e" => "a", "g" => "d"}
  already_used_values = { "a", "d" }

  egg, add
  e -> a
  g -> d

COMMENT

p is_isomorphic(s,t) == true

s,t = "foo","bar"
p is_isomorphic(s,t) == false

<<-COMMENT

  iso_map = { "f" => "b", "o" => "a" }
  already_used_values = { "b", "a" }

  foo, bar
  f -> b
  o -> a
  o -> r

  FAILS because already used 'o' as a key in the iso_map

COMMENT

s,t = "paper","title"
p is_isomorphic(s,t) == true

s,t = "ab","aa"
p is_isomorphic(s,t) == false
