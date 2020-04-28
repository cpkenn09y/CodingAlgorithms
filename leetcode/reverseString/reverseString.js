// PSEUDOCODE:
  // ["h","e","l","l","o"]
  // ["o","e","l","l","h"] // flip the h and the o
  // ["o","l","l","e","h"] // flip the e and the l
  // ["o","l","l","e","h"] // BASE CASE: If at the middle index, then return
  //                       //   middle index = 2
  //                       //   length = 5
  //                       // FORMULA: Math.floor(length / 2)

// Determining the middle index:
// Scenario 1: Given length of 1
//          Math.floor(1/2)
// MIDDLE INDEX == 0

// WORKING THROUGH THE LOGIC
  // ["h","e","l","l","o"]
  // let valueToKeep = array[0] // h
  // let indexToReplace = array.length-1 // 4
  // array[0] = array[4]
  // array[4] = array[0]
  // reverseString(array,currentIndex)
  // // ["o","e","l","l","h"]

  // let valueToKeep = array[1] // e
  // let indexToReplace = array.length-2 // 3
  // array[1] = array[3]
  // array[3] = array[1]

let arraysAreEqual = (a1,a2) => {
  return JSON.stringify(a1) === JSON.stringify(a2)
}

let reverseString = (array, currentIndex=0) => {
  atMiddleIndex = Math.floor(array.length / 2)
  if (currentIndex >= atMiddleIndex) {
    return array
  }
  let valueToKeep = array[currentIndex]
  let indexToReplace = array.length - (currentIndex + 1)
  array[currentIndex] = array[indexToReplace]
  array[indexToReplace] = valueToKeep
  console.log(`CURRENT INDEX ${currentIndex} leads to ${array}`)
  return reverseString(array,currentIndex+1)
}

console.log(
  arraysAreEqual(
    reverseString(["h","e","l","l","o"]),
    ["o","l","l","e","h"]
  )
)

console.log(
  arraysAreEqual(
    reverseString(["a","b","c","d"]),
    ["d", "c", "b", "a"]
  )
)

console.log(
  arraysAreEqual(
    reverseString(["a"]),
    ["a"]
  )
)





