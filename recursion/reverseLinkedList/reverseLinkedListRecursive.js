let buildList = (node, currentList=[]) => {
  if (node == null) {
    return
  }
  currentList.push(node.val)
  buildList(node.next, currentList)
  return currentList
}

/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} head
 * @return {ListNode}
 */

function ListNode(val) {
  this.val = val;
  this.next = null;
}

let reverseList = (head) => {
  let newHead
  // 1->2->3->4->5->null
  // 5->4->3->2->1->NULL
  //             1->NULL
  //          2->1
  //       3->2
  //    4->3
  // 5->4
  // IF (node.originalNext == null), then we are DONE

  // BASE CASE: IF node's NEXT is null; then return
  // RECURSIVE RELATION:
  //   * gradually move to next node until there are no more nodes
  let helper = (currentNode, lastUsedNode=null, index=0) => {
    let originalNext
    if (currentNode === null) {
      // :: SOLVING FOR BASECASE ::
      // currentNode == 5
      // console.log("BASE CASE REACHED")
      newHead = currentNode
      return
    }
    if (index === 0) {
      // :: FIRST ITERATION ::
      currentNode // 1
      originalNext = currentNode.next // 2
      currentNode.next = null // 1->null
      // console.log(`${currentNode.val}->null`)
    }
    else {
      // :: 2nd ITERATION ::
      // 2->1
      lastUsedNode // 1
      currentNode // 2
      originalNext = currentNode.next // 3
      currentNode.next = lastUsedNode // 2->1
      // console.log(`${currentNode.val}->${currentNode.next.val}`)
    }
    helper(originalNext, currentNode, index+1)
  }
  helper(head)
  return newHead
}

// let l1 = new ListNode(1)
// let l2 = new ListNode(2)
// let l3 = new ListNode(3)
// let l4 = new ListNode(4)
// let l5 = new ListNode(5)

// l1.next = l2
// l2.next = l3
// l3.next = l4
// l4.next = l5

// console.log(buildList(l1))

// :: DESIRED OUTCOME ::
// INITIAL: 1->2->3->4->5->NULL
// RESULT : 5->4->3->2->1->NULL

// reverseList(l1)
// console.log(buildList(l5))
// console.log(buildList(l1.next) == null)
