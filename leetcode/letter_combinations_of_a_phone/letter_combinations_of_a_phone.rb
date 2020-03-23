# Solved for when there are two letters in 30 mins

NUMBERS_TO_KEYS = {
  "2" => "abc",
  "3" => "def",
  "4" => "ghi",
  "5" => "jkl",
  "6" => "mno",
  "7" => "pqrs",
  "8" => "tuv",
  "9" => "wxyz"
}

# SOLUTION FOR WHEN THERE ARE ONLY TWO NUMBERS...
def letter_combinations_of_a_phone_number(str_of_numbers)
  i = 0
  letter_combinations = []
  letters_1 = NUMBERS_TO_KEYS[str_of_numbers[i]] # "abc"
  letters_2 = NUMBERS_TO_KEYS[str_of_numbers[i+1]] # "def"
  while (i < letters_1.length) do # 0<3
    j = 0
    while (j < letters_2.length) do
      letter_combinations << "#{letters_1[i]}#{letters_2[j]}" # "ad", "ae", "af"
      puts "Adding '#{letters_1[i]}#{letters_2[j]}'. NOTE: i = #{i}, j = #{j}"
      j += 1
    end
    i += 1
  end
  letter_combinations
end

<<-WORKING_WITH_THE_DATA
  "23"
  2 --> "abc"
  3 --> "def"
  9 --> "def"
  "abc" EACH CHAR |letter|
    [letter]
  end
  [ad],
WORKING_WITH_THE_DATA


def letter_combinations_of_a_phone_number(str_of_numbers)
  def helper(collection_of_letters)
    # # "abc"
    # # "def"
    # # "ghi"
    combinations = []
    letters_1 = collection_of_letters[0]
    letters_2 = collection_of_letters[1]
    letters_3 = collection_of_letters[2]
    i = 0
    while (i < collection_of_letters.length) do
      j = 0
      while (j < 3) do
        k = 0
        while (k < 3) do
          combinations << letters_1[i] + letters_2[j] + letters_3[k]
          k += 1
        end
        j += 1
      end
      i += 1
    end
    combinations
  end

  collection_of_letters = [] # ["abc", "def"]
  str_of_numbers.each_char do |str_number|
    collection_of_letters << NUMBERS_TO_KEYS[str_number]
  end
  helper(collection_of_letters)
end



# p letter_combinations_of_a_phone_number("23")
p letter_combinations_of_a_phone_number("234")
# p letter_combinations_of_a_phone_number("239")
