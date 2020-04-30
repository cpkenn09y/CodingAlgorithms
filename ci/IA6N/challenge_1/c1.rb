require 'pry'

# @param  {Integer}   rows
# @param  {Integer}   column
# @param  {Integer[]} grid
# @return {Integer}

def numberAmazonTreasureTrucks(rows, column, grid)
  def helper(grid,row,col,counter)
    x = 0
    y = 0
    new_grid = []
    at_park = false
    last_identified_park_x = nil
    last_identified_park_y = nil
    while x < row do
      y = 0
      while y < col do
        if (grid[x][y] == 1)
          at_park = true
          last_identified_park_x = x # 0
          last_identified_park_y = y # 0
        end
        if at_park # [1,1,0,0]
          if last_identified_park_x == x + 1
            # at an adjacent node...
          end
        end
        new_grid[x][y] = 0
        y += 1
      end
      x += 1
    end
  end
  helper(grid,row,col,counter)
end

g1 = [
       [1,1,0,0],
       [0,0,0,0],
       [0,0,1,1],
       [0,0,0,0]
     ]
p numberAmazonTreasureTrucks(4,4,g1)# == 2



