require 'pry'
require 'set'

def handle_when_number(char,curr_s_int,valid_numbers,stack)
  if valid_numbers.include?(char)
    puts "FOUND num '#{char}'"
    curr_s_int.concat(char)
    return true
    # TODO: Need to actually add the curr_s_int to stack
    # TODO: Need to convert curr_s_int to an integer
  elsif curr_s_int.length > 0
    puts "PUSHING NUM #{curr_s_int} onto stack"
    stack.push(curr_s_int.to_i)
    return false
  end
end

# @param {String} s
# @return {String}
def decode_string(s)
  stack = []
  valid_numbers = Set.new("0".."9")
  curr_s_int = ""
  curr_string = ""
  i = 0
  while (i < s.length) do
    char = s[i] #=> "["
    if handle_when_number(char,curr_s_int,valid_numbers,stack)
      i += 1
      next
    end
    if char == "["
      puts "PUSHING OPEN BRACKET ONTO STACK"
      stack.push(char)
    elsif char == "]"
      puts "FOUND A CLOSE BRACKET... need to implement"
      # start_popping_from_stack(stack) # TODO: Implement start_popping_from_stack
    else
      # must be a letter based on the challenge description
      curr_string.concat(char)
      # TODO: Handle once the series of letters is complete.
      puts "found something else #{char}"
    end
    i += 1
  end
  return "temp"
end

s = "3[a]2[bc]"
p decode_string(s) == "aaabcbc"

# s = "3[a2[c]]"
# p decode_string(s) == "accaccacc"

# s = "2[abc]3[cd]ef"
# p decode_string(s) == "abcabccdcdcdef"

# s = "abc3[cd]xyz"
# p decode_string(s) == "abccdcdcdxyz"
