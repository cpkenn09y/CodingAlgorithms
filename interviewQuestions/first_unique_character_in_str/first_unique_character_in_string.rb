# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  character_counter = {}
  for i in 0..s.length-1
    char = s[i]
    if character_counter.has_key?(char)
      character_counter[char] += 1
    else
      character_counter[char] = 1
    end
  end
  character_counter.each do |k,v|
    if v == 1
      return s.index(k)
    end
  end
  return -1
end

# PSEUDOCODE:
# {
#   l: 1,
#   e: 3,
#   t: 1
#   c: 1,
#   o: 1,
#   d: 1,
# }
# * does l have 1...?
# puts first_uniq_char("leetcode") == 0
# puts first_uniq_char("loveleetcode") == 2
