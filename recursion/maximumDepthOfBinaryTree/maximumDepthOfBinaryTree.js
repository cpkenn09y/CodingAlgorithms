/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} root
 * @return {number}
 */

function TreeNode(val) {
  this.val = val
  this.left = this.right = null
}

TreeNode.prototype.hasChildren = function hasChildren() {
  if (this.left || this.right) {
    return true
  }
  else {
    return false
  }
}

let maxDepth = (root) => {
  let deepest = 1
  let helper = (currentNode, currentDepth) => {
    if (!currentNode.hasChildren()) {
      console.log(`BASECASE REACHED. node '${currentNode.val}' has no children.`, `currentDepth is ${currentDepth}`)
      if (currentDepth > deepest) {
        deepest = currentDepth
      }
      return deepest
    }
    else {
      console.log(`currentNode ${currentNode.val} has children. checking next`)
      helper(currentNode.right, currentDepth + 1)
      helper(currentNode.left, currentDepth + 1)
      return deepest
    }
  }
  return helper(root,1)
}

// :: PSEUDOCODE re BASECASE ::
//  * look at current node
//  * look at left
//  * ask left if it has children... since NO... the depth is 1
//  * ask right if it has children... since NO... the depth is 1

// :: BASECASE ::
let test1 = () => {
  let n1 = new TreeNode(20)
  console.log(maxDepth(n1) == 1)
}
test1()
// :: ANOTHER USECASE ::
//    a
//   /  \
//  b    c
let test2 = () => {
  let n1 = new TreeNode("a")
  let n2 = new TreeNode("b")
  let n3 = new TreeNode("c")
  n1.left = n2
  n1.right = n3
  console.log(maxDepth(n1) == 2)
}
test2()

// :: DESIRED USE CASE ::
//   3
//  / \
// 9  20
//   /  \
//  15   7
let test3 = () => {
  let n1 = new TreeNode(3)
  let n2 = new TreeNode(9)
  let n3 = new TreeNode(20)
  let n4 = new TreeNode(15)
  let n5 = new TreeNode(7)

  n1.left = n2
  n1.right = n3
  n3.left = n4
  n3.right = n5

  console.log(maxDepth(n1) == 3)
}
test3()
