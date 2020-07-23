<<-LESSONS
  1) This is a solution that does not raise errors in order to bubble up the recursion stack
  2) This solution uses an Array of Sets to keep track of seen values which it calls a 'tree_map'
  3) This solution bubbles up the mismatches by returning a false value...
      and when it reaches the end of a tree, it returns a true
      once all the values are returned up the stack, we know if our trees are flipped equivalents


  Time Complexity = O(n+m)
                      where n is the number of nodes in the 1st tree
                      where m is the number of nodes in the 1st tree
  Space Complexity = O(n+n+m)
                      where n is the number of nodes in the 1st tree
                      where m is the number of nodes in the 1st tree

                      * n for the recursion stack
                      * n for the tree_map
                      * m for the recursion stack
LESSONS

require 'set'
require 'pry'
require 'colorize'

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
  return true if node == nil
  if tree_map[i]
    curr_set = tree_map[i]
  else
    ## This tree is deeper than the 1st tree
     # therefore, it would be great if we were able to raise an error to get out of delving deeper
     puts  "Tree is deeper than the other tree. Therefore, is not a flipped equivalent."
     return false
  end
  if curr_set.include?(node.val)
    puts "@#{i}... deleting #{node.val}"
    curr_set.delete(node.val)
  else
    # we've encountered something that should not be there...
    # terminate all processes
    puts "Tree is not a flipped equivalent. Node #{node.val} does not match."
    return false
  end
  l = check_flip_equiv_based_on_map_helper(node.left,i+1,tree_map)
  r = check_flip_equiv_based_on_map_helper(node.right,i+1,tree_map)
  puts "RESULT OF LEVEL #{i} is #{l && r}"
  return l && r
end

def check_flip_equiv_based_on_map(root,tree_map)
  if check_flip_equiv_based_on_map_helper(root,0,tree_map)
    result = true
    # tree_map.each { |set| result = false if set.length > 0 }
    tree_map.each_with_index do |set,i|
      if set.length > 0
        result = false
        puts "MISMATCH... at level #{i}, the set still contains elements #{set}"
      end
    end
    return result
  else
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

# :: t1 ::
#  * should return true when the trees are flipped equivalents
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

# :: t2 ::
#  * should return false when the 9 in the second tree does not exist in the first tree
def t2
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
  m7 = TreeNode.new(9)
  m0.left = m1
  m0.right = m2
  m1.right = m3
  m2.left = m4
  m2.right = m5
  m5.left = m6
  m5.right = m7

  p flip_equiv(n0,m0) == false
end

# :: t3 ::
#  * should return false when the second tree is deeper than the first tree
def t3
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
  m8 = TreeNode.new(9)
  m0.left = m1
  m0.right = m2
  m1.right = m3
  m2.left = m4
  m2.right = m5
  m5.left = m6
  m5.right = m7
  m7.left = m8

  p flip_equiv(n0,m0) == false
end

# :: t4 ::
#  * should return false when the second tree is a smaller subset of the first tree
def t4
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
  m0.left = m1
  m0.right = m2
  m1.right = m3
  m2.left = m4
  m2.right = m5

  p flip_equiv(n0,m0) == false
end

def run_tests
  results = []
  results << t1
  results << t2
  results << t3
  results << t4
  if results.uniq == [true]
    puts "YAY! ALL TESTS PASS!".green
  else
    puts "Some tests fail...".red
  end
end
run_tests
