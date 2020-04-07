class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @param {Integer} val
# @return {TreeNode}
def search_bst(root, val)
  def check_node(node, val)
    return nil if node == nil
    return node if node.val == val
    result = check_node(node.left, val)
    if result
      return result
    else
      return check_node(node.right, val)
    end
    return nil
  end
  return check_node(root,val)
end

