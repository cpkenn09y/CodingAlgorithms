require 'pry'
# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end
# @param {TreeNode} root
# @return {Integer}
def has_higher_mid?(values)
  return values[:mid] > values[:btm]
end

def rob(root)
  def helper(node, mid: 0, btm: 0, prev_max: 0, current_max: 0)
    return { mid: 0, btm: 0, prev_max: 0, current_max: 0 } if node == nil
    lt = helper(node.left)
    rt = helper(node.right)
    btm_sum = lt[:mid] + rt[:mid]
    binding.pry
    prev_max = [lt[:prev_max], rt[:prev_max], btm_sum].max # see prev_max when at 1
    puts [node.val, lt, rt, [lt[:prev_max], rt[:prev_max], btm_sum]] # THEN DETERMINE current_max
    current_max = [
      lt[:current_max] + rt[:current_max],
      node.val + lt[:btm] + rt[:btm],
      prev_max + node.val
    ].max
    puts "MID #{node.val}. LEFT #{lt[:mid]}. RIGHT #{rt[:mid]}. CURRENT MAX = #{current_max}"
    # binding.pry
    return { mid: node.val, btm: btm_sum, prev_max: prev_max, current_max: current_max }
  end
  result = helper(root)
  return result[:current_max]
end

<<-TREE
   2
  / \
nil  3
TREE
def test1
  n0 = TreeNode.new(2)
  n1 = TreeNode.new(3)
  n0.right = n1
  p rob(n0) == 3
end
# test1

<<-TREE
   5
  /
 7
  \
   3
TREE
def test2
  n0 = TreeNode.new(5)
  n1 = TreeNode.new(7)
  n2 = TreeNode.new(3)
  n0.left = n1
  n1.right = n2
  p rob(n0) == 8
end
# test2

<<-TREE
   2
    \
     3
TREE
def test3
  n0 = TreeNode.new(2)
  n1 = TreeNode.new(3)
  n0.right = n1
  p rob(n0) == 3
end
# test3

<<-TREE
   3
  / \
 2   3
  \   \
  3    1
TREE
def test4
  n0 = TreeNode.new(5)
  n1 = TreeNode.new(2)
  n2 = TreeNode.new(3)
  n3 = TreeNode.new(4)
  n4 = TreeNode.new(1)
  n0.left = n1
  n0.right = n2
  n1.right = n3
  n2.right = n4
  p rob(n0) == 10
end
# test4


<<-TREE
      8
    /   \
   27    3
  / \   / \
 1  7   5  2
TREE
def test5
  n0 = TreeNode.new(8)
  n1 = TreeNode.new(27)
  n2 = TreeNode.new(3)
  n3 = TreeNode.new(1)
  n4 = TreeNode.new(7)
  n5 = TreeNode.new(5)
  n6 = TreeNode.new(2)
  n0.left = n1
  n0.right = n2
  n1.left = n3
  n1.right = n4
  n2.left = n5
  n2.right = n6
  p rob(n0) == 34
end
# test5

<<-TREE
      3
    /   \
   4     5
  / \     \
 1   3     2
TREE
def test6
  n0 = TreeNode.new(3)
  n1 = TreeNode.new(4)
  n2 = TreeNode.new(5)
  n3 = TreeNode.new(1)
  n4 = TreeNode.new(3)
  n5 = TreeNode.new(2)
  n0.left = n1
  n0.right = n2
  n1.left = n3
  n1.right = n4
  n2.right = n5
  p rob(n0) == 9
end
# test6

<<-TREE
      4
     /
    1
   /
  2
 /
3
TREE
def test7
  n0 = TreeNode.new(4)
  n1 = TreeNode.new(1)
  n2 = TreeNode.new(2)
  n3 = TreeNode.new(3)
  n0.left = n1
  n1.left = n2
  n2.left = n3
  p rob(n0) == 7
end
test7

# FULL SUITE
# test1
# test2
# test3
# test4
# test5
# test6
