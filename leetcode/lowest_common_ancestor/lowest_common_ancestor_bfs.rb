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

def add_to_child_to_ancestry(ancestry, parent, child)
  if child
    ancestry[child.val] = ancestry[parent.val].dup.push(child.val)
  end
end

def lowest_common_ancestor(root, a, b)
  def build_ancestry(a,b,queue,ancestry={},a_found=false,b_found=false)
    return if queue.empty?
    node = queue.shift
    return if node == nil
    if node.val == a
      # puts "FOUND a #{a}"
      a_found = true
    elsif node.val == b
      # puts "FOUND b #{b}"
      b_found = true
    end
    return if a_found && b_found
    unless ancestry[node.val]
      ancestry[node.val] = [node.val]
    end
    add_to_child_to_ancestry(ancestry, node, node.left)
    add_to_child_to_ancestry(ancestry, node, node.right)
    queue << node.left
    queue << node.right
    node.left ? l_val = node.left.val : l_val = "nil"
    node.right ? r_val = node.right.val : r_val = "nil"
    # puts "Ancestry #{ancestry}"
    # puts "Added #{l_val} and #{r_val} to queue"
    build_ancestry(a,b,queue,ancestry,a_found,b_found)
    return ancestry
  end
  # puts "Added #{root.val} to queue"
  computed_ancestry = build_ancestry(a,b,[root])
  return (computed_ancestry[a] & computed_ancestry[b])[-1]
end


#      3
#    /   \
#   5     1
#  / \   / \
# 6   2 0   8
#    / \
#   7   4

# queue = [root]
# ancestry = {
#   3: [3],
#   5: [3,5],
#   1: [3,1],
#   6: [3,5,6],
#   2: [3,5,2]
# }
# (ancestry[a] & ancestry[b])[-1]

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

# p lowest_common_ancestor(n0, 6, 2) == 5
# p lowest_common_ancestor(n0, 5, 6) == 5
# p lowest_common_ancestor(n0, 5, 4) == 5
p lowest_common_ancestor(n0, 5, 1) == 3
# p lowest_common_ancestor(n0, 6, 8) == 3


