fibonacci = function(index) {
  if (index === 0) {
    return 0;
  } else if (index <= 2) {
    return 1;
  } else {
    return fibonacci(index-2) + fibonacci(index-1);
  }
};