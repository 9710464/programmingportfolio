// Corey Hudson | Grades App | 13 sept 2024
float grade;

void setup() {
  size(400, 150);
  background(200);
}

void draw() {
  background(127);

  //title
  textAlign(CENTER);
  textSize(15);
  text("Grades by Corey Hudson", width/2, 20);

  //reference line and ticks
  line(0, 60, width, 60);
  for (int i=0; i<width-50; i+=50) {
    line(i+50, 55, i+50, 65);
    textSize(10);
    text((float)(i+50)/width*4, i+50, 75);
  }

  //slider
  ellipse(mouseX, 60, 7, 7);
  text((float)mouseX/width*4, mouseX, 50);

  //letter grade
  assignGrade((float)mouseX/width*4);
}

void assignGrade(float tgrade) {
  textSize(12);
  text(tgrade, width/2, 100);
  textSize(20);
  if (tgrade >= 3.51) {
    text("Assign letter grade A.", width/2, 120);
  } else if (tgrade >= 3) {
    text("Assign letter grade A-.", width/2, 120);
  } else if (tgrade >= 2.84) {
    text("Assign letter grade B+.", width/2, 120);
  } else if (tgrade >= 2.67) {
    text("Assign letter grade B.", width/2, 120);
  } else if (tgrade >= 2.5) {
    text("Assign letter grade B-.", width/2, 120);
  } else if (tgrade >= 2.34) {
    text("Assign letter grade C+.", width/2, 120);
  } else if (tgrade >= 2.17) {
    text("Assign letter grade C.", width/2, 120);
  } else if (tgrade >= 2) {
    text("Assign letter grade C-.", width/2, 120);
  } else if (tgrade >= 1.66) {
    text("Assign letter grade D+.", width/2, 120);
  } else if (tgrade >= 1.33) {
    text("Assign letter grade D.", width/2, 120);
  } else if (tgrade >= 1) {
    text("Assign letter grade D-.", width/2, 120);
  } else {
    text("Assign letter grade F.", width/2, 120);
  }
}
