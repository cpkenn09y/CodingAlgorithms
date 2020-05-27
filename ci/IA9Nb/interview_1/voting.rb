def add_to_pts_counter(pts_counter, vote, num)
  if pts_counter[vote]
    pts_counter[vote] += num
  else
    pts_counter[vote] = num
  end
  return pts_counter[vote]
end

def determine_winner_weighted(votes)
  pts_counter = {}
  max_count = 0
  winners = []

  votes.each_with_index do |row, i|
    if row.length <= 3
      row.each_with_index do |vote,index|
        case index
        when 0
          num_of_votes = add_to_pts_counter(pts_counter, vote, 3)
        when 1
          num_of_votes = add_to_pts_counter(pts_counter, vote, 2)
        when 2
          num_of_votes = add_to_pts_counter(pts_counter, vote, 1)
        end
        if num_of_votes > max_count
          max_count = num_of_votes
          winners.clear
          winners << vote
          puts "Max count set to #{max_count} based on #{vote}"
          # p winners
        elsif num_of_votes == max_count
          winners << vote
          # p winners
        end
      end
    else
      raise "Invalid number of entries for index #{i}, #{row}"
    end
  end
  return winners.sort
end

votes = [
  ["A","B","C"],
  ["B"]
]
p determine_winner_weighted(votes) == ["B"]





# puts result == ["C","D"]

# [_] TODO: User should not be able to vote more than 3x
# [_] TODO: Users cannot vote for the same candidate more than once


def determine_winner(votes)
  counter = {}
  max_count = 0
  winners = []
  votes.each do |vote|
    if counter[vote]
      counter[vote] += 1
    else
      counter[vote] = 1
    end
    puts "Set #{vote} to #{counter[vote]}"
    if counter[vote] > max_count
      max_count = counter[vote]
      winners.clear
      winners << vote
      puts "Max count set to #{max_count} based on #{vote}"
      p winners
    elsif counter[vote] == max_count
      winners << vote
      p winners
    end
  end
  return winners.sort
end

puts determine_winner(["A", "B", "C", "B", "C", "D", "C", "D"]) == "C"

result =  determine_winner(["A", "B", "C", "B", "C", "D", "C", "D", "D"])

puts result.length == 2
puts result.include?("C")
puts result.include?("D")
