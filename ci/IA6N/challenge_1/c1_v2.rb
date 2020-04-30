require 'pry'

<<-METRICS
  Time Complexity  = O(nm) where n is the number of rows, and m is the number of columns
  Space Complexity = O(nm) because we make a copy of the input grid
METRICS

# @param  {Integer}   rows
# @param  {Integer}   column
# @param  {Integer[]} grid
# @return {Integer}
def numberOfTreasureTrucks(rows, cols, grid)
  grid_copy = grid.dup
  x = 0
  counter = 0
  while x < rows do
    y = 0
    while y < cols do
      if (grid_copy[x][y] == 1)
        counter += 1
        turn_all_adjacent_into_zeros!(grid_copy,rows,cols,x,y)
      end
      y += 1
    end
    x += 1
  end
  counter
end

def turn_all_adjacent_into_zeros!(grid,rows,cols,x,y)
  grid[x][y] = 0
  if y + 1 < cols
    # turn right into 0
    turn_all_adjacent_into_zeros!(grid,rows,cols,x,y+1) if grid[x][y+1] == 1
  end
  if y - 1 > 0
    # turn left into 0
    turn_all_adjacent_into_zeros!(grid,rows,cols,x,y-1) if grid[x][y+1] == 1
  end
  if x + 1 < rows
    # turn bottom into 0
    turn_all_adjacent_into_zeros!(grid,rows,cols,x+1,y) if grid[x+1][y] == 1
  end
  if x - 1 > 0
    # turn above into 0
    turn_all_adjacent_into_zeros!(grid,rows,cols,x-1,y) if grid[x-1][y] == 1
  end
  grid
end


<<-TESTS
TESTS
def test1
  result = turn_all_adjacent_into_zeros!(
    [
      [1,1,0,0],
      [1,0,0,0]
    ],
    2,
    4,
    0,
    0
  )
  p result == [
    [0,0,0,0],
    [0,0,0,0]
  ]
end

def test2
  result = turn_all_adjacent_into_zeros!(
    [
      [1,1,0,0],
      [1,0,0,0],
      [1,0,0,0]
    ],
    3,
    4,
    0,
    0
  )
  p result == [
    [0,0,0,0],
    [0,0,0,0],
    [0,0,0,0]
  ]
end

def test3
  g1 = [
         [1,1,0,0], # [0 0 0 0]
         [0,0,0,0],
         [0,0,1,1], # [0 0 0 0]
         [0,0,0,0]
       ]
  p numberOfTreasureTrucks(4,4,g1) == 2
end

def test4
  g1 = [
         [1,1,0,0], # [0 0 0 0]
         [0,0,1,0], # [0 0 0 0]
         [0,0,0,0],
         [1,0,1,1], # [0 0 0 0]
         [1,1,1,1]  # [0 0 0 0]
       ]
  p numberOfTreasureTrucks(5,4,g1) == 3
end

def test5
  g1 = [
         [1,0,0,0,0,0,0],
         [0,1,0,0,0,0,0],
         [0,0,1,0,0,0,0],
         [0,0,0,1,0,0,0],
         [0,0,0,0,1,0,0],
         [0,0,0,0,0,1,0],
         [0,0,0,0,0,0,1],
       ]
  p numberOfTreasureTrucks(7,7,g1) == 7
end

test1
test2
test3
test4
test5
