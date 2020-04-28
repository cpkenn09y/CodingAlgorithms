# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  i = preorder.length - 1
  seq = 0
  rt = nil
  left = nil
  parent = nil
  root = TreeNode.new(preorder[0])
  while i > 0 do
    case seq
    when 0
      rt = TreeNode.new(preorder[i])
    when 1
      left = TreeNode.new(preorder[i])
    when 2
      parent = TreeNode.new(preorder[i])
      parent.right = rt
      parent.left = left
      if root.right.nil?
        # TODO: Need to handle larger trees...
        root.right = parent
      else
        root.left = parent
      end
      seq = 0
    else
      raise "Invalid seq #{seq}"
    end
    seq += 1
    i -= 1
  end
  return root
end

r = build_tree([1,2,4,5,3,6,7],nil)
p r.val
p r.left.val
p r.right.val

