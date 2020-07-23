# https://leetcode.com/problems/largest-1-bordered-square/
# ASSUMPTION: All rows have the same number of columns...

require 'pry'

class App

  def initialize(grid)
    @grid = grid
    @row_ct = @grid.length
    @col_ct = @grid[0].length
  end

  def is_one?(r_idx,c_idx)
    @grid[r_idx][c_idx] == 1
  end

  def get_right_most(r_idx,c_idx)
    while c_idx < @col_ct
      if is_one?(r_idx,c_idx)
        c_idx += 1
      else
        return [r_idx,c_idx-1]
      end
    end
    return [r_idx,c_idx-1]
  end

  def check_left_side(left_coord, rt_coord, distance)
    left_row_idx = left_coord[0]
    while left_row_idx < @row_ct
      if !is_one?(left_row_idx,c_idx)
        return false
      end
      left_row_idx += 1
    end
    return true
  end

  # TODO: check_rt_side
  # TODO: check_bottom_side

  def check_box(left_coord,rt_coord)
    distance = rt_coord[1] - left_coord[1]
    check_left_side(left_coord, rt_coord, distance)
    check_rt_side(left_coord, rt_coord, distance)
    check_bottom_side(left_coord, rt_coord, distance)
  end

  def dfs(r_idx,c_idx,visited)
    # [1,0,0]
    if is_one?(r_idx,c_idx) # CURRENT LOCATION
      left_coord = [r_idx,c_idx]
      rt_coord = get_right_most(r_idx,c_idx+1)
      if check_box(left_coord, rt_coord)
        distance = rt_coord[1] - left_coord[1]
        return (distance + 1) * (distance + 1)
      else
        return 0
      end
      # if is_one?(r_idx,c_idx+1) # RT
      #   # more searching
      # else

      # end

    else
      return 0
    end
  end

  def solve
    ct = 0
    stack = []
    visited = Array.new(@row_ct) { Array.new(@col_ct) { false } }
    @grid.each_with_index do |row,r_idx|
      # if we find a 1... then DFS... going rt, and down...
      # add to a stack...
      # if not a match, then pop off the stack to test the smaller area
      # set visited if we tested an origin
      row.each_with_index do |num, c_idx|
        # puts "Checking location #{r_idx}, #{c_idx}"
        is_visited = visited[r_idx][c_idx]
        if !is_visited
          # puts "INSIDE"
          result = dfs(r_idx,c_idx,visited)
          binding.pry
          if result > ct
            ct = result
          end
          # DFS...
          # adding to a stack
        end
      end
    end
    return ct
  end

end




def largest_1_bordered_sq(grid)
  return 0 if grid[0] == nil
  app = App.new(grid)
  return app.solve
end











# should return 9...
def t4
  grid = [
           [1,1,1],
           [1,0,1],
           [1,1,1]
         ]
  p largest_1_bordered_sq(grid)# == 9
end


def t3
  grid = [
           [1,0,0]
         ]
  p largest_1_bordered_sq(grid) == 1
end

def t2
  grid = []
  p largest_1_bordered_sq(grid) == 0
end

def t1
  # grid with all 0's should return 0
  grid = [
           [0,0,0],
           [0,0,0],
           [0,0,0]
         ]
  p largest_1_bordered_sq(grid) == 0
end

def run_tests
  t4
  # t3
  # t2
  # t1
end

run_tests
