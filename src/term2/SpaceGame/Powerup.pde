class Powerup {
  //member variables
  int x, y, speed, healAmount;
  char type;
  //constructor
  Powerup() {
    x = int(random(width));
    y = -16;
    speed = int(random(2, 6));
    healAmount = int(random(8, 12));
    int rand = round(random(2));
    if (rand == 0) {
      //healthpack
      type = 'h';
    } else if (rand == 1) {
      //invincibility
      type = 'i';
    } else if (rand == 2) {
      //nuke
      type = 'n';
    }
  }
  //member methods
  void display() {
    imageMode(CENTER);
    if (type == 'h') {
      pu1.resize(32, 32);
      image(pu1, x, y);
    } else if (type == 'i') {
      pu2.resize(32, 32);
      image(pu2, x, y);
    } else if (type == 'n') {
      pu3.resize(32, 32);
      image(pu3, x, y);
    }
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y>height+16) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(SpaceShip s) {
    float d1, d2, d3, d4, d5;
    d1 = dist(x, y, s.x-39, s.y+31);
    d2 = dist(x, y, s.x-15, s.y);
    d3 = dist(x, y, s.x, s.y-50);
    d4 = dist(x, y, s.x+15, s.y);
    d5 = dist(x, y, s.x-39, s.y+31);
    if ((d1<16)||(d2<16)||(d3<16)||(d4<16)||(d5<16)) {
      return true;
    } else {
      return false;
    }
  }
}
