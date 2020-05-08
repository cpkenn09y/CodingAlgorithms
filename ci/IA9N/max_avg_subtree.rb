<<-DESCRIPTION
    Description
    Given a binary tree, find the subtree with maximum average. Return the root of the subtree.
    Example
    Given a binary tree:
        1
      /   \
    -5     11
    / \   /  \
   0   2 4   -2
    return the node 11.
DESCRIPTION

class TreeNode

  attr_accessor :val, :left, :right
  def initialize(val)
      @val = val
      @left = nil
      @right = nil
  end

end

def find_subtree_with_max_average(root)
  @max_tree_node = nil
  @max_avg = -Float::INFINITY
  def helper(node)
    return { sum: 0, number_of_elements: 0} if node == nil
    left_result = helper(node.left)
    right_result = helper(node.right)
    sum = left_result[:sum] + right_result[:sum] + node.val
    number_of_elements = left_result[:number_of_elements] + right_result[:number_of_elements] + 1
    average = sum / number_of_elements.to_f
    if average > @max_avg
      @max_avg = average
      @max_tree_node = node
    end
    puts "#{node.val} -> #{{ sum: sum, number_of_elements: number_of_elements}}... AVG #{average}"
    return { sum: sum, number_of_elements: number_of_elements}
  end
  helper(root)
  return @max_tree_node
end

# n0 = TreeNode.new(-5)
# n1 = TreeNode.new(0)
# n2 = TreeNode.new(2)
# n0.left = n1
# n0.right = n2

# p find_subtree_with_max_average(n0) == n2


n0 = TreeNode.new(1)
n1 = TreeNode.new(-5)
n2 = TreeNode.new(11)
n3 = TreeNode.new(0)
n4 = TreeNode.new(2)
n5 = TreeNode.new(4)
n6 = TreeNode.new(-2)
n0.left = n1
n0.right = n2
n1.left = n3
n1.right = n4
n2.left = n5
n2.right = n6

p find_subtree_with_max_average(n0) == n2





<<-DETAILS
    # avg(0) = 0 / 1 = 0.0
    # avg(-5) = (-5 + 0 + 2)/ 3 = -1.0
    # avg(1) = (1 + (-5 + 0 + 2) + (11 + 4 + (-2))) / 7 =

    value_to_node = {
        0 => <Node>,
        11 => <Node>
    }
    average_at_given_point = {
        0 => 0.0,
        -5 => -1.0,
        11 => 13/3
    }
DETAILS
