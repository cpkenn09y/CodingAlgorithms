# ASSUMPTION: The board is a quadrilateral

# NOTES: Passes all test cases, except the very last leetcode test which has a ton a values... "Output Limit Exceeded"

# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve(board)
  game = GameBoard.new(board)
  game.capture_surrounded_coordinates!
end

class GameBoard

  def initialize(board)
    @board = board
    @row_ct = board.length
    if board[0]
      @col_ct = board[0].length
    else
      @col_ct = 0
    end
  end

  def is_exit?(r,c)
    is_at_edge = (
      r == 0 ||
      r == (@row_ct - 1) ||
      c == 0 ||
      c == @col_ct - 1
    )
    is_an_o = @board[r][c] == 'O'
    is_an_exit = is_at_edge && is_an_o
    return is_an_exit
  end

  def is_valid_coordinate?(r,c)
    is_valid_row = r > -1 && r < @row_ct
    is_valid_col = c > -1 && c < @col_ct
    return is_valid_row && is_valid_col
  end

  def set_coordinate_to_visited(r,c,visited)
    if is_valid_coordinate_and_not_visited?(r,c,visited)
      visited[r][c] = true
      if @board[r][c] == 'O'
        puts "FOUND AN O at (#{r},#{c})"
        set_all_neighboring_o_to_visited!(r,c,visited)
      end
    end
  end

  def is_valid_coordinate_and_not_visited?(r,c,visited)
    # puts "(#{r},#{c}). is_valid_coordinate #{is_valid_coordinate?(r,c)}"
    # puts "(#{r},#{c}). not visited yet... #{!visited[r][c]}"
    return is_valid_coordinate?(r,c) && !visited[r][c]
  end

  def set_all_neighboring_o_to_visited!(r,c,visited)
    set_coordinate_to_visited(r-1,c,visited) # top
    set_coordinate_to_visited(r,c+1,visited) # right
    set_coordinate_to_visited(r,c-1,visited) # left
    set_coordinate_to_visited(r+1,c,visited) # down
  end

  def find_an_exit(r,c,visited,stack)
    if is_valid_coordinate_and_not_visited?(r,c,visited)
      visited[r][c] = true
      # TODO: [x] Add all adjacent first into stack... then FLIP ALL...
      if @board[r][c] == 'O'
        add_to_stack(stack,r,c)
        # puts "FOUND AN 'O' at (#{r},#{c})"
        mid = is_exit?(r,c)
        # puts "CHECKING TOP (#{r-1},#{c})"
        top = find_an_exit(r-1,c,visited,stack) # top
        # puts "CHECKING RIGHT (#{r},#{c+1})"
        right = find_an_exit(r,c+1,visited,stack) # right
        # puts "CHECKING LEFT (#{r},#{c-1})"
        left = find_an_exit(r,c-1,visited,stack) # left
        # puts "CHECKING DOWN (#{r+1},#{c})"
        down = find_an_exit(r+1,c,visited,stack) # down
        is_connected_to_an_exit = mid || top || right || left || down
        return is_connected_to_an_exit
      else
        # it's an X; therefore, just continue...
      end
    end
  end

  def add_to_stack(stack,r,c)
    stack << [r,c]
  end

  def capture_surrounded_coordinates!
    visited = Array.new(@row_ct) { Array.new(@col_ct) { false } }
    stack = []
    r = 0
    c = 0
    while r < @row_ct do
      if is_valid_coordinate_and_not_visited?(r,c,visited)
        if @board[r][c] == 'X'
          visited[r][c] = true
        else
          if is_exit?(r,c)
            visited[r][c] = true
            set_all_neighboring_o_to_visited!(r,c,visited)
          else
            # Means we are at an 'O' that is not at the edge
            if find_an_exit(r,c,visited,stack)
              # [
              #   ['X', 'X', 'X','X'],
              #   ['X', 'O', 'O','X'],
              #   ['X', 'X', 'O','X'],
              #   ['X', 'X', 'O','X']
              # ]
              until stack.empty? do
                stack.pop
              end
            else
              capture_all_coordinates_within_stack!(stack)
            end
          end
        end
      end
      if c >= @col_ct - 1
        c = 0
        r += 1
      else
        c += 1
      end
    end
    puts ":: BOARD ::"
    p @board
    return @board
  end

  def capture_all_coordinates_within_stack!(stack)
    until stack.empty? do
      r,c = stack.pop
      puts "Setting coordinate (#{r},#{c}) to X"
      @board[r][c] = 'X'
    end
  end

