// Daniel Shiffman
// https://thecodingtrain.com/CodingChallenges/145-2d-ray-casting.html
// https://youtu.be/TOEi6T2mtHo

// 2D Ray Casting
// https://editor.p5js.org/codingtrain/sketches/Nqsq3DFv-

class Boundary {
  constructor(x1, y1, x2, y2, minus) {
    this.minus = minus;
    this.a = createVector(x1, y1);
    this.b = createVector(x2, y2);
  }
  getHeigth() {
    if (this.a.y > this.b.y) {
      return this.a.y - this.b.y;
    }
    return this.b.y - this.a.y;
  }
  getWidth() {
    if (this.a.x > this.b.x) {
      return this.a.x - this.b.x;
    }
    return this.b.x - this.a.x;
  }
  show() {
    stroke(255);
    line(this.a.x, this.a.y, this.b.x, this.b.y);
  }
}
