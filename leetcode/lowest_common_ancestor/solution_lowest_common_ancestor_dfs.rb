# Clarifying Question: What should return if we do not find it? nil?

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, a, b)
  @answer = nil
  @a = a
  @b = b
  def recurse_tree(current_node)
    if current_node == nil
      return false
    end
    puts "At node #{current_node.val}"
    left = recurse_tree(current_node.left)
    right = recurse_tree(current_node.right)
    mid = (current_node.val == @a) || (current_node.val == @b)
    counter = 0
    [mid,left,right].each do |val|
      counter += 1 if val == true
    end
    if counter >= 2
      puts "Setting answer to #{current_node.val}"
      @answer = current_node
    end
    result = mid || left || right
    # puts "#{current_node.val}'s result is #{result}"
    return result
  end
  recurse_tree(root)
  return @answer
end

n0 = TreeNode.new(3)
n1 = TreeNode.new(5)
n2 = TreeNode.new(1)
n3 = TreeNode.new(6)
n4 = TreeNode.new(2)
n5 = TreeNode.new(0)
n6 = TreeNode.new(8)
n7 = TreeNode.new(7)
n8 = TreeNode.new(4)

n0.left = n1
n0.right = n2
n1.left = n3
n1.right = n4
n2.left = n5
n2.right = n6
n4.left = n7
n4.left = n8

p lowest_common_ancestor(n0, 5, 6).val == 5
p lowest_common_ancestor(n0, 5, 4).val == 5
p lowest_common_ancestor(n0, 5, 1).val == 3

