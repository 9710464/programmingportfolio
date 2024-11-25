class SpaceShip {
  //member variables
  int x, y, w, ammo, gunsCount, hp;
  //constructor
  SpaceShip() {
    x = width/2;
    y = height/2;
    w = 100;
    gunsCount = 3;
    hp = 100;
  }
  //member methods
  void display(boolean invincibility) {
    rectMode(CORNER);
    noStroke();
    //guns
    fill(80);
    rect(x-1, y-55, 2, 20);
    rect(x+20, y, 2, 20);
    rect(x-22, y, 2, 20);

    //thrust
    fill(random(60, 190), random(140, 240), random(210, 255));
    ellipse(x, y+28, 12, random(36, 44));
    fill(random(60, 190), random(140, 240), random(210, 255));
    ellipse(x, y+28, 10, random(26, 34));
    fill(random(60, 190), random(140, 240), random(210, 255));
    ellipse(x, y+28, 8, random(16, 24));

    //hull
    fill(120);
    rect(x-8, y, 16, 28);
    fill(150);
    beginShape();
    vertex(x-39, y+31);
    vertex(x-15, y);
    vertex(x-4, y-45);
    vertex(x, y-50);
    vertex(x+4, y-45);
    vertex(x+15, y);
    vertex(x+39, y+31);
    vertex(x+15, y+30);
    vertex(x+10, y+24);
    vertex(x-10, y+24);
    vertex(x-15, y+30);
    endShape(CLOSE);
    fill(120);
    ellipse(x, y, 10, 40);

    //cockpit
    fill(255, 165, 0);
    quad(x, y-30, x-5, y-25, x-5, y-20, x, y-25);
    quad(x, y-30, x+5, y-25, x+5, y-20, x, y-25);
    
    if (invincibility) {
      fill(200,200,200,100);
      ellipse(x,y,100,100);
    }
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean intersect(Rock r) {
    float d1, d2, d3, d4, d5;
    d1 = dist(r.x, r.y, x-39, y+31);
    d2 = dist(r.x, r.y, x-15, y);
    d3 = dist(r.x, r.y, x, y-50);
    d4 = dist(r.x, r.y, x+15, y);
    d5 = dist(r.x, r.y, x-39, y+31);
    if ((d1<r.diam/2)||(d2<r.diam/2)||(d3<r.diam/2)||(d4<r.diam/2)||(d5<r.diam/2)) {
      return true;
    } else {
      return false;
    }
  }
}
