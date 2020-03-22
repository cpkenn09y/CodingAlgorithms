let integerToRoman = (integer) => {
  let currentInteger = integer
  let finalOutput = ""
  let attemptToRemove5 = () => {
    if (currentInteger % 5 == 0) {
      // factor of 5
      currentInteger = currentInteger / 5
      finalOutput += "V"
    }
  }
  // else if (currentInteger % 4 == 0) {
  //   // factor of 4
  //   return "IV"
  // }
  // else {
  //   // string the rest together
  //   for (let i=0;i<currentInteger;i++) {
  //     finalOutput = finalOutput + "I"
  //   }
  //   return finalOutput
  // }

  while (currentInteger !== 1) {
    console.log("currentInteger", currentInteger)
    // attemptToRemove5
    // attemptToRemove4
    // renderOutTheRestAsIs
    attemptToRemove5()
  }
  return finalOutput

  // WHILE...
  // Attempt to remove 5...
  // Attempt to remove 4...
  // Render the rest out as 1's...

}

// console.log(integerToRoman(1) === "I") // "I"
// console.log(integerToRoman(2) === "II") // "II"
// console.log(integerToRoman(3) === "III") // "III"
// console.log(integerToRoman(4) === "IV") // "IIII"
console.log(integerToRoman(5) === "V") // "V"
// console.log(integerToRoman(6) === "VI") // "V"
// console.log(integerToRoman(7) === "VII") // "V"
// console.log(integerToRoman(8) === "VIII") // "V"
// PSEUDOCODE
// I     = 1
// II    = 2
// III   = 3
// IV    = 4 // SKIP
// V     = 5
// VI    = 6
// VII   = 7
// VIII  = 8
// IX    = 9 // SKIP
// X     = 10



// console.log(integerToRoman(9)) // "IX"
// console.log(integerToRoman(58)) // "LVIII"
// // L = 50
// // V = 5
// // III = 3

// console.log(integerToRoman(1994)) // "MCMXCIV"
// M = 1000
// CM = 900
// XC = 90
// IV = 4
