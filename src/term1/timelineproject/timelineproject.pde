// Corey Hudson | Timeline Project | Aug 28 2024

void setup() {
  size(900, 400);
  background(127);
}

void draw() {
  background(127);
  drawRef();
  histEvent(110, 150, "Z3, 1941", "Z3 was designed by Konrad Zuse in Germany, and was the world's first programmable computer. \n It used electromechanical relays to compute.", true, 73);
  histEvent(220, 150, "ENIAC, 1945", "ENIAC was made by J. Presper Eckert and John Maulchy. \n It was used for artillery trajectory computations.", true, 97);
  histEvent(400, 150, "UNIVAC-I, 1951", "UNIVAC-I was also made by J. Presper Eckert and John Maulchy. \n It was the first commercially available computer.", true, 120);
  histEvent(720, 150, "UNIVAC-II, 1958", "UNIVAC-II was a direct improvement of UNIVAC-I, \n with significantly higher speed and reliability.", true, 126);
  histEvent(190, 250, "MARK-I, 1944", "Mark-I was designed by Howard Aiken and built by IBM in the United States. \n It was another electromechanical computer used for simpler calculations like \n addition, subtraction, multiplication, and division.", false, 108);
  histEvent(340, 250, "EDSAC, 1949", "EDSAC was designed by Maurice Wilkes and his team at the University of Cambridge. \n It was one of the first computers to use stored programs.", false, 102);
  histEvent(460, 250, "IBM-650, 1953", "IBM-650 was designed by Frank Hamilton in the United States. \n It was used most notably for business applications.", false, 116);
  histEvent(750, 250, "CDC-1604, 1959", "CDC-1604 was designed by the Control Data Corporation. \n It was one of the earliest transistorized computers, \n making it much faster and safer than vacuum tube computers.", false, 124);
}

void drawRef() {
  textAlign(CENTER, CENTER);
  // timeline format
  strokeWeight(3);
  stroke(0);
  fill(0);
  line(100, 200, 800, 200);
  text("1940", 75, 200);
  text("1960", 825, 200);

  // title text
  textSize(35);
  fill(50);
  text("Historic Computer Systems", width/2, 60);
  textSize(25);
  text("by Corey Hudson", width/2, 85);
}

void histEvent(int x, int y, String title, String detail, boolean top, int rectSizeX) {
  strokeWeight(2);
  if (top == true) {
    line(x, y, x+20, 200);
  } else {
    line(x, y, x+20, 200);
  }
  rectMode(CENTER);
  strokeWeight(1);
  fill(0);
  textAlign(CENTER);
  if (mouseX>x-50 && mouseX<x+50 && mouseY>y-10 && mouseY<y+10) {
    textSize(20);
    text(detail, width/2, 300);
    fill(175);
    rect(x, y+1, rectSizeX, 20, 3, 3, 3, 3);
  } else {
    fill(155);
    rect(x, y+1, rectSizeX, 20, 3, 3, 3, 3);
  }
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(18);
  text(title, x, y);
}
