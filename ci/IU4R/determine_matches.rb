# Given: A target value of 8, determine how many unique pairs of numbers from a sum up to equal k.
def determine_matches(k,a)
  arr_with_no_duplicates = a.uniq
  matches_counter = 0
  i = 0
  j = 1
  # puts "arr_with_no_duplicates #{arr_with_no_duplicates}"
  while (j < arr_with_no_duplicates.length) do
    # puts "CHECKING: #{arr_with_no_duplicates[i]} + #{arr_with_no_duplicates[j]} == #{k}"
    if arr_with_no_duplicates[i] + arr_with_no_duplicates[j] == k
      # puts "FOUND MATCH: #{arr_with_no_duplicates[i]} + #{arr_with_no_duplicates[j]} == #{k}"
      matches_counter += 1
    end
    if j == arr_with_no_duplicates.length - 1
      i += 1
      j = i + 1
    else
      j += 1
    end
  end
  matches_counter
end

k = 8
a = [2,3,6,2,8]
p determine_matches(k,a) == 1


k = 8
a = [2,3,6,5,2,8]
p determine_matches(k,a) == 2
