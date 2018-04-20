const Pixel = require('./pixel');

let pixel = new Pixel();

describe('Pixel', () => {
  describe('contructor()', () => {
    test('should create a pixel with the specified parameters', () => {
      let pixel = new Pixel(255, 200, 160, 5, 7);

      expect(pixel.red).toBe(255);
      expect(pixel.green).toBe(200);
      expect(pixel.blue).toBe(160);
      expect(pixel.x).toBe(5);
      expect(pixel.y).toBe(7);
    });

    test('should correct a red value if it is less than 0', () => {
      let pixel = new Pixel(-7, 100, 100, 5, 5);

      expect(pixel.red).toBe(0);
    });

    test('should correct a green value if it is less than 0', () => {
      let pixel = new Pixel(100, -10, 100, 5, 5);

      expect(pixel.green).toBe(0);
    });

    test('should correct a blue value if it is less than 0', () => {
      let pixel = new Pixel(100, 100, -12, 5, 5);

      expect(pixel.blue).toBe(0);
    });

    test('should correct a red value if it is greater than 255', () => {
      let pixel = new Pixel(256, 100, 100, 5, 5);

      expect(pixel.red).toBe(255);
    });

    test('should correct a green value if it is greater than 255', () => {
      let pixel = new Pixel(100, 258, 100, 5, 5);

      expect(pixel.green).toBe(255);
    });

    test('should correct a blue value if it is greater than 255', () => {
      let pixel = new Pixel(100, 100, 300, 5, 5);

      expect(pixel.blue).toBe(255);
    });
  });
});
