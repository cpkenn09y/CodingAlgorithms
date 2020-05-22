<<-METRICS
  Time Complexity = O(n + m) where n is the length of a and m is the length of h.
  Space Complexity = O(n) where n is the size of a.
  Time spent = ~15-20 mins
METRICS

def subset(a,h)
  a_letter_ct = {}
  return true if a.empty?
  a.each do |element|
    if a_letter_ct.has_key?(element)
      a_letter_ct[element] += 1
    else
      a_letter_ct[element] = 1
    end
  end
  h.each do |element|
    if a_letter_ct[element] == 1
      a_letter_ct.delete(element)
    elsif a_letter_ct.has_key?(element)
      a_letter_ct[element] -= 1
    end
  end
  return a_letter_ct.empty?
end

# 'should return true for an empty set'
needles  = []
haystack = ['a', 'b', 'c']
puts subset(needles, haystack) === true
# # # 'should return true if in haystack'
needles  = ['a']
haystack = ['a']
puts subset(needles, haystack) === true
# # # 'should return false if not in haystack'
needles  = ['a']
haystack = ['b']
puts subset(needles, haystack) === false
# # # 'should return true if in different order'
needles  = ['a', 'b', 'c']
haystack = ['b', 'a', 'c']
puts subset(needles, haystack) === true
# # # 'should return false if haystack smaller'
needles  = ['a', 'b' 'c']
haystack = ['a', 'b']
puts subset(needles, haystack) === false
# # # 'should return true if extra values'
needles  = ['a', 'b', 'c']
haystack = ['b', 'q', 'r', 'n', 'a', 'c']
puts subset(needles, haystack) === true
# # # 'should return false if missing one value'
needles  = ['a', 'b', 'c']
haystack = ['q', 'r', 'n', 'a', 'c']
puts subset(needles, haystack) === false
# # # 'should return false if not enough of the multiple value'
needles  = ['a', 'a', 'b', 'c']
haystack = ['b', 'q', 'r', 'n', 'a', 'c']
puts subset(needles, haystack) === false
# # # 'should return true if more of multiple value'
needles  = ['a', 'a', 'b', 'c']
haystack = ['b', 'a', 'a', 'a', 'c']
puts subset(needles, haystack) === true

