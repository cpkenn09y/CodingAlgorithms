// got this from Anand...

var largest1BorderedSquare = function (grid) {
  let m = grid.length; // row_ct
  let n = grid[0].length; // col_ct
  let maxElements = 0;
  if (m === 0) return 0;
  let row_cache = new Array(m);
  for (let i = 0; i < grid[0].length; i++) {
    row_cache[i] = new Array(n).fill(0);
  }
  let col_cache = new Array(m);
  for (let i = 0; i < grid[0].length; i++) {
    col_cache[i] = new Array(n).fill(0);
  }
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      if (grid[i][j] != 0) {
        if (i == 0) {
          col_cache[i][j] = 1;
        } else {
          col_cache[i][j] = col_cache[i - 1][j] + 1;
        }
        if (j == 0) {
          row_cache[i][j] = 1;
        } else {
          row_cache[i][j] = row_cache[i][j - 1] + 1;
        }
      }
    }
  }
  for (let i = m-1; i >= 1; i--) {
    for (let j = n - 1; j >= 1; j--) {
      // The minimum of X[i][j] and Y[i][j] would be the length of
      // right vertical line and bottom horizontal line of the
      // square matrix ending at cell (i, j)
      let len = Math.min(row_cache[i][j], col_cache[i][j]);
      while (len) {
        // the cell ending at current cell (i, j) forms a square
        // sub-matrix if there exists a left vertical line and a
        // top horizontal line of at-least length 'len'
        let isSquare = col_cache[i][j - len + 1] >= len &&
                row_cache[i - len + 1][j] >= len;
        // check if square ending at current cell is largest so far
        if (isSquare && maxElements < len) {
          maxElements = len;
          // console.log('maxElements = ', maxElements, ' , len = ', len)
        }
        // reduce the length by 1 to check for smaller squares ending
        // at current cell
        len--;
      }
    }
  }
  return maxElements * maxElements;
};
