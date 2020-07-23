class App

  def initialize(gas,cost)
    @gas = gas
    @cost = cost
    @length = @gas.length
  end

  def solve
    n = @length
    total_tank, curr_tank = 0, 0
    starting_station = 0
    i = 0
    while i < n do
      total_tank += @gas[i] - @cost[i]
      curr_tank += @gas[i] - @cost[i]
      if curr_tank < 0
        # Pick up the next station as the starting one.
        starting_station = i + 1
        # Start with an empty tank.
        curr_tank = 0
      end
      i += 1
    end

    if total_tank >= 0
      return starting_station
    else
      return -1
    end
  end

end


def can_complete_circuit(gas,cost)
  app = App.new(gas,cost)
  app.solve
end

def t1
  gas  = [1,2,3,4,5]
  cost = [3,4,5,1,2]
  p can_complete_circuit(gas,cost) == 3
end

def t2
  gas  = [2,3,4]
  cost = [3,4,3]
  p can_complete_circuit(gas,cost) == -1
end

def run_tests
  p [t1,t2]
end
run_tests
