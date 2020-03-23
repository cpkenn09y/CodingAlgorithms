# https://leetcode.com/explore/interview/card/amazon/76/array-and-strings/481/
<<-METRICS
METRICS

require 'pry'

# @param {Integer} num
# @return {String}
def number_to_words(num)
  map_to_words = {
    1000000000 => "Billion",
    1000000 => "Million",
    1000 => "Thousand",
    100 => "Hundred",
    90 => "Ninety",
    80 => "Eighty",
    70 => "Seventy",
    60 => "Sixty",
    50 => "Fifty",
    40 => "Forty",
    30 => "Thirty",
    20 => "Twenty",
    19 => "Nineteen",
    18 => "Eighteen",
    17 => "Seventeen",
    16 => "Sixteen",
    15 => "Fifteen",
    14 => "Fourteen",
    13 => "Thirteen",
    12 => "Twelve",
    11 => "Eleven",
    10 => "Ten",
    9 => "Nine",
    8 => "Eight",
    7 => "Seven",
    6 => "Six",
    5 => "Five",
    4 => "Four",
    3 => "Three",
    2 => "Two",
    1 => "One"
  }
  if num == 0
    return "Zero"
  end
  words = [] # ["One", "Million"]
  leftover = num
  map_to_words.each do |current_num, word|
    frequency = leftover / current_num
    if frequency > 0 # freq = 12
      # if frequency.to_s.length > 1
      if frequency > 20
        recursive_value = number_to_words(frequency)
        words << recursive_value
      else
        if current_num >= 100 # 1000
          words << map_to_words[frequency]
        end
      end
      words << map_to_words[current_num]
      leftover = leftover % current_num
    end
  end
  return words.join(" ")
end

<<-WORKING_WITH_THE_DATA
  123/100 == 1
  123%100 == 23
WORKING_WITH_THE_DATA

# p number_to_words(123) == "One Hundred Twenty Three"
# p number_to_words(12345) == "Twelve Thousand Three Hundred Forty Five"
# p number_to_words(25942) == "Twenty Five Thousand Nine Hundred Forty Two"
# p number_to_words(1234567) == "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
# p number_to_words(1234567891) == "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"
