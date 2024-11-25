class Bullet {
  //member variables
  int x, y, w, h, speed;
  //constructor
  Bullet(int x, int y) {
    this.x = x;
    this.y = y-55;
    w = 1;
    h = 5;
    speed = 4;
  }
  //member methods
  void display() {
    noStroke();
    fill(200,80,80);
    rectMode(CENTER);
    rect(x,y,w,h);
  }

  void move() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(r.x,r.y,x, y);
    if (d<r.diam) {
      return true;
    } else {
      return false;
    }
  }
}
