class Player {
  constructor(x, y) {
    this.x = x;
    this.y = y;
    this.r = 40;
    this.pos = createVector(x, y);
    this.color = false;
  }
  toWall(ray) {
    //console.log(degrees(ray.angle));
    let x1 = this.r * Math.sin(PI - ray.angle);
    let y1 = this.r * Math.cos(PI - ray.angle);
    // console.log(x1);
    // console.log(y1);
    return new Boundary(
      this.x - x1,
      this.y - y1,
      this.x + x1,
      this.y + y1,
      this
    );
  }
  show() {
    if (this.color) {
      // stroke(255);
      stroke(200, 50, 0);
      noFill();
      ellipse(this.x, this.y, this.r * 2, this.r * 2);
      fill(255);
      ellipse(this.x, this.y, this.r / 10, this.r / 10);
    } else {
      stroke(255);
      // fill(255);

      noFill();
      ellipse(this.x, this.y, this.r * 2, this.r * 2);
      fill(255);
      ellipse(this.x, this.y, this.r / 10, this.r / 10);
    }
    this.color = false;
  }
  update(x, y, walls) {
    for (let wall of walls) {
      const x1 = x;
      const y1 = y;
      const x2 = this.pos.x;
      const y2 = this.pos.y;

      const x3 = wall.b.x;
      const y3 = wall.b.y;
      const x4 = wall.a.x;
      const y4 = wall.a.y;

      const den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
      if (den == 0) {
      } else {
        const t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den;
        const u = -((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3)) / den;
        if (t > 0 && t < 1 && u > 0 && u < 1) {
          return;
        }
      }
    }
    this.x = x;
    this.y = y;
    this.pos = createVector(x, y);
  }
}
