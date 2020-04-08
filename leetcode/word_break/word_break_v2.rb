require 'pry'
# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
def word_break(s,word_dict)

  def find_words_that_match(s,word_dict,index)
    matches = []
    word_dict.each do |word|
      if s[index] == word[index]
        matches << word
      end
    end
    return matches
  end

  def attempt_string_reduction(original_str,current_match)
    i = 0
    while (i < current_match.length) do
      if original_str[i] == current_match[i]
      else
        return original_str
      end
      i += 1
    end
    return original_str.slice(current_match.length,original_str.length-current_match.length)
  end

  def helper(current_string, word_dict)
    if current_string.length == 0
      puts "SUCCESSFULLY REDUCED!"
      return true
    end
    matches = find_words_that_match(current_string,word_dict,0)
    if !matches.empty?
      result = attempt_string_reduction(current_string,matches[0])
      puts "string reduced from #{current_string} to #{result}"
      if result.length == current_string.length # was not a match
        puts "NOT A MATCH..."
        return false
      end
      helper(result, word_dict)
    else
      return false
    end
  end
  helper(s,word_dict)
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

s = "cars"
wordDict = ["car","ca","rs"]
p word_break(s,wordDict) == true
