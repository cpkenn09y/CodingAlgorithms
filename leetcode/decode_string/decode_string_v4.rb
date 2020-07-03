require 'set'

def compute(s,coefficient,open_idx,close_idx)
  s.slice(open_idx+1,close_idx-open_idx-1) * coefficient
end

def is_fully_computed?(s,open_idx,close_idx)
  return s.length - 1 == close_idx && open_idx == 1
end

def decode_string(s)
  stack_of_open_bracket_indexes = []
  i = 0
  until s[i] == nil do
    char = s[i]
    stack_of_open_bracket_indexes.push(i) if char == "["
    if char == "]"
      open_idx = stack_of_open_bracket_indexes.pop
      close_idx = i
      coefficient = s[open_idx - 1].to_i
      mid = compute(s,coefficient,open_idx,close_idx)
      if open_idx > 1
        front = s[0..open_idx-2]
      else
        front = ""
      end
      back = s[close_idx+1..s.length-1]
      s = front.concat(mid).concat(back)
      i = open_idx - 2 + mid.length # set the idx to be at the edge of the newly created mid. subtract by 1 since i gets incremented after
    end
    i += 1
  end
  return s
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
    t1
    t2
    t3
    t4
  end

end

TestSuite.run_tests
