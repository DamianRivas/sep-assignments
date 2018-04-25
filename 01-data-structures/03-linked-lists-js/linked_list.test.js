'use strict';
const LinkedList = require('./linked_list');
const Node = require('./node');

describe('LinkedList', () => {
  let n1, n2, n3, llist;

  beforeEach(() => {
    n1 = new Node("Rob");
    n2 = new Node("Ben");
    n3 = new Node("Mike");
    llist = new LinkedList();
  });

  describe('addToTail()', () => {
    test('should add a Node to the tail', () => {
      llist.addToTail(n1);
      expect(llist.tail).toEqual(n1);

      llist.addToTail(n2);
      expect(llist.tail).toEqual(n2);
      expect(llist.head).toEqual(n1);
    });
  });

  describe('removeTail()', () => {
    test('should remove nodes from the tail', () => {
      llist.addToTail(n1);
      llist.addToTail(n2);
      expect(llist.tail).toEqual(n2);

      llist.removeTail();
      expect(llist.tail).toEqual(n1);

      llist.removeTail();
      expect(llist.tail).toBeNull();
      expect(llist.head).toBeNull();
    });
  }, 1000);

  describe('print()', () => {
    test('should print each node in a new line to the console', () => {
      llist.addToTail(n1);
      llist.addToTail(n2);

      let outputData = "";
      const storeLog = inputs => outputData += inputs;
      console["log"] = jest.fn(storeLog);

      llist.print();
      expect(outputData).toBe("Rob\nBen\n");
    });
  });

  describe('remove()', () => {
    beforeEach(() => {
      llist.addToTail(n1);
      llist.addToTail(n2);
      llist.addToTail(n3);
    });

    test('should remove the head of a list properly', () => {
      llist.remove(n1);
      expect(llist.head).toEqual(n2);
      expect(llist.head.next).toEqual(n3);
      expect(llist.tail).toEqual(n3);
    });

    test('should remove the middle element of a list properly', () => {
      llist.remove(n2);
      expect(llist.head).toEqual(n1);
      expect(llist.head.next).toEqual(n3);
      expect(llist.tail).toEqual(n3);
    });

    test('should remove the last element of a list properly', () => {
      llist.remove(n3);
      expect(llist.head).toEqual(n1);
      expect(llist.head.next).toEqual(n2);
      expect(llist.tail).toEqual(n2);
    });
  });

  describe('addToFront()', () => {
    test('should add the node to the front of the linked list', () => {
      llist.addToFront(n1);
      expect(llist.head).toEqual(n1);

      llist.addToFront(n2);
      expect(llist.head).toEqual(n2);
    });
  });

  describe('removeFront()', () => {
    test('should remove the node at the front of the linked list', () => {
      llist.addToFront(n1);
      expect(llist.head).toEqual(n1);

      llist.addToFront(n2);
      expect(llist.head).toEqual(n2);

      llist.removeFront();
      expect(llist.head).toEqual(n1);

      llist.removeFront();
      expect(llist.head).toBeNull();
    });
  });
});