/**
 * Initialize your data structure here.
 */
var MyLinkedList = function(options={}) {
  let optionsPlusDefaults = Object.assign({
    value: null,
    next: null,
    previous: null
  }, options)
  this.value = optionsPlusDefaults.value
  this.next = optionsPlusDefaults.next
  this.previous = optionsPlusDefaults.previous
};

/**
 * Get the value of the index-th node in the linked list. If the index is invalid, return -1.
 * @param {number} index
 * @return {number}
 */
MyLinkedList.prototype.get = function(index) {
  return this.getNode.call(this, index).value
};

/**
 * Get the value of the index-th node in the linked list. If the index is invalid, return -1.
 * @param {number} index
 * @return {MyLinkedList}
 */
MyLinkedList.prototype.getNode = function(index) {
  if (index == 0) {
    return this
  }
  let currentNode = this
  for (let i=0;i<index;i++) {
    currentNode = currentNode.next
  }
  return currentNode
};

/**
 * Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
 * @param {number} val
 * @return {void}
 */
MyLinkedList.prototype.addAtHead = function(val) {
  console.log(this.isHead.call(this))
  if (!this.value) {
    this.value = val
  }
  else {
    if (this.isHead.call(this)) {
      // since our current Node is already the Head,
      //  create a new Head
      //  set 1->2
      let newNode = new MyLinkedList({value: val, next: this}) // 1->2
      this.previous = newNode // 1<-2
      return newNode
    }
  }
  return this
};

/**
 * Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
 * @param {number} val
 * @return {void}
 */
MyLinkedList.prototype.isHead = function() {
  return this.previous == null
}

/**
 * Append a node of value val to the last element of the linked list.
 * @param {number} val
 * @return {void}
 */
MyLinkedList.prototype.addAtTail = function(val) {
  this.next = new MyLinkedList({
    value: val,
    previous: this
  })
};

/**
 * Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted.
 * @param {number} index
 * @param {number} val
 * @return {void}
 */
MyLinkedList.prototype.addAtIndex = function(index, val) {
  let previousNode = this
  let newNode = new MyLinkedList({value: val})
  let nextNode = this.next
  // TODO: Improve the conditional that determines if squeezing between two nodes is necessary based on indexes
  MyLinkedList.prototype.squeezeBetweenTwoNodes(previousNode, newNode, nextNode)
  console.log(`Result: ${this.value} -> ${this.next.value} -> ${this.next.next.value}`)
};

/**
 * Squeeze between two nodes
 * @param {MyLinkedList} previous
 * @param {MyLinkedList} current
 * @param {MyLinkedList} next
 */
MyLinkedList.prototype.squeezeBetweenTwoNodes = (previousNode, newNode, nextNode) => {
  if (nextNode) {
    newNode.next = nextNode // 2->3
    nextNode.previous = newNode //2<-3
  }
  newNode.previous = previousNode // 1<-2
  previousNode.next = newNode // 1->2
}

/**
 * Delete the index-th node in the linked list, if the index is valid.
 * @param {number} index
 * @return {void}
 */
MyLinkedList.prototype.deleteAtIndex = function(index) {
  let targetNode;
  let previousNode;
  let nextNode;
  targetNode = this.getNode(index)
  if (targetNode) {
    previousNode = targetNode.previous
    nextNode = targetNode.next
    previousNode.next = nextNode
    nextNode.previous = previousNode
  }
};

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * var obj = new MyLinkedList()
 * var param_1 = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index,val)
 * obj.deleteAtIndex(index)
 */

let linkedList = new MyLinkedList(); // Initialize empty LinkedList
linkedList.addAtHead(1)
console.log(":: CONTEXT: #addAtHead ::", linkedList.get(0))
console.log("should properly set 0th node", linkedList.get(0) === 1)
linkedList.addAtTail(3);
console.log(":: CONTEXT: #addAtTail ::")
console.log("linkedList#addAtTail should properly set next", linkedList.next.value === 3)
linkedList.addAtIndex(1, 2);  // linked list becomes 1->2->3
console.log("linkedList 0th index should equal 1", linkedList.get(0) === 1)
console.log("linkedList 1st index should equal 2", linkedList.get(1) === 2)
console.log("linkedList 2nd index should equal 1", linkedList.get(2) === 3)
linkedList.deleteAtIndex(1);  // now the linked list is 1->3
console.log("linkedList 0th index should equal 1", linkedList.get(0) === 1)
console.log("linkedList 1st index should equal 3", linkedList.get(1) === 3)

console.log(":: CONTEXT on an existing Head ::")
let linkedList2 = new MyLinkedList(); // Initialize empty LinkedList
linkedList2.addAtHead(2)
let newHead = linkedList2.addAtHead(1)
console.log("newHead 0th index should equal 1", newHead.get(0) === 1)
console.log("newHead 1st index should equal 2", newHead.get(1) === 2)
