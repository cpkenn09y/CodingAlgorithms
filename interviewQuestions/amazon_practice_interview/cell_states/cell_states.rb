def get_cell_value(states,requested_index)
  val = nil
  if requested_index < 0 # out of bounds BOTTOM
    val = 0
  elsif requested_index >= states.length # out of bounds TOP
    val = 0
  else # Use regular value from array
    val = states[requested_index]
  end
  val
end

# @param  Integer[] states
# @param  Integer   days
# @return Integer[] state of cells after the given number of days
def cellCompete(states, days) # [1,0,0,0,0,1,0,0], 1
  current_state = states
  i = 0
  days.times do
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
    i = 0
  end
  current_state
end

<<-PSEUDOCODE
  IF out of bounds, then treat as 0
  IF n-1 == n + 1
  THEN 0
  ELSE 1
PSEUDOCODE

p cellCompete([1,0,0,0,0,1,0,0], 1) == [0,1,0,0,1,0,1,0]
p cellCompete([1,1,1,0,1,1,1,1], 2) == [0,0,0,0,0,1,1,0]
