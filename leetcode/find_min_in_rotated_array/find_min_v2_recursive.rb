<<-METRICS
  Expectation:
METRICS

class App

  def initialize(nums)
    @nums = nums
    @min = nil
  end

  def find_min
    first = @nums[0] #=> 4
    mid = @nums[@nums.length / 2] #=> mid=3, index=3
    if first < mid
      check_right(0,@nums.length / 2)
    else
    end
  end

  def check_right(first_idx,mid_idx)
    if @nums[first_idx] > @nums.lengh / mid_idx
      # first is the minimum
      @min = @nums[first_idx]
    else
      # check right again
      check_right(mid_idx)
    end
  end

end

# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  app = App.new(nums)
end


find_min([3,4,5,1,2]) = 1
