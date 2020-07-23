class App

  def initialize(gas,cost)
    @gas = gas
    @cost = cost
    @length = @gas.length
  end

  def solve
    i = 0
    while (i < @gas.length) do
      if can_circumnavigate?(i,i)
        return i
      end
      i += 1
    end
    return -1
  end

  private
  def get_next(current_location)
    if current_location == @length - 1
      return 0
    else
      return current_location + 1
    end
  end

  def can_circumnavigate?(starting_location, current_location=0, current_tank=0, initial_entry=true)
    return true if (!initial_entry && (starting_location == current_location))
    current_tank += @gas[current_location]
    if (current_tank - @cost[current_location]) > -1
      current_tank -= @cost[current_location]
      puts "Valid to go from '#{current_location}' to next... CURRENT TANK #{current_tank}"
      return can_circumnavigate?(
        starting_location,
        get_next(current_location),
        current_tank,
        false
      )
    else
      puts "Was unable to make it past this location... '#{current_location}'. #{current_tank} was not enough... needed #{@cost[current_location]}"
      return false
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
# run_tests
