<<-REFLECTIONS
  This brute force solution basically iterates over the string "leetcode", and gradually adds a character...
  once we reach "leet", then we match with the dictionary...
  since we matched with the dictionary... it uses the remaining substring to see if there are matches in the dictionary...
  NOTE: This is pretty inefficient...
REFLECTIONS

# BRUTE FORCE
require "set"
require "pry"

def word_break(s, word_dict)
  def helper(s,word_dict,start)
    puts "START #{start}"
    if start == s.length
      return true
    end
    end_point = start + 1
    while (end_point <= s.length) do
      if word_dict.include?(s.slice(start,end_point))
        puts "#{word_dict} includes #{s.slice(start,end_point)}"
        if helper(s,word_dict,end_point)
          return true
        end
      else
        puts "NO... #{word_dict} DOES NOT include #{s.slice(start,end_point)}"
      end
      end_point += 1
    end
    return false
  end
  return helper(s, Set.new(word_dict), 0)
end



s = "leetcode"
wordDict = ["leet", "code"]
p word_break(s,wordDict) == true

# s = "applepenapple"
# wordDict = ["apple", "pen"]
# p word_break(s,wordDict) == true

# s = "catsandog"
# wordDict = ["cats", "dog", "sand", "and", "cat"]
# p word_break(s,wordDict) == false

# s = "cars"
# wordDict = ["car","ca","rs"]
# p word_break(s,wordDict) == true
