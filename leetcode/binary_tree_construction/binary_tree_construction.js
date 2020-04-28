var buildTree = function(preorder, inorder) {
  let inOrderMap = {}
  for (let i=0; i < inorder.length; i++) {
    inOrderMap[inorder[i]] = i
  }
  let root = constructTree(0, inorder.length-1, preorder, [0], inOrderMap)
  return root
};
const constructTree = (start, end, preorder, preOrderIndex, inOrderMap) => {
  if (start > end) return null
  const root = new TreeNode(preorder[preOrderIndex[0]++])
  const index = inOrderMap[root.val]
  // Construct left sub tree
  root.left = constructTree(start, index-1, preorder, preOrderIndex, inOrderMap)
  // Construct right sub tree
  root.right = constructTree(index+1, end, preorder, preOrderIndex, inOrderMap)
  return root
}
let preorder, inorder
preorder = [ 1, 2, 4, 3, 5, 7, 8, 6 ]
inorder = [ 4, 2, 1, 7, 5, 8, 3, 6 ]
console.log(buildTree(preorder, inorder))
