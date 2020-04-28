// LEETCODE REFERENCE SOLUTION: https://www.youtube.com/watch?v=tTYU4PAiqOE&feature=youtu.be


/**
 * @param {number} rowIndex
 * @return {number[]}
 */
let getRow = (rowIndex) => {
  let computeCurrentRow = (previousComputation) => {
    let newCollection = []
    for (let i=0;i<previousComputation.length;i++) {
      if (i == 0) { // add a 1 during the last iteration
        newCollection.push(1)
      }
      else {
        newCollection.push(previousComputation[i] + previousComputation[i-1])
      }
      if (i == previousComputation.length - 1) { // add a 1 during the last iteration
        newCollection.push(1)
      }
    }
    return newCollection
  }
  if (rowIndex === 0) {
    return [1]
  }
  if (rowIndex === 1) {
    return [1,1]
  }
  let previousComputation = getRow(rowIndex-1)
  return computeCurrentRow(previousComputation)
}

let areEqualArrays = (a1,a2) => {
  return JSON.stringify(a1) == JSON.stringify(a2)
}



// PSEUDOCODE:
// * IF rowIndex == 0; then row is [1]
// * IF rowIndex == 1; then row is [1,1]
// * IF rowIndex == 2; [1, f(1)[0]+f(1)[1], 1] // [1,2,1]
// * IF rowIndex == 3;
//        [
//          1,
//          f(2)[0] + f(2)[1],
//          f(2)[1]+f(2)[2],
//          1
//         ] // [1,3,3,1]

// FINDING THE BASECASE
console.log(areEqualArrays(getRow(0),[1]))
console.log(areEqualArrays(getRow(1),[1,1]))

// // SOLVING THE OTHER CASES:
console.log(areEqualArrays(getRow(2),[1,2,1]))
console.log(areEqualArrays(getRow(3),[1,3,3,1]))
console.log(areEqualArrays(getRow(4),[1,4,6,4,1]))
