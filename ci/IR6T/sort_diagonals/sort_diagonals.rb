<<-METRICS
  TIME COMPLEXITY: O(n^2) relative to the number of rows.
METRICS

def get_diagonal(grid,row_index,col_index)
  diagonal = []
  while row_index < grid.length do
    diagonal << grid[row_index][col_index] if !grid[row_index][col_index].nil?
    row_index += 1
    col_index += 1
  end
  diagonal
end

def repopulate_grid!(grid,sorted_diagonal,row_index,col_index)
  i = 0
  while i < sorted_diagonal.length do
    grid[row_index][col_index] = sorted_diagonal[i]
    i += 1
    row_index += 1
    col_index += 1
  end
  grid
end

def print_grid(grid)
  # puts "PRINTING"
  grid.each do |row|
    # p row
  end
end

def sort_diagonals(grid)
  num_of_rows = grid.length
  num_of_cols = grid[0].length
  row_ct = 0
  col_ct = 0
  while col_ct < num_of_cols do
    diagonal = get_diagonal(grid,row_ct,col_ct)
    sorted_diagonal = diagonal.sort
    repopulate_grid!(grid,sorted_diagonal,row_ct,col_ct)
    print_grid(grid)
    col_ct += 1
  end
  row_ct = 1
  col_ct = 0
  while row_ct < num_of_rows do
    diagonal = get_diagonal(grid,row_ct,col_ct)
    sorted_diagonal = diagonal.sort
    repopulate_grid!(grid,sorted_diagonal,row_ct,col_ct)
    print_grid(grid)
    row_ct += 1
  end
  grid
end

input = [
  [10,7],
  [1,5]
]
output = [
  [5,7],
  [1,10]
]
p sort_diagonals(input) == output

input = [
  [5,3,9,4],
  [9,1,7,7]
]
output = [
  [1,3,7,4],
  [9,5,7,9]
]
p sort_diagonals(input) == output

input = [
  [1,3,9,4],
  [9,5,7,7],
  [3,6,9,7],
  [1,2,2,2]
]
output = [
  [1,3,7,4],
  [2,2,7,9],
  [2,6,5,7],
  [1,3,9,9]
]

p sort_diagonals(input) == output
