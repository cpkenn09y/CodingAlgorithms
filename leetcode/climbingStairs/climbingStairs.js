/**
 * @param {number} n
 * @return {number}
 */
let climbStairs = (n) => {
  let countingFunc = (stairsRemaining, savedResults) {
    if (stairsRemaining < 0) {
      return 0
    }
    if (stairsRemaining === 0) {
      // successfully made it to the top
      return 1
    }
    if (savedResults[stairsRemaining]) {
      return savedResults[stairsRemaining]
    }
    savedResults[stairsRemaining] = countingFunc(stairsRemaining - 1, savedResults) + countingFunc(stairsRemaining - 2, savedResults)
  }
}

console.log(climbStairs(1) === 1)
console.log(climbStairs(2) === 2)
// console.log(climbStairs(3) === 3)
// console.log(climbStairs(4) === 5)

// :: 1 step ::
// -> 1

// :: 2 step ::
// -> 1,1
// -> 2

// Q: # of combinable steps? 1 + default_1
// (n-1)

// :: 3 step ::
// -> 1,1,1
// -> 2,1
// -> 1,2

// Q: # of combinable steps? 2 + default_1
// (n-1)

// :: 4 steps :: --> 5
// -> 1,1,1,1
// -> 2,1,1
// -> 1,2,1
// -> 1,1,2
// -> 2,2

// Q: # of combinable steps? 3 + default_1
// (n-1)

// :: 5 steps :: --> 8
// -> 1,1,1,1,1
// -> 2,1,1,1
// -> 1,2,1,1
// -> 1,1,2,1
// -> 1,1,1,2
// -> 2,2,1
// -> 2,1,2
// -> 1,2,2
