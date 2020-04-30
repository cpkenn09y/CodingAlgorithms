# binary tree with ints in the nodes (not bst, sparce or balanced, can have dupe values)
#
# serialize this tree to string (array), and read it back in it's exact structure
#
#    1
# 2     3
#         4
# class TreeNode
#
# [1 2 nil nil 3 nil 4 nil nil]
#
# end
#
# function(root)


class TreeNode

    attr_accessor :val, :left, :right

    def initialize(val)
        @val = val
        @left = nil
        @right = nil
    end
end

def serialize_tree(root)
    def helper(node,serialization=[])
        if node == nil
            serialization << nil
            puts "ADDED nil to #{serialization}"
            return serialization
        else
            serialization << node.val
            p serialization
        end
        helper(node.left, serialization)
        helper(node.right, serialization)
        return serialization
    end
    return helper(root)
end

n1 = TreeNode.new(1)
n2 = TreeNode.new(2)
n3 = TreeNode.new(3)
n4 = TreeNode.new(4)

n1.left = n2
n1.right = n3
n3.right = n4

p serialize_tree(n1) == [1, 2, nil, nil, 3, nil, 4, nil, nil]



