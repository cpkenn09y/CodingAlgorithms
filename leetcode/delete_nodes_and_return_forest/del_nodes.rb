# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end

class App

  def initialize(root)
    @root = root
  end

  def build_delete_hash(to_delete)
    delete_hash = {}
    to_delete.each do |val|
      delete_hash[val] = true
    end
    return delete_hash
  end

  def del_nodes_helper(node,delete_hash,roots)
    return nil if node == nil
    del_nodes_helper(node.left,delete_hash,roots)
    del_nodes_helper(node.right,delete_hash,roots)
    if delete_hash[node.val]
      # specify your children as roots
      roots << node.left if node.left
      roots << node.right if node.right
    end
    return roots
  end

  def delete_nodes(to_delete)
    delete_hash = build_delete_hash(to_delete)
    roots = del_nodes_helper(@root,delete_hash,[@root])
    return roots
  end

end



# @param {TreeNode} root
# @param {Integer[]} to_delete
# @return {TreeNode[]}
def del_nodes(root, to_delete)
  # turn the array of values to delete into a hash for O(1) lookup time
  app = App.new(root)
  return app.delete_nodes(to_delete)
end

n1 = TreeNode.new(1)
n2 = TreeNode.new(2)
n3 = TreeNode.new(3)
n4 = TreeNode.new(4)
n5 = TreeNode.new(5)
n6 = TreeNode.new(6)
n7 = TreeNode.new(7)

n1.left  = n2
n1.right = n3
n2.left  = n4
n2.right = n5
n3.left  = n6
n3.right = n7

result =  del_nodes(n1,[3,5])
p result.length == 3
p result[0].val == 1
p result[1].val == 6
p result[2].val == 7
