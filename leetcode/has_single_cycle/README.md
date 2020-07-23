You are given an array of integers where each integer represents a jump of its value in the array.
For instance, the integer 2 represents a jump of 2 indices forward in the array.
The integer -3 represents a jump of three indices backward in the array
If the jump spills past the array bounds, it wraps around.  For instance, a jump of -1 at index 0
brings us to the last index of the array.
Write a function that returns a boolean of whether the jumps in the array forms a single cycle.
A single cycle occurs if starting at any index in the array, following the jumps, ever element in the
array is visited exactly once before landing back on the starting index
*/
function hasSingleCycle(array) {
}
console.log(hasSingleCycle([2,3,1,-4,-4,2]) === true)
