# This attempt was trying to do save some computations by doing some of the matching while also computing the frequency maps

def compute_freq_map(str)
  # OPTIMIZATION IDEA: Make this function also be able to determine if the curr_freq_map matches the last_freq_map
  freq_map = {}
  str.each_char do |char|
    if freq_map[char]
      freq_map[char] += 1
    else
      freq_map[char] = 1
    end
  end
  return freq_map
end
# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  curr_freq_map = nil
  last_freq_map = nil
  total_results = []
  current_collection = [] #=> ["eat"]
  strs.each_with_index do |str,i|
    if i == 0
      last_freq_map = compute_freq_map(str) #=> { e: 1, a: 1, t: 1}
      current_collection.push(str)
    else
      curr_freq_map = compute_freq_map(str) #=> { t: 1, e: 1, a: 1}
      if curr_freq_map == last_freq_map
        current_collection.push(curr_freq_map)
      end
    end
  end
end


strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
result = group_anagrams(strs)
p result.length == 3
p result.include?(["eat","tea","ate"])
p result.include?(["tan","nat"])
p result.include?(["bat"])
