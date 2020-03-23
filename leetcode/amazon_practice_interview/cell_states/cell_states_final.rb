# Time Complexity : O(n * m) where n is the length of the states array & where m is the number of days
# Space Complexity: O(n) where n is the size of the states array because we create two Int[] current_state and result

# @param  Integer[] states
# @param  Integer   requested_index
# @return Integer
# NOTE: returns zero when requested_index is out of bounds
def get_cell_value(states,requested_index)
  val = nil
  if requested_index < 0 || requested_index >= states.length # requested_index is outside of array
    val = 0
  else # Use regular value from array
    val = states[requested_index]
  end
  val
end

# @param  Integer[] states
# @param  Integer   days
# @return Integer[] state of cells after the given number of days
def cellCompete(states, days)
  current_state = states.dup
  days.times do
    i = 0
    result = []
    while (i < current_state.length) do
      if get_cell_value(current_state,i-1) == get_cell_value(current_state,i+1)
        # neighbors are equivalent, therefore next generation is a zero
        result << 0
      else
        # neighbors are not equivalent, therefore next generation is a one
        result << 1
      end
      i += 1
    end
    current_state = result
  end
  current_state
end

<<-PSEUDOCODE
  IF out of bounds of array, then treat as 0
  IF array[i-1] == [i+1]
  THEN 0
  ELSE 1
PSEUDOCODE

# TESTS:
# p cellCompete([1,0,0,0,0,1,0,0], 1) == [0,1,0,0,1,0,1,0]
# p cellCompete([1,1,1,0,1,1,1,1], 2) == [0,0,0,0,0,1,1,0]
