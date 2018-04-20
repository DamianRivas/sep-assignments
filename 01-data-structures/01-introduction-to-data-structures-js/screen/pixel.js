// Pixels require three color values: red, green, and blue.
// Pixel colors red, green, and blue values must be greater than zero and less than 255.
// If  a value less than zero is specified, default to zero. If a value greater than 255 is specified, default to 255.
// Pixels also require a coordinate location: x and y.

// Private methods
const validateColor = Symbol('validateColor');

class Pixel {
  constructor(red, green, blue, x, y) {
    this.x = x;
    this.y = y;

    this.red = this[validateColor](red);
    this.green = this[validateColor](green);
    this.blue = this[validateColor](blue);
  }

  // private

  [validateColor](color) {
    if (color > 255) {
      return 255;
    } else if (color < 0) {
      return 0
    }
    return color;
  }
}

module.exports = Pixel;
