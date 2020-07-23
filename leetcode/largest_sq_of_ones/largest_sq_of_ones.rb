require 'pry'

<<-LEARNINGS
  * When dealing with Dynamic Programming of a grid, think about if it's useful for me to create a Left-to-Right cache
  * Based on the left to right cache, I can determine how many sequential 1's I have...
  * This can help me to determine if we have a square...
  * Any and all squares that are larger than our current max are of interest... See the part where I decrement all potential_sq_size options

  Additional learnings... got some practice creating

  MISTAKES MADE: when dealing with nested loops, need to make sure that we RESET things like counters, indexes, etc.

  LESSON: When writing my test specs, I can make a method called run_tests which runs all the tests and returns an Array... this way, we can just look at the final array to see if all tests passed...

  LESSON: Iterating downwards to compute the down_cache... I need to get decently good at doing stuff like this so that I can iterate over a 2d array in multiple directions... the indexes tend to be tricky... SO A GOOD THING TO DO IS TO JUST CHECK THAT MY 2d ARRAY ITERATOR IS WORKING AS INTENDED... VIA PRINT STATEMENTS...
LEARNINGS


class App

  def initialize(grid)
    @grid = grid
    @row_ct = @grid.length
    @grid[0] ? @col_ct = @grid[0].length : @col_ct = 0
  end

  def solve
    return 0 if @row_ct == 0 || @col_ct == 0
    ltr_cache   = compute_left_to_right_cache
    return get_largest_sq_of_ones(ltr_cache)
  end

  private
  def get_largest_sq_of_ones(ltr_cache)
    r_idx = @row_ct - 1
    current_max = 0
    while r_idx > -1 do
      c_idx = @col_ct - 1
      while c_idx > -1
        potential_sq_size = ltr_cache[r_idx][c_idx]
        while potential_sq_size > current_max
          if is_square?(potential_sq_size,r_idx,c_idx,ltr_cache)
            current_max = potential_sq_size
            puts "CURRENT MAX SET TO #{current_max}"
          end
          potential_sq_size -= 1
        end
        c_idx -= 1
      end
      r_idx -= 1
    end
    return current_max
  end

  # start at bottom right... because we will have the largest potential square sizes
  #  then compute of there is a potential square...
  def is_square?(potential_sq_size,r_idx,c_idx,ltr_cache)
    if potential_sq_size == 1
      return true
    end
    index_distance = (potential_sq_size - 1)
    target_c_idx = c_idx - index_distance
    target_r_idx = r_idx - index_distance
    orig_idx = r_idx
    return false if target_c_idx < 0 || target_r_idx < 0
    while r_idx >= target_r_idx do
      rt_value = ltr_cache[r_idx][c_idx]
      left_value = ltr_cache[r_idx][target_c_idx]
      return false if rt_value == 0 || left_value == 0
      row_is_valid = (rt_value - left_value == index_distance)
      if row_is_valid
        puts "ROW VALID r(#{r_idx}) c(#{c_idx}) --> r(#{r_idx}) c(#{target_c_idx})"
      else
        return false
      end
      r_idx -= 1
    end
    puts "SQUARE FOUND AT r(#{orig_idx}) c(#{c_idx})... size of #{potential_sq_size}"
    return true
  end

  def compute_left_to_right_cache
    collection = []
    @grid.each_with_index do |row,r_idx|
      computed_row = []
      counter = 0
      row.each_with_index do |num,c_idx|
        num == 1 ? counter += 1 : counter = 0
        computed_row[c_idx] = counter
      end
      collection << computed_row
    end
    return collection
  end

  # LESSON: How to iterate downwards...
  def compute_down_cache
    collection = Array.new(@row_ct) { Array.new(@col_ct) { 0 }}
    c_idx = 0
    while (c_idx < @col_ct) do
      r_idx = 0 # LESSON: whenever doing these nested loops, make sure to double check that values get properly reset...
      counter = 0
      while (r_idx < @row_ct) do
        val = @grid[r_idx][c_idx]
        if val == 1
          counter += 1
        else
          counter = 0
        end
        collection[r_idx][c_idx] = counter
        r_idx += 1
      end
      c_idx += 1
    end
    return collection
  end
end


def largest_sq_of_ones(grid)
  app = App.new(grid)
  app.solve
end

def t1
  grid = [[1,1,1],[1,0,1],[1,1,1]]
  p largest_sq_of_ones(grid) == 1
end

def t2
  grid = [[1,1,0,0]]
  p largest_sq_of_ones(grid) == 1
end

def t3
  grid = [
           [1,1,0,1,0],
           [0,1,1,1,0],
           [1,1,1,1,0],
           [0,1,1,1,1]
         ]
  p largest_sq_of_ones(grid) == 3
end

def t4
  grid = [
           [1,1,1,1],
           [1,1,1,1],
           [1,1,1,1],
           [1,1,1,1]
         ]
  p largest_sq_of_ones(grid) == 4
end

def t5
  grid = [
           [1,1,0,1,0,1,1,1,1],
           [0,1,1,1,0,1,1,1,1],
           [1,1,1,1,0,1,1,1,1],
           [0,1,1,1,1,1,1,1,1]
         ]

  p largest_sq_of_ones(grid) == 4
end

def t6
  grid = [
           [0,1,1,1,1],
           [0,1,1,1,1],
           [0,1,1,1,1],
           [1,1,1,1,1]
         ]
  p largest_sq_of_ones(grid) == 4
end

def run_tests
  # INDIVIDUAL TESTS
  # puts "t1 --> #{t1}"
  # puts "t2 --> #{t2}"
  # puts "t3 --> #{t3}"
  # puts "t4 --> #{t4}"
  # puts "t5 --> #{t5}"
  # puts "t6 --> #{t6}"
  # FULL
  return [t1,t2,t3,t4,t5,t6]
end

p run_tests
# Input: grid = [[1,1,1],[1,0,1],[1,1,1]]
# Output: 1
# Example 2:
# Input: grid = [[1,1,0,0]]
# Output: 1
# Example 3:
# Input: grid = [[1,1,0,1,0],[0,1,1,1,0],[1,1,1,1,0],[0,1,1,1,1]]
# Output: 3
