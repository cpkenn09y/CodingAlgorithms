class MovingAverage

  def initialize(size)
    @max_size = size
    @collection = []
    @sum = 0
  end

  def next(val)
    if @collection.length >= @max_size
      old_num = @collection.shift
      @sum -= old_num
    end
    @collection.push(val)
    @sum = (@sum + val).to_f
    @current_average = @sum / @collection.length
    return @current_average
  end

end

# Your MovingAverage object will be instantiated and called as such:
# obj = MovingAverage.new(size)
# param_1 = obj.next(val)

m = MovingAverage.new(3);
p m.next(1) == 1
p m.next(10) == (1 + 10).to_f / 2
p m.next(3) == (1 + 10 + 3).to_f / 3
p m.next(5) == (10 + 3 + 5).to_f / 3
