<<-NOTES
  Strategy: Sort at each row

  Time: O(n + n(mlogm)) where m is the length of the largest string in strs. mlogm for the corresponding sort on 'm' sort.
  Space: O(n) for the results hash
NOTES

# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  results = {}
  strs.each do |str|
    sorted_str = str.chars.sort.join
    if results[sorted_str]
      results[sorted_str].push(str)
    else
      results[sorted_str] = [str]
    end
  end
  return results.values
end

strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
result = group_anagrams(strs)
p result.length == 3
p result.include?(["eat","tea","ate"])
p result.include?(["tan","nat"])
p result.include?(["bat"])
