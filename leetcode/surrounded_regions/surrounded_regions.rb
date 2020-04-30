# ASSUMPTION: The board is a quadrilateral

def determine_if_coordinate_is_an_exit(board, visited, r, c, stack)
  # TODO: [_] Populate stack if we encounter an 'O'
  is_at_edge = (
    r == 0 ||
    r == board.length ||
    c == 0 ||
    c == board[0].length
  )
  if r < board.length && c < board[0].length
    # CURRENT: We are not finding the exit... that is top of (0,1)
    if visited[r][c]
      # TODO: [_] Handle out of bounds when r is greater than num of rows... b/c it would return a nil
      return false
    else
      visited[r][c] = true
      case board[r][c]
      when 'X'
        puts "Searching for exit at coordinate (#{r},#{c})..."
        is_exit = false
      when 'O'
        puts "Found an 'O' at coordinate (#{r},#{c})... adding to stack"
        # TODO: If you find an O, then recursively check for an exit...

        # is_exit = has_exit?(board,visited,r,c,stack)
        if is_at_edge
          is_exit = true
        else
          puts ":: ADD THE RECURSION ::"
          assess_this_o_for_exit(board,visited,r,c,stack)

          # Since we are not at an exit, we need to check to see if our neighbor is an exit...

          # has_exit?(board,visited,r,c,stack)
        end
      when nil
        # It's an exit
        puts "Found an exit at (#{r},#{c})"
        is_exit = true
      end
      return is_exit
    end
  else
    puts "Out of bounds... (#{r}, #{c})"
  end
end

def assess_this_o_for_exit(board,visited,r,c,stack)
  stack << [r,c] # ASSUMING THIS IS AN O
  if !has_exit?(board, visited, r, c, stack)
    # Capture all coordinates in the stack
    capture_coordinates!(board,stack)
  end
end

def has_exit?(board, visited, r, c, stack)
  top = determine_if_coordinate_is_an_exit(board,visited,r-1,c,stack) # top
  right = determine_if_coordinate_is_an_exit(board,visited,r,c+1,stack) # right
  down = determine_if_coordinate_is_an_exit(board,visited,r+1,c,stack) # down
  left = determine_if_coordinate_is_an_exit(board,visited,r,c-1,stack) # left
  return top || right || down || left
end

def capture_coordinates!(board,stack)
  until stack.empty? do
    r,c = stack.pop
    puts "ATTEMPTING CAPTURE OF (#{r},#{c})"
    board[r][c] = 'X'
    puts "Captured coordinates (#{r},#{c})"
  end
end

# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve(board)
  row_ct = board.length
  col_ct = board[0].length
  visited = Array.new(row_ct) { Array.new(col_ct) }
  r = 0
  c = 0
  stack = []
  while r < row_ct do
    if !visited[r][c]
      if board[r][c] == 'X'
        puts "(#{r}, #{c}) is an 'X'"
      else
        puts "(#{r}, #{c}) is an 'O'... Adding to stack"
        # CHECK TO SEE IF YOU ARE AN EXIT... via checking for an edge...
        # CHECK TO SEE IF YOUR DIRECT NEIGHBOR IS AN 'O'... IF It's an O and an EDGE, then SUCCESS!



        is_at_edge = (
          r == 0 ||
          r == row_ct -1 ||
          c == 0 ||
          c == board[0].length - 1
        )
        if is_at_edge
          # we are at an edge and are an 'O'; therefore, we are an exit...
          # no need to capture
        else
          # TODO: Determine if there is an escape... if there is an escape, then it cannot be captured...
          #       IF there is no escape, then we are captured. Set everything on the stack to captured
          #       Use the last coordinates in the stack to resume
          assess_this_o_for_exit(board,visited,r,c,stack)
        end
      end
      visited[r][c] = true
    else
      # puts "SKIPPING (#{r},#{c})... ALREADY VISITED"
    end
    # [x] TODO: Properly handle the incrementing
    if c >= col_ct - 1
      c = 0
      r += 1
    else
      c += 1
    end
  end
  puts ":: BOARD ::"
  p board
  board
end

# board = [
#           ['X', 'X', 'X'],
#           ['X', 'O', 'X'],
#           ['X', 'X', 'X']
#         ]

# solve(board)
# puts board == [
#                 ['X', 'X', 'X'], # Should get captured, since there was no escape
#                 ['X', 'X', 'X'],
#                 ['X', 'X', 'X']
#               ]

# board = [
#           ['X', 'O', 'X'],
#           ['X', 'X', 'X'],
#           ['X', 'X', 'X']
#         ]

# solve(board)
# puts board == [
#                 ['X', 'O', 'X'], # Should get captured, since there was no escape
#                 ['X', 'X', 'X'],
#                 ['X', 'X', 'X']
#               ]


# board = [
#           ['X', 'X', 'X'],
#           ['X', 'O', 'O'],
#           ['X', 'X', 'X']
#         ]

# solve(board)
# puts board == [
#                 ['X', 'X', 'X'], # Should get captured, since there was no escape
#                 ['X', 'O', 'O'],
#                 ['X', 'X', 'X']
#               ]



board = ['X', 'X', 'X', 'X'],
        ['X', 'O', 'O', 'X'],
        ['X', 'X', 'O', 'X'],
        ['X', 'O', 'X', 'X']


board = ['X', 'X', 'X', 'X'],
        ['X', 'O', 'O', 'X'],
        ['X', 'X', 'O', 'X'],
        ['X', 'O', 'X', 'X']

stack = [[1,1],[1,2],...]

solve(board)
