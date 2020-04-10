require 'pry'
# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
def word_break(s,word_dict)

  def attempt_string_reduction(current_str,current_match)
    i = 0
    while (i < current_match.length) do
      if current_str[i] == current_match[i]
      else
        return current_str
      end
      i += 1
    end
    return current_str.slice(current_match.length,current_str.length-current_match.length)
  end

  def helper(current_string, masterlist) # "cars"
    if current_string.length == 0
      # puts "SUCCESSFULLY REDUCED!"
      return true
    end
    if masterlist[current_string]
      # {
      #   "car" => true,
      #   "ca" => true,
      #   "rs" => true
      # }
      return true
    end
    masterlist.each do |word, value| #
      # puts "ITERATION with #{word}"
      if current_string[0] == word[0] # "cars" .vs. "car"
        # puts "MATCHED #{current_string} and #{word}"
        result = attempt_string_reduction(current_string,word)
        # puts "string reduced from #{current_string} to #{result}"
        if result.length == current_string.length # was not a match
          # puts "NOT A MATCH..."
          next
        end
        return true if helper(result, masterlist) # "s"
      end
    end
    return false
  end
  masterlist = {}
  word_dict.each do |word|
    masterlist[word] = true
  end
  helper(s,masterlist)
end

# s = "leetcode"
# wordDict = ["leet", "code"]
# p word_break(s,wordDict) == true

# s = "applepenapple"
# wordDict = ["apple", "pen"]
# p word_break(s,wordDict) == true

# s = "catsandog"
# wordDict = ["cats", "dog", "sand", "and", "cat"]
# p word_break(s,wordDict) == false

# s = "cars"
# wordDict = ["car","ca","rs"]
# p word_break(s,wordDict) == true


"aaaaaaaaaaaaaaaaab"

"a"
