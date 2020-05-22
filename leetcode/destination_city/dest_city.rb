# @param {String[][]} paths
# @return {String}
def dest_city(paths)
  destinations = []
  origins = []
  paths.each do |pair|
    origin, destination = pair
    origins << origin
    destinations << destination
  end
  return (destinations - origins)[0]
end

def test1
  # Input: paths = [["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]]
  # Output: "Sao Paulo"
  # Explanation: Starting at "London" city you will reach "Sao Paulo" city which is the destination city. Your trip consist of: "London" -> "New York" -> "Lima" -> "Sao Paulo".
  paths = [["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]]
  p dest_city(paths) == "Sao Paulo"
end

def test2
  # Example 2:
  # Input: paths = [["B","C"],["D","B"],["C","A"]]
  # Output: "A"
  # Explanation: All possible trips are:
  # "D" -> "B" -> "C" -> "A".
  # "B" -> "C" -> "A".
  # "C" -> "A".
  # "A".
  # Clearly the destination city is "A".
  # Example 3:
  paths = [["B","C"],["D","B"],["C","A"]]
  p dest_city(paths) == "A"
end

def test3
  # Input: paths = [["A","Z"]]
  # Output: "Z"
  paths = [["A","Z"]]
  p dest_city(paths) == "Z"
end

# test1
# test2
# test3
