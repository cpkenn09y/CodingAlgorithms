require "pry"
# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  def determine_up_and_downstream(node1,node2)
    if node1.nil?
      upstream = node2 #=> 2
      downstream = node1 #=> 3
    elsif node2.nil?
      upstream = node1
      downstream = node2
    elsif node1.val == node2.val
      upstream = node1
      downstream = node2
    elsif node1.val < node2.val
      upstream = node1
      downstream = node2
    else
      upstream = node2 #=> 2
      downstream = node1 #=> 3
    end
    [upstream, downstream]
  end
  def printable_val(node)
    if node && node.val
      node_val = node.val
    else
      node_val = "nil"
    end
  end
  def base_case_reached?(item1,item2)
    item1.nil? && item2.nil?
  end
  def helper(node1,node2,index=0)
    head = nil
    upstream,downstream = determine_up_and_downstream(node1,node2)
    if index == 0
      head = upstream
    end
    old_pointer = upstream.next # nil
    upstream.next = downstream # 4a->4b
    puts "SETTING #{printable_val(upstream)} -> #{printable_val(downstream)}. Keeping old pointer #{printable_val(old_pointer)}"
    if base_case_reached?(old_pointer, downstream)
      return
    end
    helper(old_pointer, downstream, index+1) # nil, 4b
    return head
  end
  return helper(l1,l2)
end

def build_list(list)
  # 1->3->nil
  # output_string = ""
  def helper(currentList, output_string)
    if currentList.next
      # puts "Found a next"
      output_string += "->#{currentList.next.val}"
    else
      # puts "No next found"
      output_string += "->nil"
    end
    # puts "current output '#{output_string}'"
    if (currentList.next == nil)
      return output_string
    end
    helper(currentList.next, output_string)
  end
  result = helper(list, "#{list.val}")
  return result
end

# :: FINDING THE BASECASE
# Input: 1->3, 2
# Output: 1->2->3->nil

# PSEUDOCODE:
# look at l1
# look at l2
# IF l1 is less, then l1 is the head...
# ELSE l2 is the head...
# head -> downstream

# n_a1 = ListNode.new(1)
# n_a2 = ListNode.new(3)
# n_a1.next = n_a2

# n_b1 = ListNode.new(2)
# puts build_list(merge_two_lists(n_a1, n_b1)) == "1->2->3->nil"


# :: REQUESTED USE CASE #
# Input: 1->2->4, 1->3->4
# Output: 1->1->2->3->4->4

n_a1 = ListNode.new(1)
n_a2 = ListNode.new(2)
n_a3 = ListNode.new(4)

n_a1.next = n_a2
n_a2.next = n_a3

# puts build_list(n_a1) == "1->2->4->nil"

n_b1 = ListNode.new(1)
n_b2 = ListNode.new(3)
n_b3 = ListNode.new(5)

n_b1.next = n_b2
n_b2.next = n_b3

# puts build_list(n_b1) == "1->3->4->nil"

# BUG: Not sure why, but the result is missing one of the 4's
puts build_list(merge_two_lists(n_a1, n_b1)) == "1->1->2->3->4->5->nil"
