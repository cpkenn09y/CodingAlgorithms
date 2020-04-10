<<-REFLECTIONS
  Eh... I kinda get where they are going with this solution... I was not quite able to translate their code
  But anyway, I kinda get where they were going with this
REFLECTIONS

# MEMOIZATION
require "set"
require "pry"

def word_break(s, word_dict)
  def helper(s,word_dict,start,memo=[])
    puts "START #{start}"
    if start == s.length
      return true
    end
    if (memo[start] != nil)
      return memo[start];
    end
    end_point = start + 1
    while (end_point <= s.length) do
      if word_dict.include?(s.slice(start,end_point))
        puts "#{word_dict} includes #{s.slice(start,end_point)}"
        if helper(s,word_dict,end_point)
          memo[start] = true
          # return true
        end
      else
        puts "NO... #{word_dict} DOES NOT include #{s.slice(start,end_point)}"
      end
      end_point += 1
    end
    return memo[start] = false;
  end
  return helper(s, Set.new(word_dict), 0, Array.new(s.length, nil))
end



s = "leetcode"
wordDict = ["leet", "code"]
p word_break(s,wordDict)# == true

# s = "applepenapple"
# wordDict = ["apple", "pen"]
# p word_break(s,wordDict) == true

# s = "catsandog"
# wordDict = ["cats", "dog", "sand", "and", "cat"]
# p word_break(s,wordDict) == false

# s = "cars"
# wordDict = ["car","ca","rs"]
# p word_break(s,wordDict) == true
