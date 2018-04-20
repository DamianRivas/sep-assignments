const Line = require('./line');

let line = new Line();

describe('Line', () => {
  beforeEach(() => {
    line = new Line();
    line.join("Hillary")
    line.join("Bernie")
    line.join("Donald")
    line.join("Ted")
    line.join("Jeb")
    line.join("Ben")
  })

  describe('contructor()', () => {
    let newLine = new Line();

    test('instantiates the members variable', () => {
      expect(newLine.members).toBeDefined();
    });

    test('should instantiate members as an empty array', () => {
      expect(newLine.members).toEqual([]);
    });
  });

  describe('front()', () => {
    test('should return the first person in the line', () => {
      expect(line.front()).toBe("Hillary");
    });
  });

  describe('middle()', () => {
    test('should return the person in the middle of the line', () => {
      expect(line.middle()).toBe("Ted")
    });
  });

  describe('join()', () => {
    test('should add a person to the back of the line', () => {
      line.join("Homer");

      expect(line.back()).toBe("Homer");
    });
  });

  describe('back()', () => {
    test('should return the person in the back of the line', () => {
      expect(line.back()).toBe("Ben");
    });
  });

  describe('search', () => {
    test("should find the person we're searching for", () => {
      const person = line.search("Ted");

      expect(person).toBe("Ted");
    });
  });

  describe('leave', () => {
    test('should remove a person from the line', () => {
      line.leave("Donald");

      expect(line.search("Donald")).toBeNull();
    });
  });
});
