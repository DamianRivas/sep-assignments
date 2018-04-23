'use strict';

class MyStack {
  constructor() {
    this.stack = [];
    this.top = null;
  }

  push(item) {
    this.stack[this.stack.length] = item;
    this.top = item;
  }

  pop() {
    if (this.isEmpty()) { return; }

    let topItem = this.top;

    this.stack.length--;
    this.top = this.isEmpty() ? null : this.stack[this.stack.length - 1];
    return topItem;
  }

  isEmpty() {
    return this.stack.length < 1;
  }
}

module.exports = MyStack;