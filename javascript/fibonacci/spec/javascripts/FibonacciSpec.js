describe("Fibonacci", function() {

  it("should be equal to 0 for index 0", function() {
    expect(fibonacci(0)).toEqual(0);
  });

  it('should equal to 1 for index 1', function() {
    expect(fibonacci(1)).toEqual(1);
  });

  it ('should equal to 1 for index 2', function(){
    expect(fibonacci(2)).toEqual(1);
  });

  it ('should equal to 2 for index 3', function(){
    expect(fibonacci(3)).toEqual(2);
  });

  it ('should equal to 3 for index 4', function() {
    expect(fibonacci(4)).toEqual(3);
  });

  it ('should equal to 21 for index 8', function() {
    expect(fibonacci(8)).toEqual(21);
  });

});