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

def evaluate_until_start_bracket(stack)
  result = ""
  until (stack.last == "[") do
    result.concat(stack.pop)
  end
  stack.pop # remove the open bracket
  multiplier = stack.pop
  return result * multiplier
end

# @param {String} s
# @return {String}
def decode_string(s)
  stack = []
  valid_numbers = Set.new("0".."9")
  valid_letters = Set.new("a".."z") # NOTE: Does not handle uppercase
  curr_s_int = ""
  curr_letters = ""
  final = ""
  i = 0
  while (i < s.length) do
    char = s[i]
    puts "i --> #{i}"
    if valid_numbers.include?(char)
      puts "Found num '#{char}'"
      if curr_letters.length > 0# commit any existing letters
        final.concat(curr_letters)
        curr_letters = ""
      end
      curr_s_int.concat(char)
      i += 1
      next
    elsif curr_s_int.length > 0
      puts "PUSHING NUM #{curr_s_int} onto stack"
      stack.push(curr_s_int.to_i)
      curr_s_int = ""
    end
    if curr_letters.length > 0 && !valid_letters.include?(char)
      # When we reach the end of a string series, we must add it to the stack
      puts "ADDING #{curr_letters} onto stack"
      stack.push(curr_letters)
      curr_letters = ""
    end
    if char == "["
      puts "PUSHING OPEN BRACKET ONTO STACK"
      stack.push(char)
    elsif char == "]"
      final.concat(evaluate_until_start_bracket(stack)) # TODO: Implement start_popping_from_stack
      binding.pry
      puts "HANDLED CLOSE BRACKET... resulting FINAL: #{final}"
    else
      puts "Found letter '#{char}'"
      curr_letters.concat(char)
      # TODO: Handle once the series of letters is complete.
    end
    i += 1
  end
  final.concat(curr_letters) if curr_letters.length > 0
  return final
end

module TestSuite

  def self.t1
    s = "3[a]2[bc]"
    p decode_string(s) == "aaabcbc"
  end

  def self.t2
    s = "2[abc]3[cd]ef"
    p decode_string(s) == "abcabccdcdcdef"
  end

  def self.t3
    s = "abc3[cd]xyz"
    p decode_string(s) == "abccdcdcdxyz"
  end

  def self.t4
    s = "3[a2[c]]"
    p decode_string(s) == "accaccacc"
  end

  def self.run_tests
    # t1
    # t2
    # t3
    t4 # currently failing...
  end

end

TestSuite.run_tests
