'use strict';

class MyQueue {
  constructor() {
    this.queue = [];
    this.head = this.queue[0];
    this.tail = this.queue[0];
  }

  enqueue(element) {
    this.queue[this.queue.length] = element;
    this.head = this.queue[0];
    this.tail = this.queue[this.queue.length - 1];
  }

  dequeue() {
    if (this.isEmpty()) { return; }

    const firstElement = this.queue[0];

    this.queue = this.queue.slice(1);
    this.head = this.queue[0];
    return firstElement;
  }

  isEmpty() {
    return this.queue.length === 0;
  }
}

module.exports = MyQueue;
