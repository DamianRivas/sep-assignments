'use strict';

class LinkedList {
  constructor(node) {
    this.head = node || null;
    this.tail = node || null;
  }

  addToTail(node) {
    if (this.tail) {
      this.tail.next = node;
    } else {
      this.head = node;
    }

    this.tail = node;
  }

  removeTail() {
    if (!this.head) {
      return;
    } else if (this.head === this.tail) {
      this.head = null;
      this.tail = null;
    } else {
      let node = this.head;

      while (node) {
        if (node.next === this.tail) {
          this.tail = node;
          node.next = null;
          return;
        }
        node = node.next;
      }
    }
  }

  print() {
    let node = this.head;

    while (node) {
      console.log(`${node.data}\n`);
      node = node.next;
    }
  }

  remove(node) {
    if (!this.head) {
      return;
    } else if (this.head === node) {
      if (this.head === this.tail) {
        this.head = null;
        this.tail = null;
      } else {
        this.head = this.head.next;
      }
      return;
    } else {
      let tempNode = this.head;

      while (tempNode) {
        if (tempNode.next === node) {
          let toBeRemoved = tempNode.next;
          tempNode.next = tempNode.next.next;

          if (this.tail === toBeRemoved) {
            this.tail = tempNode;
          }

          toBeRemoved.next = null;
          return;
        }
        tempNode = tempNode.next;
      }
    }
  }

  addToFront(node) {
    if (!this.head) {
      this.head = node;
      this.tail = node;
      return;
    }

    const temp = this.head;

    this.head = node;
    this.head.next = temp;
  }

  removeFront() {
    if (!this.head) { return; }

    let temp = this.head;

    this.tail = this.head === this.tail ? null : this.tail;
    this.head = this.head.next;
    temp = null;
  }
}

module.exports = LinkedList;
