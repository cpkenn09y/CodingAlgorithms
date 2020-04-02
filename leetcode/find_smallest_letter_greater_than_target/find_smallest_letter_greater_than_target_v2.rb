# BASED ON SOLUTION APPROACH #1: "Record Letters Seen"

# @param {Character[]} letters
# @param {Character} target
# @return {Character}
def next_greatest_letter(letters, target)
  Set.new(letters)
  (1..26).each do |int|
    something = target.ord - 'a'.ord + i) % 26 + 'a'.ord
    p something
    cand = (something).chr
    p cand
  end
end


p next_greatest_letter(["c", "f", "j"], "a") == "c"
# p next_greatest_letter(["c", "f", "j"], "c") == "f"
# p next_greatest_letter(["c", "f", "j"], "d") == "f"
# p next_greatest_letter(["c", "f", "j"], "g") == "j"
# p next_greatest_letter(["c", "f", "j"], "j") == "c"
# p next_greatest_letter(["c", "f", "j"], "k") == "c"