end

# board = [
#           ['X', 'O', 'X'],
#           ['X', 'X', 'X'],
#           ['X', 'X', 'X']
#         ]
# solve(board)
# result = board == [
#                 ['X', 'O', 'X'], # Should get captured, since there was no escape
#                 ['X', 'X', 'X'],
#                 ['X', 'X', 'X']
#               ]
# puts "RESULT #{result}"

# board = [
#           ['X', 'O', 'X'],
#           ['X', 'X', 'O'],
#           ['O', 'O', 'X']
#         ]

# solve(board)
# result = board == [
#                 ['X', 'O', 'X'], # Should get captured, since there was no escape
#                 ['X', 'X', 'O'],
#                 ['O', 'O', 'X']
#               ]
# puts "RESULT #{result}"

# board = [
#           ['X', 'O', 'X'],
#           ['X', 'O', 'X'],
#           ['X', 'O', 'X']
#         ]

# solve(board)
# result = board == [
#                 ['X', 'O', 'X'], # Should get captured, since there was no escape
#                 ['X', 'O', 'X'],
#                 ['X', 'O', 'X']
#               ]
# puts "RESULT #{result}"

# board = [
#           ['X', 'X', 'X', 'X'],
#           ['X', 'O', 'O', 'X'],
#           ['X', 'X', 'X', 'X']
#         ]

# solve(board)
# result = board == [
#                 ['X', 'X', 'X', 'X'], # Should get captured, since there was no escape
#                 ['X', 'X', 'X', 'X'],
#                 ['X', 'X', 'X', 'X']
#               ]
# puts "RESULT #{result}"


# board = [
#           ['X', 'X', 'X'],
#           ['X', 'O', 'O'],
#           ['X', 'X', 'X']
#         ]

# solve(board)
# result = board == [
#                 ['X', 'X', 'X'], # Should get captured, since there was no escape
#                 ['X', 'O', 'O'],
#                 ['X', 'X', 'X']
#               ]
# puts "RESULT #{result}"


# board = [
#           ['X', 'X', 'X', 'X'],
#           ['X', 'O', 'O', 'X'],
#           ['X', 'X', 'O', 'X'],
#           ['X', 'O', 'X', 'X']
#         ]
# solve(board)

# result = board == [
#                     ['X', 'X', 'X', 'X'],
#                     ['X', 'X', 'X', 'X'],
#                     ['X', 'X', 'X', 'X'],
#                     ['X', 'O', 'X', 'X']
#                   ]

# puts "RESULT #{result}"


# # INPUT
# board = [
#   ["X","X","X","X","O","O","X","X","O"],
#   ["O","O","O","O","X","X","O","O","X"],
#   ["X","O","X","O","O","X","X","O","X"],
#   ["O","O","X","X","X","O","O","O","O"],
#   ["X","O","O","X","X","X","X","X","O"],
#   ["O","O","X","O","X","O","X","O","X"],
#   ["O","O","O","X","X","O","X","O","X"],
#   ["O","O","O","X","O","O","O","X","O"],
#   ["O","X","O","O","O","X","O","X","O"]
# ]
# solve(board)

# # EXPECTED
# result = board == [
#   ["X","X","X","X","O","O","X","X","O"],
#   ["O","O","O","O","X","X","O","O","X"],
#   ["X","O","X","O","O","X","X","O","X"],
#   ["O","O","X","X","X","O","O","O","O"],
#   ["X","O","O","X","X","X","X","X","O"],
#   ["O","O","X","X","X","O","X","X","X"],
#   ["O","O","O","X","X","O","X","X","X"],
#   ["O","O","O","X","O","O","O","X","O"],
#   ["O","X","O","O","O","X","O","X","O"]
# ]
# puts "RESULT #{result}"
