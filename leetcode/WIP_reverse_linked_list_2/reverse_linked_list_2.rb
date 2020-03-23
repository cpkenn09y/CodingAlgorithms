<<-METRICS
  Time Start: 11:25am
  Time End:
  Space Complexity:
  Time Complexity:
METRICS

require 'pry'

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @param {Integer} m
# @param {Integer} n
# @return {ListNode}
def reverse_between(head, m, n)
  <<-PSEUDOCODE
    head # 1
    head.next # 2
    head.next.next # 3
    head.next.next.next # 4

    head.next = head.next.next.next # 1->4

    i = 1
    head.next = nil
    i = 2
    # current_node # 2
    # current_node.next # 3
    current_node.next = current_node # reversal... 3->2
    i = 3
    current_node.next = current_node # reversal... 4->3
    i = 4 # i == n
    head = current_node
    i = 5
    node_m.next = node_post_sequence  #
  PSEUDOCODE
  i = 1
  complete = false
  current_node = head
  next_current = nil
  node_m = nil
  overwritten_next = nil # 4
  until (complete) do
    next_current = current_node.next
    case i
    when 1
      # do nothing
    when 2
      overwritten_next = current_node.next.next # 4
      current_node.next.next = current_node # 3->2
      node_m = current_node # 2
      binding.pry
      puts "Setting #{current_node.next.val}->#{current_node.val}" # Setting 3->2
    when 3
      current_node.next.next = current_node # 4->3
      puts "Setting #{current_node.next.val}->#{current_node.val}"
    when 4
      head = current_node
    when 5
      node_m.next = current_node
    else
      complete = true
    end
    current_node = next_current #
    puts "current_node #{current_node.val}"
    i += 1
  end
end

def print_linked_list(root)
  current_node = root
  list_vals = [] # ["1"]
  until (false) do
    if current_node == nil
      break
    end
    list_vals << current_node.val # ["1", "2"]
    current_node = current_node.next
  end
  list_vals.join("->")
end

l1 = ListNode.new(1)
l2 = ListNode.new(2)
l3 = ListNode.new(3)
l4 = ListNode.new(4)
l5 = ListNode.new(5)

l1.next = l2
l2.next = l3
l3.next = l4
l4.next = l5
# p print_linked_list(l1)
reverse_between(l1, 2, 4)
# p print_linked_list(l1)

# Input: 1->2->3->4->5->NULL, m = 2, n = 4
# Output: 1->4->3->2->5->NULL
