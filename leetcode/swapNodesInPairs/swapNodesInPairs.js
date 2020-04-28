// :: PRINTING HELPERS ::
let buildList = (node, currentList=[]) => {
  if (node == null) {
    currentList.push(null)
    return
  }
  currentList.push(node.val)
  buildList(node.next, currentList)
  return currentList
}

// LIST NODE DEFINITION
function ListNode(val) {
  this.val = val
  this.next = null
}

// BASECASE:
// BEFORE: 1->2->null
// AFTER : 2->1->null

let swapPairs = (head) => {

  let helper = (node,upstreamNode=null,index=0) => {
    // PSEUDOCODE
    // ORIG: 1->2->3->4->null
    //   head = 1
    //   tail = 4
    // EXPECTION:
    // 2->1->3->4->null
    // 2->1->4->3->null
    //       4->3
    //          3->null


    let downstream,twoDownstream
    if (index === 0) {
      // BEFORE: 1->3->4->null
      // GOAL  : 1->4->3->null
      downstream = node.next
      twoDownstream = downstream.next
      downstream.next = node // SWAP NODES
      console.log(`${downstream.val}->${node.val}`)
      if (upstreamNode) {
        // RECONNECT NODES WHEN THERE IS ONE UPSTEAM...
        upstreamNode.next = downstream
      }
      if (twoDownstream) {
        node.next = downstream.next //
        helper(twoDownstream, node)
      }
      else {
        // BASECASE
        // eg. 1->null
        console.log("BASECASE REACHED")
        node.next = null // 3->null
        return
      }
      // 2->1->3
    }
  }
  helper(head)
}


console.log(":: SOLVING FOR BASECASE ::")
// let l1 = new ListNode(1)
// let l2 = new ListNode(2)
// l1.next = l2
// swapPairs(l1)
// console.log("Should result in 2->1->null", JSON.stringify(buildList(l2)) == JSON.stringify([2,1,null]))

console.log(":: CONTEXT FINAL SOLUTION ::")
let l1 = new ListNode(1)
let l2 = new ListNode(2)
let l3 = new ListNode(3)
let l4 = new ListNode(4)


l1.next = l2
l2.next = l3
l3.next = l4

swapPairs(l1)

let result = buildList(l2)
console.log(result)
console.log("Should result in 2->1->4->3->null", JSON.stringify(result)== JSON.stringify([2,1,4,3,null]))

