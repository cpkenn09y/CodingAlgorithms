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
    @max_depth = 0
    @lca = nil
    @lca_depth = 1
  end

  def get_lca
    return @lca if @lca
    depth_map = {}
    lca_deepest_leaves_helper(@root,depth_map)
    # {1=>1, 2=>2, 3=>2}
    p depth_map
    return @lca
  end

  private
  def lca_deepest_leaves_helper(node,depth_map,current_depth=1)
    return nil if node == nil
    set_depth(depth_map, current_depth)
    lca_deepest_leaves_helper(node.left, depth_map, current_depth+1)
    lca_deepest_leaves_helper(node.right, depth_map, current_depth+1)
    if @max_depth < current_depth
      puts "NEW LCA --> #{node.val}. Max Depth --> #{current_depth}"
      @max_depth = current_depth
      # @lca = node
    end
    if current_depth == 1 && (current_depth == @max_depth) && @lca_depth > current_depth
      # At the lca node which is a leaf node
      puts "LCA Node #{node.val} is a leaf"
      @lca = node
      @lca_depth = current_depth
    elsif current_depth > 1 && (current_depth == (@max_depth - 1)) && @lca_depth > current_depth
      # At the lca node which has multiple leaf-children
      puts "LCA Node #{node.val} has multiple leaf-children"
      @lca = node
      @lca_depth = current_depth
    end
    # {1=>1, 2=>2, 3=>2}
  end

  def set_depth(depth_map,current_depth)
    p "In set depth #{depth_map}"
    if depth_map[current_depth]
      depth_map[current_depth] += 1
    else
      depth_map[current_depth] = 1
    end
  end

end

# @param {TreeNode} root
# @return {TreeNode}
def lca_deepest_leaves(root)
  app = App.new(root)
  app.get_lca
end

module TestSuite

  class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
      @val = val
      @left = left
      @right = right
    end
  end

  def self.t1
    n1 = TreeNode.new(1)
    n2 = TreeNode.new(2)
    n3 = TreeNode.new(3)
    n1.left = n2
    n1.right = n3
    ans = lca_deepest_leaves(n1)
    ans.val == 1
    ans.left.val == 2
    ans.right.val == 3
  end

  def self.t2
    n1 = TreeNode.new(1)
    n2 = TreeNode.new(2)
    n3 = TreeNode.new(3)
    n4 = TreeNode.new(4)
    n1.left = n2
    n1.right = n3
    n2.left = n4
    ans = lca_deepest_leaves(n1)
    ans.val == 4
  end

  def self.t3
    n1 = TreeNode.new(1)
    n2 = TreeNode.new(2)
    n3 = TreeNode.new(3)
    n4 = TreeNode.new(4)
    n5 = TreeNode.new(5)
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    ans = lca_deepest_leaves(n1)
    p ":: ANSWER ::"
    p ans
    # p ans.val == 2
    # p ans.left.val == 4
    # p ans.right.val == 5
  end

  def self.run_all_tests
    # t1,
    # t2,
    t3
  end

end

TestSuite.run_all_tests
