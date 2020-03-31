<<-METRICS
  Time Complexity : O(n) where n is the number of TreeNodes.
                     The number of nodes directly determines the number of times we invoke the helper function.
  Space Complexity: O(n) where n is the number of TreeNodes.
                     For each node in the tree, we recurse over each child node.
                     Each recursive iteration requires additional memory to maintain the stack.

  Runtime: 48 ms, faster than 17.14% of Ruby online submissions for Closest Binary Search Tree Value.
  Memory Usage: 10.3 MB, less than 100.00% of Ruby online submissions for Closest Binary Search Tree Value.
METRICS

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @param {Float} target
# @return {Integer}
def closest_value(root, target)
  def helper(node,target,closest_val=nil,closest_distance=Float::INFINITY)
    if node == nil
      return { closest_val: closest_val, closest_distance: closest_distance }
    end
    distance = (node.val - target).abs
    if distance < closest_distance
      # puts "node #{node.val} is closer than #{closest_distance}"
      closest_val = node.val
      closest_distance = distance
    else
      # puts "node #{node.val} is NOT closer than #{closest_distance}"
    end
    left_result = helper(node.left,target,closest_val,closest_distance)
    right_result = helper(node.right,target,closest_val,closest_distance)
    if left_result[:closest_distance] == right_result[:closest_distance]
      return left_result
    elsif left_result[:closest_distance] < right_result[:closest_distance]
      return left_result
    else
      return right_result
    end
  end
  helper(root,target,nil,Float::INFINITY)[:closest_val]
end

def test_1
  n0 = TreeNode.new(4)
  n1 = TreeNode.new(2)
  n2 = TreeNode.new(5)
  n3 = TreeNode.new(1)
  n4 = TreeNode.new(3)

  n0.left = n1
  n0.right = n2
  n1.left = n3
  n1.right = n4

  closest_value(n0, 3.714286)
end

# p test_1 == 4

<<-PLAN
  # compare self to target
  # compare my left with target
  # compare my right with target
  # recurse all children to compare
  # return closest node's value
PLAN

<<-SANDBOX
  4 - 3.714286 = 0.29
SANDBOX

<<-TESTCASE
  Input: root = [4,2,5,1,3], target = 3.714286

      4
     / \
    2   5
   / \
  1   3

  Output: 4
TESTCASE

