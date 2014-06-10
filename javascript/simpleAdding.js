// Goal: Create a function that adds up all the numbers from 1 to num

function SimpleAdding(num) {
  var current = 1;
  var total = 0;
  while (current < num) {
    total += current
    current ++
  }
  return total;
}

SimpleAdding(12) === 78
SimpleAdding(140) === 9870