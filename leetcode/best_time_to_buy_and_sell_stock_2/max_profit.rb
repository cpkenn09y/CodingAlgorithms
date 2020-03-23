require 'pry'
# TIME COMPLEXITY: N!
# SPACE COMPLEXITY: O(N) or O(1)?

# ITERATIVE
def max_profit(stock_prices_per_day)
  overall_max = 0
  stock_prices_per_day.each_with_index do |current_price,i| # [7,6,4,3,1]
    while (i < stock_prices_per_day.length - 1) do
      net_result = (current_price - stock_prices_per_day[i+1]) * -1 # (7 - 6) * -1
      if net_result > overall_max
        puts "(#{current_price} - #{stock_prices_per_day[i+1]}) * -1. net_result '#{net_result}' is greater than '#{overall_max}'"
        overall_max = net_result
      else
        puts "(#{current_price} - #{stock_prices_per_day[i+1]}) * -1. net_result '#{net_result}' was less than overall_max '#{overall_max}'"
      end
      i += 1
    end
  end
  overall_max
end





















# RECURSIVE
def max_profit(stock_prices_per_day)
  def helper(stock_prices_left,x,y,current_max) # [3,6]
    if y >= stock_prices_left.length || x >= stock_prices_left.length
      return current_max
    end
    net_result = (stock_prices_left[x] - stock_prices_left[y]) * -1
    if net_result > current_max
      current_max = net_result
      puts "(#{stock_prices_left[x]} - #{stock_prices_left[y]}) * -1. net_result '#{net_result}' is greater than '#{current_max}'"
    else
      puts "(#{stock_prices_left[x]} - #{stock_prices_left[y]}) * -1. net_result '#{net_result}' is LESS than '#{current_max}'"
    end
    return helper(stock_prices_left,x,y+1,current_max)
  end
  all_maxes = []
  i = 0
  while (i < stock_prices_per_day.length)
    all_maxes << helper(stock_prices_per_day,i,i+1,0)
    i += 1
  end
  all_maxes.max
end



#####

max_profit([7,6,4,3,1]) == 0

<<-Q1
  7-->6 # -1
  7-->4 # -3
  7-->3 # -4
  7-->1 # -6

  6-->4 # -2
  6-->3 # -3
  6-->1 # -5

  4-->3 # -1
  4-->1 # -3

  # IF all are negative... then return 0
Q1

p max_profit([1,2,3,4,5]) == 4

<<-Q2
  1-->2 # 1
  1-->3 # 2
  1-->4 # 3
  1-->5 # 4

  2-->3 # 1
  3-->4 # 1
  3-->5 # 2

  4-->5 # 1

  # NOTE: Take the largest...
Q2



# p max_profit([1,5,3,6])
max_profit([7,1,5,3,6,4]) == 5 # WITH 1 TRANSACTIONS
# max_profit([7,1,5,3,6,4]) == 7 # WITH 2 TRANSACTIONS

<<-Q3
  BASECASE:
    * once you reach the end of the array of permutations,
      return
  RECURSIVE RELATION:
    * once you find a gain,
      create a sub-array
      assess the max

  7-->1 # -6
  7-->5 # -2
  7-->3 # -4
  7-->6 # -1
  7-->4 # -3

  1-->5 # +4 # [1,5,3,6,4]
  1-->3 # +2
  1-->6 # +5
  1-->4 # +3

  5-->3 # -2
  5-->6 # +1
  5-->4 # -1

  3-->6 # +3
  3-->4 # +1

  # NOTE: Take the largest...
Q3
