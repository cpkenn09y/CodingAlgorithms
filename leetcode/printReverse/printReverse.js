let printReverse = (string) => {
  // could easily just iterate, then print the characters in reverse...

  // RECURSIVE:
  // BASE CASE ==> When we only have 1 more character then exit...

  let stringReversed = helper(string)
  console.log(stringReversed)
  return stringReversed
}
let helper = (string, currentIndex=0) => {
  // PSEUDOCODE:
  // IF INDEX > length - 1, then EXIT
  // START AT THE END OF THE STRING
  // INCREMENT WITH EACH CALL
  // hello

  if (currentIndex >= string.length) {
    console.log(`BASE CASE REACHED, returning ${string[currentIndex]}. NOTE: currentIndex ${currentIndex} should be 5`)
    return;
  }

  console.log(`currentIndex ${currentIndex} provides ____ + ${string[currentIndex]}`)
  helper(string, currentIndex + 1)
  console.log(string[currentIndex])
}

console.log(printReverse("hello") === "olleh")

// SAMPLE PRINT:
// currentIndex 0 provides ____ + h
// currentIndex 1 provides ____ + e
// currentIndex 2 provides ____ + l
// currentIndex 3 provides ____ + l
// BASE CASE REACHED, returning o. NOTE: currentIndex 4 should be 5
// olleh
// true
