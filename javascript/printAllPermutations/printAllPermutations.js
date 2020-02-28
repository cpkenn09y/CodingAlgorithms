let arraysEqual = (a1,a2) => {
  return JSON.stringify(a1) == JSON.stringify(a2)
}

let printAllPermutations = (string) => {
  // string => "ab"
  let allUniquePermutations = {

  }
  // let u = []
  if (string.length == 1) {
    allPermutations
  }

  if (string.length == 2) {
    `${string[0]}${string[1]}`
  }
  return [string]
}

console.log(arraysEqual(printAllPermutations("a"), ["a"]))
console.log(arraysEqual(printAllPermutations("ab")), ["ab", "ba"])
