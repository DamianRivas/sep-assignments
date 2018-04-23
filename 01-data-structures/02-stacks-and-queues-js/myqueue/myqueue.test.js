'use strict';
const MyQueue = require('./myqueue');

describe('MyQueue', () => {
  let q;

  beforeEach(() => {
    q = new MyQueue();
  });

  describe('enqueue()', () => {
    test('should add an item to the end of the queue', () => {
      q.enqueue("Rob");
      expect(q.head).toBe("Rob");
      expect(q.tail).toBe("Rob");
      q.enqueue("Ben");
      expect(q.head).toBe("Rob");
      expect(q.tail).toBe("Ben");
    });
  });

  describe('dequeue()', () => {
    test('should remove an item from the front of the queue', () => {
      q.enqueue("Rob");
      expect(q.isEmpty()).toBe(false);
      q.dequeue();
      expect(q.isEmpty()).toBe(true);
    });

    test('should properly update the head and tail members', () => {
      q.enqueue("Rob");
      expect(q.head).toBe("Rob");
      expect(q.tail).toBe("Rob");
      q.enqueue("Ben");
      expect(q.head).toBe("Rob");
      expect(q.tail).toBe("Ben");
      q.dequeue();
      expect(q.head).toBe("Ben");
      expect(q.tail).toBe("Ben");
    });

    test('should do nothing if the queue is empty', () => {
      q.dequeue();
      expect(q.isEmpty()).toBe(true);
    });
  });

  describe('isEmpty()', () => {
    test('should return true if the queue is empty', () => {
      expect(q.isEmpty()).toBe(true);
    });

    test('should reutrn false if the queue is not empty', () => {
      q.enqueue("Rob");
      expect(q.isEmpty()).toBe(false);
    });
  });
});
