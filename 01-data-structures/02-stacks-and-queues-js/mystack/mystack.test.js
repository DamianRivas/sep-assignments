'use strict';
const MyStack = require('./mystack');

describe('MyStack', () => {
  let stack;

  beforeEach(() => {
    stack = new MyStack();
  });

  describe('push()', () => {
    test('should push an item on top of the stack', () => {
      expect(stack.top).toBeNull();
      stack.push("Rob");
      expect(stack.top).toBe("Rob");
    });

    test('should push an item on top of the stack', () => {
      expect(stack.top).toBeNull();
      stack.push("Rob");
      expect(stack.top).toBe("Rob");
      stack.push("Ben");
      expect(stack.top).toBe("Ben");
      expect(stack.stack).toEqual(["Rob", "Ben"]);
    });
  });

  describe('pop()', () => {
    test('should pop an item off the top of the stack and return it', () => {
      stack.push("Ben");
      stack.push("Rob");
      expect(stack.top).toBe("Rob");
      let item = stack.pop();
      expect(item).toBe("Rob");
      expect(stack.top).toBe("Ben");
      item = stack.pop();
      expect(item).toBe("Ben");
      expect(stack.top).toBeNull();
    });
  });

  describe('isEmpty()', () => {
    test('should return true when the stack is empty', () => {
      expect(stack.isEmpty()).toBe(true);
    });

    test('should return false when the stack is not empty', () => {
      stack.push("Rob");
      expect(stack.isEmpty()).toBe(false);
    });
  });
});