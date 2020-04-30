def can_find_zero?(array) #=> [3,0,7,2]
  current_index = 0
  current_value = array[0] #=> 3
  upper_target = array[current_index + current_value] #=> 2
  lower_target = current_index - current_value #=> OOB
  is_valid_lower_target = (lower_target) < 0 #=> false
  is_valid_upper_target = (upper_target != nil) # true
  if is_valid_lower_target
    # do not do a check because it's out of bounds
  elsif is_valid_upper_target #=> 2
    # look at the value
    if upper_target == 0 # false
      return true
    else
      current_value = upper_target #=> 2
    end
  end
  return array.include?(0)
end

raise "should find zero when array has one element of zero" unless can_find_zero?([0])
raise "should not find a zero when working with a subset" unless can_find_zero?([3,7,2,0])
raise "should find a zero from second hop" unless can_find_zero?([3,0,7,2])
