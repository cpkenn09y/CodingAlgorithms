# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

class App

  attr_reader :head

  def initialize(head)
    @head = head
  end

  def sort_helper(node,prev=nil,i=0,is_sorted=true)
    # INITIAL: 4-2-1-3-nil
    # CURRENT: 2-4-1
    #            1-4-3
    #              3-4-nil
    #                4-nil
    # EXPECTION: 2-1-3-4-nil
    return is_sorted if node.next == nil
    if node.val > node.next.val
      # means we are in an incorrect order
      future = node.next.next
      sm = node.next
      lg = node
      is_sorted = false
      # REORDER them
      sm.next = lg # 2->4
      lg.next = future # 4->1
      prev.next = sm if prev != nil
      puts "ADJUSTED ORDER TO #{sm.val}->#{lg.val}"
    else
      future = node.next.next
      sm = node
      lg = node.next
      puts "Already in proper order #{sm.val}->#{lg.val}"
    end
    @head = sm if i == 0
    return sort_helper(lg,sm,i+1,is_sorted)
  end

  def sort!
    return nil if @head == nil
    if sort_helper(@head)
      return @head
    else
      print_list
      puts "INVOKE SORTING AGAIN"
      sort!
    end
  end

  def print_list_helper(node,ll_vals=[])
    return ll_vals if node == nil
    ll_vals << node.val.to_s
    return print_list_helper(node.next,ll_vals)
  end

  def print_list
    puts "CURRENT LIST ORDER: #{print_list_helper(@head).join("->")}"
  end

end

# @param {ListNode} head
# @return {ListNode}
def sort_list(head)
  app = App.new(head)
  puts ":: INITIAL ORDER ::"
  app.print_list
  app.sort!
  puts ":: FINAL ORDER ::"
  app.print_list
end

def t1
  l0 = ListNode.new(4)
  l1 = ListNode.new(2)
  l2 = ListNode.new(1)
  l3 = ListNode.new(3)
  l0.next = l1
  l1.next = l2
  l2.next = l3
  sort_list(l0)
end

def run_tests
  t1
end

run_tests

