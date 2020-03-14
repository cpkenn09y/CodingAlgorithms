// Space Complexity: O(n), where n is the number of digits
// Time Complexity: O(n squared)

/**
 * @param {string} digits
 * @return {string[]}
 */
const letterCombinations = function(digits) {
  const numToAlphabets = {
      2: ['a','b','c'],
      3: ['d','e','f'],
      4: ['g','h','i'],
      5: ['j','k','l'],
      6: ['m','n','o'],
      7: ['p','q','r','s'],
      8: ['t','u','v'],
      9: ['w','x','y','z']
  }

  if (digits.length === 0) {
    return []
}

  const digitsArray = digits.split('')

  let mappedDigits = []
  for (let i=0; i < digitsArray.length; i++) {
    mappedDigits.push(numToAlphabets[digitsArray[i]])
  }

  // const f = (a, b) => [].concat(...a.map(d => b.map(e => [].concat(d, e))));
  // const cartesian = (a, b, ...c) => (b ? cartesian(f(a, b), ...c) : a);
  const resultArray = cartesian(mappedDigits)

  if (!Array.isArray(resultArray[0])) {
    return resultArray
  }

  const result = []
  for (let i=0; i < resultArray.length; i++) {
    result.push(resultArray[i].join(''))
  }
  return result
};

const cartesian = (digitsArray) => {
  let i = 1
  let product = digitsArray[0]
  while (i < digitsArray.length) {
    product = cartesianHelper(digitsArray[i], product)
    i++
  }
  return product
}

const cartesianHelper = (x, p) => {
  let product = []
  for (let i=0; i < p.length; i++) {
    for (let j=0; j<x.length; j++) {
      product.push([p[i]+x[j]])
    }
  }

  return product
}

console.log(letterCombinations("234"))
console.log(letterCombinations("23"))
console.log(letterCombinations("2"))
console.log(letterCombinations(""))
