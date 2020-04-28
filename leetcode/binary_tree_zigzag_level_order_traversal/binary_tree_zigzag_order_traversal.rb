<<-METRICS
  start @12:20pm
METRICS

<<-QUESTIONS
  Q: How to best construct the tree based on the array...?
QUESTIONS

require 'pry'

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end

  def self.assign_children!(node,children,index)
    node.left = children[0]
    node.right = children[1]
    # puts "Assigned #{node.val} left = #{node.left}. right = #{node.right}"
  end

  def self.connect_nodes!(nodes)
    root = nodes[0]
    root.left = nodes[1]
    root.right = nodes[2]
    assign_children!(root.left,nodes.slice(3, 2),1)
    assign_children!(root.right,nodes.slice(5, 2),2)
  end
end

def helper(node,zigzag_output,start_right=true)
  if node == nil
    return []
  end
  if start_right
    first = node.right
    last = node.left
  else
    first = node.left
    last = node.right
  end
  flipped_direction = !start_right
  r1 = helper(last,[],flipped_direction)
  r2 = helper(first,[],flipped_direction)
  # r1 = [] if r1.nil?
  # r1 = [] if r2.nil?
  zigzag_output << r1 + r2
  collection = []
  if first.nil?
    collection << nil
  else
    collection << first.val
  end
  if last.nil?
    collection << nil
  else
    collection << last.val
  end
  zigzag_output.unshift(collection)
end

# @param {TreeNode} root
# @return {Integer[][]}
def binary_tree_zigzag_order_traversal(node_vals)
  root = nil
  nodes = []
  node_vals.each_with_index do |val,i|
    if val != nil
      nodes << TreeNode.new(val)
    else
      nodes << nil
    end
  end
  TreeNode.connect_nodes!(nodes)
  root = nodes[0]
  return helper(root,[[root.val]])
end

# input = [3,9,20]
# answer = [
#   [3],
#   [20,9]
# ]
# p binary_tree_zigzag_order_traversal(input) == answer


# input = [3,9,20,1,2,15,7]
# answer = [
#   [3],
#   [20,9],
#   [1,2,15,7]
# ]
# p binary_tree_zigzag_order_traversal(input)# == answer


input = [3,9,20,nil,nil,15,7]
answer = [
  [3],
  [20,9],
  [15,7]
]
p binary_tree_zigzag_order_traversal(input)# == answer
