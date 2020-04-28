// This is a reference solution
// * they create a Node constructor to help with the solution

class Node{
    constructor(val){
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/**
 * Initialize your data structure here.
 */
var MyLinkedList = function() {

    this.head = null;
    this.tail = null;
    this.size = 0;

};

/**
 * Get the value of the index-th node in the linked list. If the index is invalid, return -1.
 * @param {number} index
 * @return {number}
 */
MyLinkedList.prototype.get = function(index) {

    if(index < 0 || index >= this.size)
        return -1;

    let count, current;

    if(index <= this.size/2)
        {
            count = 0;
            current = this.head;

            while(count !== index)
                {
                    current = current.next;
                    count++;
                }
        }
    else
        {
            count = this.size - 1;
            current = this.tail;

            while(count !== index)
                {
                    current = current.prev;
                    count--;
                }
        }
    return current.val;
};

/**
 * Gets the index node in the linked list. If the index is invalid, return -1.
 * @param {number} index
 * @return {number}
 */
MyLinkedList.prototype.getIndex = function(index) {

    if(index < 0 || index >= this.size)
        return -1;

    let count, current;

    if(index <= this.size/2)
        {
            count = 0;
            current = this.head;

            while(count !== index)
                {
                    current = current.next;
                    count++;
                }
        }
    else
        {
            count = this.size - 1;
            current = this.tail;

            while(count !== index)
                {
                    current = current.prev;
                    count--;
                }
        }
    return current;
};

/**
 * Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
 * @param {number} val
 * @return {void}
 */
MyLinkedList.prototype.addAtHead = function(val) {

    //console.log("addAtHead call");

   const newNode = new Node(val);
    if(this.size === 0)
        {
            this.head = newNode;
            this.tail = newNode;

        }
    else
        {
            this.head.prev = newNode;
            newNode.next = this.head;
            this.head = newNode;
        }

    this.size++;

    return this;
};


MyLinkedList.prototype.removeAtHead = function( ){
   // console.log("removeAtHead call");

    if(this.size === 0)
        return -1;

    let oldHead = this.head;

    if(this.size === 1)
        {
            this.head = null;
            this.tail = null;

        }
    else
        {
            this.head = oldHead.next;
            this.head.prev = null;
            oldHead.next = null;

        }
    this.size--;
    return;
};

/**
 * Append a node of value val to the last element of the linked list.
 * @param {number} val
 * @return {void}
 */
MyLinkedList.prototype.addAtTail = function(val) {
   // console.log("addAtTail call");

  const newNode = new Node(val);

    if(this.head === null)
        {
            this.head = newNode;
            this.tail = newNode;
        }
    else
        {
            this.tail.next = newNode;
            newNode.prev = this.tail;
            this.tail = newNode;
        }

    this.size++;
    return this;
};


MyLinkedList.prototype.removeAtTail = function(){

    if(!this.head)
        return -1;

    let poppedNode = this.tail;

    if(this.head === 1)
        {
            this.head = null;
            this.tail = null;
        }
    else
        {
            this.tail = poppedNode.prev;
            this.tail.next = null;

        }
    this.size--;
    return;
};

/**
 * Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted.
 * @param {number} index
 * @param {number} val
 * @return {void}
 */
MyLinkedList.prototype.addAtIndex = function(index, val) {

    if(index < 0 || index > this.size)
        return -1;

    if(index === 0)
        return !!this.addAtHead(val);

    if(index === this.size)
        return !!this.addAtTail(val);

    let newNode = new Node(val);
    let beforeNode = this.getIndex(index - 1);
    let afterNode = beforeNode.next;

    beforeNode.next = newNode;
    newNode.prev = beforeNode;
    newNode.next = afterNode;
    afterNode.prev = newNode;

    this.size++;

    return;



};

/**
 * Delete the index-th node in the linked list, if the index is valid.
 * @param {number} index
 * @return {void}
 */
MyLinkedList.prototype.deleteAtIndex = function(index) {

    if(index < 0 || index >= this.size)
        return -1;

    if(index === 0)
        return this.removeAtHead();

    if(index === this.size - 1)
        return this.removeAtTail();

    let removedNode = this.getIndex(index);

    let beforeNode = removedNode.prev;
    let afterNode = removedNode.next;

    beforeNode.next = afterNode;
    afterNode.prev = beforeNode;

    removedNode.next = null;
    removedNode.prev = null;

    this.size--;
    return;

};

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * var obj = Object.create(MyLinkedList).createNew()
 * var param_1 = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index,val)
 * obj.deleteAtIndex(index)
 */
