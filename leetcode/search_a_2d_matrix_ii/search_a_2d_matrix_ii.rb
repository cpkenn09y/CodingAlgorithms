<<-NOTES
  * "128 / 129 test cases passed"
  * times out on test case 129
NOTES

require 'pry'
class App

  def initialize(matrix,target)
    @matrix = matrix
    @target = target
    @row_ct = matrix.length
    matrix[0] ? @col_ct = matrix[0].length  : @col_ct = 0
    @target_found = false
  end

  def run
    return true if @target_found
    allowed_row_indexes = get_allowed_row_indexes
    # puts "allowed_row_indexes --> #{allowed_row_indexes}"
    return false if @matrix == [[]]
    # return false if allowed_row_indexes == nil && @target_found == false # handle usecase when matrix is [[]]
    return true if @target_found
    allowed_col_indexes = get_allowed_col_indexes
    # puts "allowed_col_indexes --> #{allowed_col_indexes}"
    return true if @target_found
    intersection_coords = get_allowed_intersection_coordinates(allowed_row_indexes, allowed_col_indexes)
    # puts "intersection_coords --> #{intersection_coords}"
    while (intersection_coords.length > 0) do
      row_idx,col_idx = intersection_coords.pop
      return true if @matrix[row_idx][col_idx] == @target
    end
    return false
  end

  private
  def get_allowed_intersection_coordinates(allowed_row_indexes, allowed_col_indexes)
    # NOTE: Does not include coordinates that are part of the edges since we've already assessed those
    result = []
    allowed_row_indexes.each do |row_idx|
      next if (row_idx == 0 || row_idx == @row_ct - 1)
      allowed_col_indexes.each do |col_idx|
        next if (col_idx == 0 || col_idx == @col_ct - 1)
        result.push([row_idx,col_idx])
      end
    end
    return result
  end

  def get_allowed_row_indexes
    i = 0
    allowed_row_indexes = []
    while i < @row_ct do
      row = @matrix[i]
      return nil if row == []
      front = row[0]
      back = row[-1]
      @target_found = true if front == @target || back == @target
      if @target_found
        return nil
      else
        if @target > front && @target < back
          # puts "#{@target} is between #{front}-#{back}"
          allowed_row_indexes.push(i)
        end
      end
      i += 1
    end
    return allowed_row_indexes
  end

  def get_allowed_col_indexes
    col_index = 0
    allowed_col_indexes = []
    while col_index < @col_ct do
      front = @matrix[0][col_index]
      back = @matrix[-1][col_index]
      @target_found = true if front == @target || back == @target
      if @target_found
        return nil
      else
        if @target > front && @target < back
          # puts "#{@target} is between #{front}-#{back}"
          allowed_col_indexes.push(col_index)
        end
      end
      col_index += 1
    end
    return allowed_col_indexes
  end

end

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  app = App.new(matrix,target)
  app.run
end


module TestSuite

  <<-COMMENTS
  COMMENTS

  def self.t1
    matrix = [
      # v  # v
      [1,   4,  7, 11, 15], # valid row
      [2,   5,  8, 12, 19], # valid row
      [3,   6,  9, 16, 22], # valid row
      [10, 13, 14, 17, 24],
      [18, 21, 23, 26, 30]
    ]
    p "t1 ==> #{search_matrix(matrix, 2) == true}"
  end

  def self.t2
    matrix = [
      [1,   4,  7, 11, 15],
      [2,   5,  8, 12, 19],
      [3,   6,  9, 16, 22],
      [10, 13, 14, 17, 24],
      [18, 21, 23, 26, 30]
    ]
    p "t2 ==> #{search_matrix(matrix, 15) == true}"
  end

  def self.t3
    matrix = [
      [1,   4,  7, 11, 15],
      [2,   5,  8, 12, 19],
      [3,   6,  9, 16, 22],
      [10, 13, 14, 17, 24],
      [18, 21, 23, 26, 30]
    ]
    p "t3 ==> #{search_matrix(matrix, 5) == true}"
  end

  def self.t4
    matrix = [
      [1,   4,  7, 11, 15],
      [2,   5,  8, 12, 19],
      [3,   6,  9, 16, 22],
      [10, 13, 14, 17, 24],
      [18, 21, 23, 26, 30]
    ]
    p "t4 ==> #{search_matrix(matrix, 20) == false}"
  end

  def self.t5
    matrix = [[]]
    p "t5 ==> #{search_matrix(matrix, 1) == false}"
  end

  def self.run_tests
    t1
    t2
    t3
    t4
    t5
  end

end

TestSuite.run_tests
