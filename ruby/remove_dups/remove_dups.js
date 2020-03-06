/**
 * @param {number[]} nums
 * @return {number}
 */
let removeDuplicates = (nums) => {
  console.log(`Starting out with ${JSON.stringify(nums)}`)
  if (nums.length === 0) {
    return 0
  }
  let turtle = 0
  console.log(`Turtle starts at position 0. Hare starts at position 1`)
  for (let hare=1; hare<nums.length; hare++) {
    if (nums[hare] != nums[turtle]) {
      turtle++
      nums[turtle] = nums[hare]
      console.log(`Turtle(${nums[turtle]}) DOES NOT equal Hare(${nums[hare]}). Therefore, setting position ${turtle} to ${nums[hare]}`)
    }
    else {
      console.log(`Turtle(${nums[turtle]}) and Hare(${nums[hare]}) are equivalent. Hare proceeds to position ${hare+1}`)
    }
    nums[hare] = "_" // make spaces where the hare has been empty
  }
  console.log(`FINAL ${JSON.stringify(nums)}`)
  return turtle + 1
}

// nums = ["x","x","y"]

// nums is passed in by reference. (i.e., without making a copy)
// let len = removeDuplicates(nums);

// any modification to nums in your function would be known by the caller.
// using the length returned by your function, it prints the first len elements.
// for (let i = 0; i < len; i++) {
//   console.log(nums[i]);
// }
nums = [1,1,2,2,3]
let len = removeDuplicates(nums);
JSON.stringify(nums) == [1,2,3,"_","_"]
