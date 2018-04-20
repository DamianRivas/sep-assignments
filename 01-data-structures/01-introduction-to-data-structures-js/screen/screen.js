const Pixel = require('./pixel');

class Screen {
  constructor(width, height) {
    this.width = width;
    this.height = height;

    this.matrix = [];

    // Build the pixel matrix
    for (let x = 0; x < width; x++) {
      // build the y-array of the pixel matrix
      let y_matrix = [];
      for (let y = 0; y < height; y++) {
        y_matrix[y] = new Pixel(0, 0, 0, x, y);
      }
      // set the y-array to the x-position of the pixel matrix
      this.matrix[x] = y_matrix;
    }
  }

  insert(pixel, x, y) {
    if (x < 0 || y < 0 || x > this.width || y > this.height) { return; }

    this.matrix[x][y] = pixel;
  }

  at(x, y) {
    if (!this.matrix[x] || !this.matrix[x][y]) { return null; }

    return this.matrix[x][y];
  }
}

module.exports = Screen;
