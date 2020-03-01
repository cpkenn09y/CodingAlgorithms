/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} root
 * @param {number} val
 * @return {TreeNode}
 */

function TreeNode(val) {
  this.val = val;
  this.left = this.right = null;
}

let searchBST = (root, val) => {
  // PSEUDOCODE for looking for 5
  //     4
  //    / \
  //   2   7
  //  / \
  // 1   3
  // * LOOK at root val of 4
  // * SINCE 4 < 5
  // * LOOK right of root
  // * LOOK AT NODE val of 7
  // * NOT FOUND...
  // * SINCE not found, attempt to look at children...
  // * IF CURRENT_VAL != val && NO CHILDREN... return NULL
  let helper = (node, val) => {
    let matchFound,hasChildren,nextNode
    matchFound = node.val == val
    if (node.left || node.right) {
      // ASSUMPTION: Balanced tree...
      hasChildren = true
    }
    else {
      hasChildren = false
    }
    // console.log(`Match found`, matchFound, `. Node ${node.val} has children`, hasChildren)
    if (!matchFound && (hasChildren == false)) {
      // BASECASE REACHED!
      console.log("BASECASE REACHED")
      return null
    }
    if (matchFound) {
      return node
    }
    else if (val > node.val) {
      nextNode = node.right
    }
    else {
      nextNode = node.left
    }
    return helper(nextNode, val)
  }
  return helper(root, val)
}

// BASECASE:
// let root = new TreeNode(4)
// console.log(searchBST(root, 5) === null)

// CHALLENGE QUESTION:
let root = new TreeNode(4)
let n1 = new TreeNode(2)
let n2 = new TreeNode(7)
let n3 = new TreeNode(1)
let n4 = new TreeNode(3)

root.left = n1
root.right = n2
n1.left = n3
n1.right = n4

console.log("Should return null when value of '5' is not found", searchBST(root, 5) === null)
console.log("Should return the TreeNode with value of 2", searchBST(root, 2).val === 2)
console.log("Should have a left node with val of 1", searchBST(root, 2).left.val === 1)
console.log("Should have a right node with val of 3", searchBST(root, 2).right.val === 3)
