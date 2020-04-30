var arraysEqual = (a1,a2) => {
  return JSON.stringify(a1) === JSON.stringify(a2);
}

var getFibonacci = (index) => {
  if (index == 0) { return 1 }
  if (index == 1) { return 2 }
  return getFibonacci(index - 2) + getFibonacci(index - 1)
}

console.log(getFibonacci(0) === 1)
console.log(getFibonacci(1) === 2)
console.log(getFibonacci(2) === 3)
console.log(getFibonacci(3) === 5)
console.log(getFibonacci(4) === 8)

var fibonacciValuesBelow = (value) => {
  // Keep generating fibonacci numbers until we go over the my passed in value...

  // UNTIL fib number is greater than value, then generate a new one
  var currentFibValueGreaterThanProvidedValue = false
  var collection = []
  var i = 0
  while (!currentFibValueGreaterThanProvidedValue) {
    currentFibValue = getFibonacci(i)
    if (currentFibValue < value) {
      console.log(`adding ${currentFibValue}`)
      collection.push(currentFibValue)
      console.log(`collection ${collection}`)
    }
    else {
      currentFibValueGreaterThanProvidedValue  = true
      console.log(`fib value ${currentFibValue} is greater than or equal to provided value ${value}`)
    }
    i++
  }
  return collection
}

var sumAllEvenValues = (values) => {
  sum = 0
  values.forEach((value) => {
    if (value % 2 == 0) { sum = sum + value}
  })
  return sum
}

console.log(arraysEqual(fibonacciValuesBelow(2), [1]))
console.log(arraysEqual(fibonacciValuesBelow(3), [1,2]))
console.log(arraysEqual(fibonacciValuesBelow(6), [1,2,3,5]))
console.log(arraysEqual(fibonacciValuesBelow(10), [1,2,3,5,8]))


console.log(sumAllEvenValues([1,2,3,5,8]) === 10)

console.log(sumAllEvenValues(fibonacciValuesBelow(4000000)) == 4613732)

// :: PLAN ::
// CREATE a function that is able to return fibonacci numbers, given a particular index...
// CREATE a fibonacci function that is able to return all fibonacci numbers under the provided number
//    fibonacciValuesBelow(10) //=> [1,2,3,5,8]
// CREATE a function that sums all even values within an Array
//    sumAllEvenValues([1,2,3,5,8]) //=> 10
