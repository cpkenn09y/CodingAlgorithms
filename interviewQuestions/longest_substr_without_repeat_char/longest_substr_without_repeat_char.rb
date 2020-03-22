# TIME_COMPLEXITY = O(n) where n is the length of the string
# SPACE_COMPLEXITY = O(1) b/c space is constant

# TIME SPENT = 26 mins

def longest_substr_without_repeat_char(string) # abrkaabcdefghijjxxx
  if string.length == 1
    return 1
  end
  max_length = 0
  current_length = 1
  i = 0
  j = 1
  while (j < string.length) do
    string[i] == string[j] ? current_length = 1 : current_length += 1
    max_length = current_length if current_length > max_length
    i += 1
    j += 1
  end
  max_length
end

p longest_substr_without_repeat_char("abrkaabcdefghijjxxx") == 10
p longest_substr_without_repeat_char("abrkaabcdefghijxghjxxx") == 15
p longest_substr_without_repeat_char("a") == 1
p longest_substr_without_repeat_char("ab") == 2

<<-WORKING_WITH_THE_DATA
  abrkaabcdefghijjxxx
  abrka
       abcdefghij
                 jx
                   x
                    x
  max_length = 0
  LOOP
    # pointer at a
    # substring = 'a'
    # substring = 'ab'
    # substring = 'abr'
    # substring = 'abrk'
    # substring = 'abrka'

    substring = 'ab'
    IF current_letter == string[i]
      START AS NEW...

      if substring.length > max_length
        max_length = substring.length
      end
      substring = string[i] # a
    ELSE
      substring += string[i] # abcdefghij
    END
  END
WORKING_WITH_THE_DATA
