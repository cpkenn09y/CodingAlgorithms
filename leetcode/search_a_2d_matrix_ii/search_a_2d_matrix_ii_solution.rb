<<-NOTES
  # Solved based on the leetcode solution

  1) Start at bottom left
  2) IF (target < current)
       row -= 1
     ELSE
       col += 1
     END
  3) Handle boundaries:
       row >= 0
       col < matrix[0].length
NOTES


def search_matrix(matrix, target)
  return false if matrix == []
  row = matrix.length - 1
  col = 0
  col_ct = matrix[0].length
  while (row >= 0 && col < col_ct) do
    if target == matrix[row][col]
      return true
    elsif target < matrix[row][col]
      row -= 1
    else
      col += 1
    end
  end
  return false
end


module TestSuite

  def self.t1
    matrix = [
      [1,   4,  7, 11, 15],
      [2,   5,  8, 12, 19],
      [3,   6,  9, 16, 22],
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

  def self.t6
    matrix = []
    p "t6 ==> #{search_matrix(matrix, 1) == false}"
  end

  def self.run_tests
    t1
    t2
    t3
    t4
    t5
    t6
  end

end

TestSuite.run_tests
