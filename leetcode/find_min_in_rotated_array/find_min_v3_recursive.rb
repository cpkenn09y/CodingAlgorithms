require 'pry'
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
    last = @nums[-1]
    mid_idx = @nums.length / 2
    mid = @nums[mid_idx] #=> mid=3, index=3
    if first < mid
      puts "f less than m"
      binary_search(0,mid_idx,@nums.length-1)
    else
      puts "f more than m"
      # binary_search(0,mid_idx)
    end
    binding.pry
    return @min
  end

  private
  def binary_search(last_used_idx,first_idx,last_idx)
    puts "Checking #{@nums[last_used_idx]} > #{@nums[(first_idx + last_idx) / 2]}"
    # should be that 0 is less than 5
    if @nums[last_used_idx] < (@nums[(first_idx + last_idx) / 2])
      @min = @nums[last_used_idx]
      puts "Set min to #{@min}"
    else
      binding.pry
      raise "Unhandled Part"
      binary_search()
    end
  end

end

# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  app = App.new(nums)
  app.find_min
end

def t1
  puts find_min([0,1,2,3,4,5,6,7]) == 0
end

def t2
  puts find_min([3,4,5,1,2]) == 1
end

def run_tests
  # t1
  t2
end

run_tests
