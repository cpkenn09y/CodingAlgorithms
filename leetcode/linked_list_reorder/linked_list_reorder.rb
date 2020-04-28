require 'pry'

class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

def create_list_map!(node)
  list_map = {}
  i = 0
  while (node != nil) do
    list_map[i] = node
    node = node.next
    i += 1
  end
  return list_map
end

def reorder_list(head) # 1->2->3->4
  list_map = create_list_map!(head)
  i = 1
  j = list_map.length - 1 #=> 3
  first = head
  use_j = true
  while (first != nil) do
    if use_j
      puts "USING J: Setting #{first.val} -> #{list_map[j].val}"
      first.next = list_map[j] #=> 1->4
      first = list_map[j]
      j -= 1
    else
      puts "USING I: Setting #{first.val} -> #{list_map[i].val}"
      first.next = list_map[i] #=> 4->2
      first = list_map[i]
      i += 1
    end
    use_j = !use_j # flip boolean
  end
  head
end


l1 = ListNode.new(1)
l2 = ListNode.new(2)
l3 = ListNode.new(3)
l4 = ListNode.new(4)
l1.next = l2
l2.next = l3
l3.next = l4
reorder_list(l1)

binding.pry


# list_map = {
#   0 => l1,
#   1 => l2,
#   2 => l3,
#   3 => l4
# }
# # l1->l4
# first = root #=> l4->l2
# i = 1
# j = list_map.length - 1
# use_j = true
# while (first != nil) do
#   if use_j
#     first.next = list_map[j]
#     first = list_map[j]
#   else
#     first.next = list_map[i]
#     first = list_map[i]
#   end
# end

# Given 1->2->3->4, reorder it to 1->4->2->3.

# Given 1->2->3->4->5, reorder it to 1->5->2->4->3.
