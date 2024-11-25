class Rock {
  //member variables
  int x, y, diam, speed, storedScore;
  PImage r1;
  //constructor
  Rock() {
    x = int(random(width));
    y = -30;
    diam = int(random(28, 70));
    speed = diam/14;
    storedScore = diam;
    r1 = loadImage("rock01.png");
  }
  //member methods
  void display() {
    imageMode(CENTER);
    r1.resize(diam, diam);
    image(r1, x, y);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y>height+diam) {
      return true;
    } else {
      return false;
    }
  }
}
