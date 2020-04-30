def count_freq(word)
  split_name = word.split('')
  letter_frequency = {}
  split_name.each do |letter|
    if letter_frequency.key? letter
      letter_frequency[letter] += 1
    else
      letter_frequency[letter] = 1
    end
  end
  letter_frequency
end

# count_freq("kenny") => { 'k': 1, 'e': 1, 'n': 2, 'y': 1}