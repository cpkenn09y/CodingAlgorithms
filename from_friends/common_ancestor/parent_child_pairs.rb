<<-METRICS
  Start Time = 10:35pm
  Time Complexity  = O(n^2) where n is the number of touples in the parent_child_pairs Array.
                      In a worst case scenario, we create two Node objects for each touple and recursively call all children to update their ancestors.
  Space Complexity = O(n) where n is the number of touples in the parent_child_pairs Array.
                      We have to recursively invoke the tell_children! function on each child;
                      each of these recursive calls requires additional memory to maintain the stack.

  NOTE: Not quite sure... how to answer the time complexity...
METRICS

<<-LESSONS_LEARNED
  * I had initially used a String for @children, @parents, and @ancestors... my mistake was that I did not use a comma to separate values
     not having a comma led to '14' being treated as if it were a '1' and a '4'
  * I had missed that telling_children would have to be recursive...
LESSONS_LEARNED


require 'pry'

class Node

  @@nodes = {}

  attr_reader :val, :ancestors, :children

  def initialize(val)
    @val = val
    @parents = []
    @children = []
    @ancestors = []
    @@nodes[val] = self
  end

  def self.nodes
    @@nodes
  end

  def self.are_related?(n1, n2)
    have_common_ancestor = false
    # puts "about to compare #{n1.ancestors} .vs. #{n2.ancestors}"
    n1.ancestors.each do |val_1|
      n2.ancestors.each do |val_2|
        if val_1 == val_2
          return true
        end
      end
    end
    have_common_ancestor
  end

  def self.find(val)
    @@nodes[val]
  end

  def self.create_nodes!(parent_child_pairs)
    parent_child_pairs.each do |pair|
      parent_value, child_value = pair
      parent_node = Node.find(parent_value) || Node.new(parent_value)
      child_node = Node.find(child_value) || Node.new(child_value)
      parent_node.add_child!(child_node)
      child_node.add_parent!(parent_node)
    end
    # Node.nodes.each { |key,node| p [node.val, node.ancestors] }
  end

  def self.clear_nodes!
    @@nodes = {}
  end

  def add_parent!(node)
    @ancestors = (@ancestors + node.ancestors).push(node.val.to_s)
    @parents << node.val.to_s
    # puts "#{self.val}... adding parent #{node.val}"
    tell_children!
  end

  def tell_children!
    # puts "#{self.val} --> Gonna tell children #{@children}"
    @children.each do |val|
      child = @@nodes[val.to_i]
      child.append_to_ancestry!(self)
      # puts "child #{val} is gonna tell children! #{child.children}" # 9 should tell 11...
      child.tell_children!
    end
  end

  def add_child!(node)
    @children << node.val.to_s
  end

  def append_to_ancestry!(node)
    @ancestors = (@ancestors + node.ancestors).uniq
    # puts "appended to ancestors... #{self.val}->#{self.ancestors}"
  end

end

def hasCommonAncestor(parent_child_pairs, val_1, val_2)
  Node.create_nodes!(parent_child_pairs)
  result = Node.are_related?(Node.find(val_1), Node.find(val_2))
  Node.clear_nodes!
  result
end

parentChildPairs1 = [
  [1, 3], [2, 3], [3, 6], [5, 6], [5, 7], [4, 5],
  [4, 8], [4, 9], [9, 11], [14, 4], [13, 12], [12, 9]
]

p hasCommonAncestor(parentChildPairs1, 3, 8) == false
p hasCommonAncestor(parentChildPairs1, 5, 8) == true
p hasCommonAncestor(parentChildPairs1, 6, 8) == true
p hasCommonAncestor(parentChildPairs1, 6, 9) == true
p hasCommonAncestor(parentChildPairs1, 1, 3) == false
p hasCommonAncestor(parentChildPairs1, 3, 1) == false
p hasCommonAncestor(parentChildPairs1, 7, 11) == true
p hasCommonAncestor(parentChildPairs1, 6, 5) == true
p hasCommonAncestor(parentChildPairs1, 5, 6) == true

parentChildPairs2 = [
  [11, 10], [11, 12], [2, 3], [10, 2], [10, 5],
  [1, 3], [3, 4], [5, 6], [5, 7], [7, 8],
]
p hasCommonAncestor(parentChildPairs2, 4, 12) == true
p hasCommonAncestor(parentChildPairs2, 1, 6) == false
p hasCommonAncestor(parentChildPairs2, 1, 12) == false
