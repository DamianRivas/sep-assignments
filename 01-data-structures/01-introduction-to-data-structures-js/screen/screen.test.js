const Pixel = require('./pixel');
const Screen = require('./screen');

describe('Screen', () => {
  let screen = new Screen(10, 10);

  describe('contructor()', () => {
    test('should initialize screen with 10x10 matrix', () => {
      expect(screen.matrix.length).toBe(10);
      expect(screen.matrix[0].length).toBe(10);
      expect(screen.matrix[screen.matrix.length - 1].length).toBe(10);
    });

    test('should initialize screen with black pixels', () => {
      let pixel = screen.matrix[0][0];

      expect(pixel.red).toBe(0);
      expect(pixel.green).toBe(0);
      expect(pixel.blue).toBe(0);
    });
  });

  describe('insert()', () => {
    let pixel = new Pixel(255, 200, 175, 1, 1);
    screen.insert(pixel, 1, 1);

    test('should insert a pixel at the proper x, y coordinates', () => {
      expect(screen.at(1, 1)).toBe(pixel);
    });

    test('should retain color information upon insertion', () => {
      let p1 = screen.at(1, 1);

      expect(p1.red).toBe(pixel.red);
      expect(p1.green).toBe(pixel.green);
      expect(p1.blue).toBe(pixel.blue);
    });

    test('should do nothing if the specified coordinate is out of range', () => {
      let pixel = new Pixel(255, 200, 175, -5, 100);
      screen.insert(pixel, pixel.x, pixel.y);

      expect(screen.at(-5, 100)).toBeNull();
    });
  });

  describe('at()', () => {
    test('should return the pixel at a specific location', () => {
      let pixel = new Pixel(255, 200, 175, 1, 1);
      screen.insert(pixel, 1, 2);

      p1 = screen.at(1, 2);
      expect(p1).toBe(pixel);
    });

    test('should handle invalid x, y values gracefully', () => {
      let pixel = screen.at(-1, -1);

      expect(pixel).toBeNull();
    });
  });
});
