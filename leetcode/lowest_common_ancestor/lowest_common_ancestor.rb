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
  def helper(current_node,current_path,a,b,results)
    current_node == nil ? printable_val = "nil" : printable_val = current_node.val
    puts "At current node #{printable_val}"
    if current_node == nil
      return nil
    end
    val = current_node.val
    current_path << val
    if val == a
      results[:a] = current_path.dup
      puts "YAY FOUND A... #{current_path}"
    elsif val == b
      results[:b] = current_path.dup
      puts "YAY FOUND B... #{current_path}"
    end
    if results[:a] && results[:b]
      return nil
    end
    helper(current_node.left, current_path, a, b, results)
    until current_path.last == current_node.val do
      popped_val = current_path.pop
      puts "POPPED out #{popped_val}"
    end
    helper(current_node.right, current_path, a, b, results)
  end

  results = {
    a: nil,
    b: nil
  }
  helper(root,[],a,b,results)
  if results[:a] && results[:b]
    p "results[:a] #{results[:a]}"
    p "results[:b] #{results[:b]}"
    intersection = results[:a] & results[:b]
    p "intersection #{intersection}"
    return intersection[-1]
  else
    puts "one or more not found"
    return nil
  end
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


#      3
#     /
#    5
#   / \
#  6   4

# results = {
#   a: [], # [3,5]
#   b: []  # [3,5,4]
# }

# intersection = results[:a] & results[:b]
# intersection.last

# p lowest_common_ancestor(n0, 5, 6) == 5
p lowest_common_ancestor(n0, 5, 4) == 5
# p lowest_common_ancestor(n0, 5, 1) == 3

