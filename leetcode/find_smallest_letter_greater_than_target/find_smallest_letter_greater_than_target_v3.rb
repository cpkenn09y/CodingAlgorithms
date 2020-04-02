<<-LEARNED_LESSONS
  * re-read the specifications... b/c I initially missed the part stating that wrapping around is part of it
  * to simulate wrapping around the array, I had to add 26 representing the number of letters in the alphabet
  * make a decision as to whether to use the current_distance or the wrap_around_distance
  * set to INFINITY...
LEARNED_LESSONS

<<-METRICS
  Time Complexity  = O(n)
  Space Complexity = O(1), constant space
  Time Taken: ~45 mins
METRICS

# @param {Character[]} letters
# @param {Character} target
# @return {Character}
def next_greatest_letter(letters, target)
  closest_distance = Float::INFINITY # Float::INFINITY
  closest_distance_letter = nil
  letters.each do |letter| # j
    current_distance = letter.ord - target.ord
    wrap_around_distance = letter.ord + 26 - target.ord
    distance_to_use = [current_distance,wrap_around_distance].min
    next if current_distance == 0
    if current_distance > 0 && distance_to_use < closest_distance
      closest_distance = distance_to_use
      closest_distance_letter = letter
    end
    # if closest_distance.nil?
    #   if current_distance > 0 && current_distance < wrap_around_distance # -1 < 25
    #     closest_distance = current_distance
    #     closest_distance_letter = letter
    #   else
    #     closest_distance = wrap_around_distance
    #     closest_distance_letter = letter
    #   end
    # else
    #   if current_distance > 0 && current_distance < closest_distance
    #     closest_distance = current_distance
    #     closest_distance_letter = letter
    #   elsif wrap_around_distance < closest_distance
    #     closest_distance = wrap_around_distance
    #     closest_distance_letter = letter
    #   end
    # end
  end
  closest_distance_letter
end


<<-PLAN
PLAN
p next_greatest_letter(["c", "f", "j"], "a") == "c"
p next_greatest_letter(["c", "f", "j"], "c") == "f"
p next_greatest_letter(["c", "f", "j"], "d") == "f"
p next_greatest_letter(["c", "f", "j"], "g") == "j"
p next_greatest_letter(["c", "f", "j"], "j") == "c"
p next_greatest_letter(["c", "f", "j"], "k") == "c"
