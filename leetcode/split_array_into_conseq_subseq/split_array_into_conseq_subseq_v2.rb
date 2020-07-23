require 'pry'

# @param {Integer[]} nums
# @return {Boolean}
def is_possible(nums)
  frequency_map = {}
  hypothetical_map = {}
  nums.each do |n|
    if frequency_map[n]
      frequency_map[n] += 1
    else
      frequency_map[n] = 1
    end
  end
  main_sequence = nil
  nums.each_with_index do |n,i|
    # NOTE: Will never go below zero because we constructed the frequency map

    if i == 0
      main_sequence = n
      frequency_map[n] -= 1
      next;
    end

    if n == main_sequence + 1
      # Connect with the main sequence
      main_sequence = n
      frequency_map[n] -= 1
    else
      # Create/connect w/ a different sequence
      if hypothetical_map[n] && hypothetical_map[n] > 0
        # Decrement from hypothetical map
        hypothetical_map[n] -= 1
      end
      if hypothetical_map[n+1]
        # Increment to mean there is another option that we can connect with
        hypothetical_map[n+1] += 1
      else
        # Create a new hypothetical map value
        hypothetical_map[n+1] = 1
      end
      frequency_map[n] -= 1
    end
    puts ":: DEALING WITH #{n} ::"
    p frequency_map
    p hypothetical_map
  end
  return true
end

module TestSuite

  # Explanation:
  # You can split them into two consecutive subsequences :
  # 1, 2, 3
  # 3, 4, 5
  def self.t1
    p is_possible([1,2,3,3,4,5]) == true
  end

  # You can split them into two consecutive subsequences :
  # 1, 2, 3, 4, 5
  # 3, 4, 5
  def self.t2
    p is_possible([1,2,3,3,4,4,5,5]) == true
  end

  # False
  def self.t3
    # TODO: Need to determine how I will determine if the secondary sequence is less than a size of 3...
    p is_possible([1,2,3,4,4,5]) == false
  end

  def self.run_tests
    t1
    # t2
    # t3
  end

end

TestSuite.run_tests

