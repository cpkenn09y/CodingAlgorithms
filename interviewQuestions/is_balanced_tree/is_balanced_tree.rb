<<-METRICS
  SPACE COMPLEXITY  = O(n) where n is relative to the number of nodes
  TIME COMPLEXITY   = O(n)
  TIME SPENT CODING = 55 mins

  NOTE: Not sure why Time Complexity is O(n)... but my gut tells me it's O(n)
METRICS


class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end

  def has_both_children?
    (@left && @right) ? true : false
  end

  def is_single?
    (@left || @right) ? false : true
  end
end


# @param {TreeNode} root
# @return {Boolean}
def is_balanced_tree?(root)
  def get_balanced_depth(node, current_depth=1)
    if node.has_both_children?
      current_depth += 1
      return [get_balanced_depth(node.left, current_depth), get_balanced_depth(node.right, current_depth)].min
    else
      puts "Basecase reached! returning depth of #{current_depth}"
      return current_depth
    end
  end

  if root.is_single?
    puts "root is single!"
    return true
  end
  if root.has_both_children?
    left_balanced_depth = get_balanced_depth(root.left,1)
    right_balanced_depth = get_balanced_depth(root.right,1)
    puts "LEFT BALANCED DEPTH is #{left_balanced_depth}"
    puts "RIGHT BALANCED DEPTH is #{right_balanced_depth}"
    return left_balanced_depth == right_balanced_depth
  else
    return false
  end
end

<<-SCENARIO_1a
    2
SCENARIO_1a
def test_1a
  n1 = TreeNode.new(2)
  n1.is_single? == true
  is_balanced_tree?(n1) == true
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
  is_balanced_tree?(n1) == true
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
  is_balanced_tree?(n1) == false
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

  is_balanced_tree?(n1) == false
end

<<-TEST_4
      5
     / \
    1   4
   / \ / \
  7  8 3  6
TEST_4
def test_4
  n1 = TreeNode.new(5)
  n2 = TreeNode.new(1)
  n3 = TreeNode.new(4)
  n4 = TreeNode.new(7)
  n5 = TreeNode.new(8)
  n6 = TreeNode.new(3)
  n7 = TreeNode.new(6)

  n1.left = n2
  n1.right = n3
  n2.left = n4
  n2.right = n5
  n3.left = n6
  n3.right = n7

  is_balanced_tree?(n1) == true
end

p test_1a
p test_1b
p test_2
p test_3
p test_4
