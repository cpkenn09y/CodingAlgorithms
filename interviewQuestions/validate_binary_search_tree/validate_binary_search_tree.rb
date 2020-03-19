<<-METRICS
  SPACE COMPLEXITY  = O(n) where n is relative to the number of nodes
  TIME COMPLEXITY   = O(n)
  TIME SPENT CODING = 55 mins

  NOTE: Not sure why Time Complexity is O(n)... but my gut tells me it's O(n)

  ASSUMPTION... a one node tree is considered valid... I think this may be an incorrect assumption.
METRICS


class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end

  def is_single?
    (@left || @right) ? false : true
  end

  def has_acceptable_children?
    if @left
      return false if !(@val > @left.val)
    end
    if @right
      return false if !(@val < @right.val)
    end
    return true
  end
end


# @param {TreeNode} root
# @return {Boolean}
# def is_valid_bst(root)
#   def helper(node)
#     if node == nil || node.is_single?
#       return true
#     end

#     if node.has_acceptable_children?
#       puts "Whoo hoo valid children... #{node.val}. Left #{node.left.val}. Right #{node.right.val}"
#       helper(node.left) && helper(node.right)
#     else
#       puts "Found a node with invalid children... #{node.val}. Left #{node.left.val}. Right #{node.right.val}"
#       return false
#     end
#   end

#   if root.is_single?
#     puts "root is single!"
#     return true
#   end
#   if root.has_acceptable_children?
#     return helper(root.left) && helper(root.right)
#   else
#     puts "root does not have acceptable children"
#     return false
#   end
# end

def is_valid_bst(root)
  def helper(node)
    if node == nil || node.is_single?
      return true
    end
    if node.has_acceptable_children?
      # puts "Whoo hoo valid children... #{node.val}. Left #{node.left && node.left.val}. Right #{node.right && node.right.val}"
      helper(node.left) && helper(node.right)
    else
      # puts "Found a node with invalid children... #{node.val}. Left #{node.left.val}. Right #{node.right.val}"
      return false
    end
  end
  if root == nil
    return false
  end
  helper(root)
end

<<-SCENARIO_1a
    2
SCENARIO_1a
def test_1a
  n1 = TreeNode.new(2)
  n1.is_single? == true
  is_valid_bst(n1) == true
end

<<-SCENARIO_1b
    2
   / \
  1   3

  check left if has child
  check right if has child
  @left_1, if has no children, then return balanced_depth of 1
  @right_3, if has no children then return balanced_depth of 1
  if the balanced depth is the same, then we're good
SCENARIO_1b
def test_1b
  n1 = TreeNode.new(2)
  n2 = TreeNode.new(1)
  n3 = TreeNode.new(3)

  n1.left = n2
  n1.right = n3
  is_valid_bst(n1) == true
end

<<-TEST_2
    5
   /
  1

TEST_2

def test_2
  n1 = TreeNode.new(5)
  n2 = TreeNode.new(1)

  n1.left = n2
  is_valid_bst(n1) == true
end




<<-TEST_3
    5
   / \
  1   4
     / \
    3   6
TEST_3
def test_3
  n1 = TreeNode.new(5)
  n2 = TreeNode.new(1)
  n3 = TreeNode.new(4)
  n4 = TreeNode.new(3)
  n5 = TreeNode.new(6)

  n1.left = n2
  n1.right = n3
  n3.left = n4
  n3.right = n5

  is_valid_bst(n1) == false
end

<<-TEST_4
  Scenario: Balanced search tree
      5
     / \
    3   8
   / \ / \
  1  4 7  9
TEST_4
def test_4
  n1 = TreeNode.new(5)
  n2 = TreeNode.new(3)
  n3 = TreeNode.new(8)
  n4 = TreeNode.new(1)
  n5 = TreeNode.new(4)
  n6 = TreeNode.new(7)
  n7 = TreeNode.new(9)

  n1.left = n2
  n1.right = n3
  n2.left = n4
  n2.right = n5
  n3.left = n6
  n3.right = n7

  is_valid_bst(n1) == true
end

<<-TEST_5
  Scenario: Balanced tree with one invalid number
      5
     /  \
    3    8
   / \  / \
  1  4 911 9
TEST_5
def test_5
  n1 = TreeNode.new(5)
  n2 = TreeNode.new(3)
  n3 = TreeNode.new(8)
  n4 = TreeNode.new(1)
  n5 = TreeNode.new(4)
  n6 = TreeNode.new(911)
  n7 = TreeNode.new(9)

  n1.left = n2
  n1.right = n3
  n2.left = n4
  n2.right = n5
  n3.left = n6
  n3.right = n7

  is_valid_bst(n1) == false
end

# MY TESTS
p test_1a
p test_1b
p test_2
p test_3
p test_4
p test_5

