<<-RESULTS
  100 / 101 test cases passed. Does not get past the last case due to timeout
RESULTS


# Steps:
# 1) Compute the frequency maps first
# 2) Iterate to match against the first freq map
# 3) Repeat with a subset...

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

def compute_freq_maps(strs)
  collection = []
  strs.each do |str|
    collection.push(compute_freq_map(str))
  end
  return collection
end

def find_matches(queue,freq_maps,results)
  orig_queue_size = queue.length
  freq_map_to_match = freq_maps[0]
  curr_anagrams = [queue.shift]
  new_queue_index = 0
  i = 1
  while (i < orig_queue_size) do
    curr_string = queue.shift
    if freq_map_to_match == freq_maps[i]
      curr_anagrams.push(curr_string)
    else
      freq_maps[new_queue_index] = freq_maps[i]
      new_queue_index += 1
      queue.push(curr_string)
    end
    i += 1
  end
  results.push(curr_anagrams)
end

# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  freq_maps = compute_freq_maps(strs)
  queue = strs
  results = []
  while queue.length > 0 do
    find_matches(queue,freq_maps,results)
  end
  return results
end

strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
result = group_anagrams(strs)
p result.length == 3
p result.include?(["eat","tea","ate"])
p result.include?(["tan","nat"])
p result.include?(["bat"])
