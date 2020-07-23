<<-HOW_TO_MAKE_ARRAY_BEHAVE_LIKE_CIRCLE
  Use mod (%), then index can be any positive value and it will wrap around:

  int index;
  array1[index % array1.Length]
HOW_TO_MAKE_ARRAY_BEHAVE_LIKE_CIRCLE

# TODO: Solve without using negative indexes...
def get_index_with_wraparound(length, curr, change)
  # sum = curr + change
  # if sum < 0
  #   multiplier = 1
  # else
  #   multiplier = -1
  # end
  # return (sum.abs % length) * multiplier
  return curr + change
end

def helper(array,i,visited)
  if i == 0 && visited[0] == true
    puts "YAY IT'S SINGLY CYCLIC"
    return true if visited.uniq == [true]
  end
  if !visited[i]
    # [2,3,1,-4,-4,2]
    # [t,t,t,t,t,t]
    visited[i] = true
    i = get_index_with_wraparound(array.length, i, array[i])
    puts "VISITED #{visited}... next target is #{i}"
  else
    puts "WHOA ALREADY VISITED index #{i} previously..."
    return false
  end
  return helper(array,i,visited)
end

def has_single_cycle(array)
  visited = Array.new(array.length) { false }
  return helper(array,0,visited)
end

p has_single_cycle([2,3,1,-4,-4,2]) == true
