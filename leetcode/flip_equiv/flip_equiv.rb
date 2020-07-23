## This current solution raises a runtime error when a mismatch is found...

# NOTE: This may be a bit of a code smell... raising an error may consume more resources
# @Anand, would you consider this a code smell?

# Time Complexity: O(n+m)
# Space Complexity: O(n+n+m)
#                     n for the recursion stack
#                     n for the tree map
#                     m for the recursion stack

require 'set'

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end

def create_tree_map_helper(node,i,map)
  return nil if node == nil
  map[i] = Set.new if map[i] == nil
  map[i].add(node.val)
  create_tree_map_helper(node.left,i+1,map)
  create_tree_map_helper(node.right,i+1,map)
end

def create_tree_map(root)
  map = []
  create_tree_map_helper(root,0,map)
  return map
end

def check_flip_equiv_based_on_map_helper(node,i,tree_map)
  return nil if node == nil
  if tree_map[i]
    curr_set = tree_map[i]
  else
    ## This tree is deeper than the 1st tree
     # therefore, it would be great if we were able to raise an error to get out of delving deeper
     puts  "Tree is deeper than the other tree. Therefore, is not a flipped equivalent."
     raise "Tree is deeper than the other tree. Therefore, is not a flipped equivalent."
  end
  if curr_set.include?(node.val)
    puts "@#{i}... deleting #{node.val}"
    curr_set.delete(node.val)
  else
    # we've encountered something that should not be there...
    # terminate all processes
    puts "Tree is not a flipped equivalent."
    raise "Tree is not a flipped equivalent."
  end
  check_flip_equiv_based_on_map_helper(node.left,i+1,tree_map)
  check_flip_equiv_based_on_map_helper(node.right,i+1,tree_map)
end

def check_flip_equiv_based_on_map(root,tree_map)
  begin
    check_flip_equiv_based_on_map_helper(root,0,tree_map)
    result = true
    tree_map.each { |set| result = false if set.length > 0 }
    return result
  rescue => e
    p e.message
    puts "Encountered exception"
    return false
  end
end

# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {Boolean}
def flip_equiv(root1, root2)
  tree_map = create_tree_map(root1)
  return check_flip_equiv_based_on_map(root2,tree_map)
end


def t1
  n0 = TreeNode.new(1)
  n1 = TreeNode.new(2)
  n2 = TreeNode.new(3)
  n3 = TreeNode.new(4)
  n4 = TreeNode.new(5)
  n5 = TreeNode.new(6)
  n6 = TreeNode.new(7)
  n7 = TreeNode.new(8)
  n0.left = n1
  n0.right = n2
  n1.left = n3
  n1.right = n4
  n2.left = n5
  n4.left = n6
  n4.right = n7

  m0 = TreeNode.new(1)
  m1 = TreeNode.new(3)
  m2 = TreeNode.new(2)
  m3 = TreeNode.new(6)
  m4 = TreeNode.new(4)
  m5 = TreeNode.new(5)
  m6 = TreeNode.new(8)
  m7 = TreeNode.new(7)
  m0.left = m1
  m0.right = m2
  m1.right = m3
  m2.left = m4
  m2.right = m5
  m5.left = m6
  m5.right = m7

  p flip_equiv(n0,m0) == true
end

t1
