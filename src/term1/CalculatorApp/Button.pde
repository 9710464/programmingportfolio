class Button {
  //member variables
  int x, y, w, h;
  color c1, c2;
  String val;
  boolean hvring, isNum;

  //constructor
  Button(int x, int y, int w, int h, String val, boolean isNum) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    c1 = 140;
    c2 = c1-20;
    this.val = val;
    hvring=false;
    this.isNum = isNum;
  }

  //member methods
  void display() {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    textSize(16);
    if (hvring) {
      fill(c2);
    } else {
      fill(c1);
    }
    rect(x, y, w, h, 5);
    fill(0);
    text(val, x, y);
  }
  boolean hover(int mx, int my) {
    if (mx>x-w/2 && mx<x+w/2 && my>y-h/2 && my<y+h/2) {
      hvring = true;
      return hvring;
    } else {
      hvring = false;
      return hvring;
    }
  }
}
