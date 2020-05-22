# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end
# @param {TreeNode} root
# @return {Integer}
def rob(root)
  def helper(node, sum_main: 0, sum_alt: 0)
    # check left
    # check right
    # compare left + right .vs. mid
    return { sum_main: 0, sum_alt: 0, selected_mid: true } if node == nil
    lt = helper(node.left)
    rt = helper(node.right)
    puts "MID #{node.val}. LEFT #{lt[:sum_main]}. RIGHT #{rt[:sum_main]}"
    btm_sum = lt[:sum_main] + rt[:sum_main]
    # TODO: Make use of sum_alt for when we change a decision
    # TODO: Make use of `selected_mid`
    if node.val > btm_sum
      selected_mid = true
      sum_main += node.val
    else
      selected_mid = false
      sum_alt += btm_sum
    end
    return { sum_main: sum_main, sum_alt: sum_alt, selected_mid: selected_mid}
  end
  result = helper(root)
  if result[:selected_mid]
    return result[:sum_main]
  else
    return result[:sum_alt]
  end
end

<<-TREE
   2
  / \
nil  3
TREE
def test1
  n0 = TreeNode.new(2)
  n1 = TreeNode.new(3)
  n0.right = n1
  p rob(n0) == 3
end
test1

def test2
  n0 = TreeNode.new(5)
  n1 = TreeNode.new(7)
  n2 = TreeNode.new(3)
  n0.left = n1
  n1.right = n2
  p rob(n0) == 8
end
# test2
