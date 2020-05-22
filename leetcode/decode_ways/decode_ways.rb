# @param {String} s
# @return {Integer}
def decode_ways(s)
  return 0 if s.length == 0
  counter = 0
  map_num_to_letter = {}
  ("A".."Z").each_with_index { |l,i| map_num_to_letter["#{i+1}"] = l }
  p0 = 0
  p1 = 1
  p2 = 1
  p3 = 1
  until
  if map_num_to_letter[s]
    counter += 1
  end
  counter
end

p decode_ways("1") == 1

# It could be decoded as "AB" (1 2) or "L" (12).
p decode_ways("12") == 2

# Input: "226"
# Output: 3
# Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
p decode_ways("226") == 3

"2"

p0 = 0
p1 = 1
p2 = 1
p3 = 1

