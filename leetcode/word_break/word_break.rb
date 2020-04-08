require 'pry'
# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
def word_break(s,word_dict)
  def is_equal?(a,b,i)
    puts "Comparing #{a} to #{b}... index #{i}"
    a[i] == b[i]
  end

  def find_words_that_match(s,word_dict,index)
    matches = []
    word_dict.each do |word|
      if s[index] == word[index]
        matches << word
      end
    end

    return matches
  end
  i = 0
  matches = word_dict.dup
  while i < s.length do
    if matches
      find_words_that_match(s,matches,i) # ["leet"]
      # if matches.empty?
      #   matches = find_words_that_match(s,word_dict,i)
      # end
    else
      matches = word_dict
    end
    i += 1
  end
  return true
end

s = "leetcode"
wordDict = ["leet", "code"]
p word_break(s,wordDict) == true

# s = "applepenapple"
# wordDict = ["apple", "pen"]
# p word_break(s,wordDict) == true

# s = "catsandog"
# wordDict = ["cats", "dog", "sand", "and", "cat"]
# word_break(s,wordDict) == false
