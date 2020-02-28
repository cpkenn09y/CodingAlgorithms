// 13195
// 5,7,13,29


// prime numbers:
// 1,2,3,5,7,9


// Create a way to get the next prime factor...?
// 7  //=> 7
// 10 //=> 2,5
// 13 //=> 13
// 15 //=> 3,5
// 27 //=> 3,3,3

// MAKE A FUNCTION CALLED getPrimeNumbers();
//   INCREMENT EACH NUMBER...
//   SEE IF THE NUMBER IS DIVISIBLE BY CURRENT NUMBER with NO REMAINER (num % current_num === 0)
// DETERMINE THE HIGHEST PRIME number

var arraysEqual = (a1,a2) => {
  return JSON.stringify(a1) === JSON.stringify(a2)
}

var getPrimeNumbers = (providedNumber) => {
  var currentCollection = []
  var primeNumbers = getNextPrimeNumber(providedNumber, currentCollection)

  return primeNumbers
}

var getNextPrimeNumber = (currentNum, currentCollection) => {
  var quotient,
      knownPrimeNumbers,
      results
  var knownPrimeNumbers = {
    2: true,
    3: true,
    5: true,
    7: true,
    11: true,
    13: true,
    17: true,
    19: true,
    21: true,
    23: true,
    29: true
  }
  for (var i=0; i<currentNum;i++) {
    num = i+1
    // console.log(`Is a known prime number? ${knownPrimeNumbers[num]}`)
    if (knownPrimeNumbers[num] && (currentNum % num === 0)) {
      // console.log(`Is a known prime number? ${knownPrimeNumbers[num]} and ${currentNum % num === 0}`)
      currentCollection.push(num)
      // console.log(currentCollection)
      quotient = currentNum / num
      if (quotient === 1) {return currentCollection }
      results = getNextPrimeNumber(quotient, currentCollection)
      break
    }
    // gets to last number... then it's prime...

  }
  return results
}

var largestPrimeFactor = (num) => {
  var primeNumbers = getPrimeNumbers(num)
  return primeNumbers[primeNumbers.length -1]
}

console.log(arraysEqual(getPrimeNumbers(2),[2]));
console.log(arraysEqual(getPrimeNumbers(7),[7]));
console.log(arraysEqual(getPrimeNumbers(10),[2,5]));
console.log(arraysEqual(getPrimeNumbers(13),[13]));
console.log(arraysEqual(getPrimeNumbers(15),[3,5]));
console.log(arraysEqual(getPrimeNumbers(27),[3,3,3]));
console.log(arraysEqual(getPrimeNumbers(45),[3,3,5]));
console.log(arraysEqual(getPrimeNumbers(13195),[5,7,13,29]));

console.log(largestPrimeFactor(45) === 5)
console.log(largestPrimeFactor(13195) === 29)
