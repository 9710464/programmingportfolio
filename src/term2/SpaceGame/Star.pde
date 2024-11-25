class Star {
  //member variables
  int x, y, speed;
  PImage r1;
  //constructor
  Star() {
    x = int(random(width));
    y = -30;
    speed = int(random(1, 2));
  }
  //member methods
  void display() {
    fill(255);
    ellipse(x, y, random(2, 4), random(2, 4));
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y>height) {
      return true;
    } else {
      return false;
    }
  }
}
