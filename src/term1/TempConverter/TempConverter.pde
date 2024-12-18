// Corey Hudson | Temp Converter | Sept 23 2024

boolean farToCelOnOff;

void setup() {
  farToCelOnOff=true;
  size(400, 200);
  background(127);
}
// switch conversion
void keyReleased() {
  if (key=='e') {
    farToCelOnOff=!farToCelOnOff;
  }
}
void draw() {
  background(127);
  text("press E to switch conversion", width/2, 50);
  fill(200);
  line(0, 150, width, 150);
  // tick marks
  for (int i=0; i<width-50; i+=50) {
    line(i+50, 145, i+50, 155);
    textSize(12);
    textAlign(CENTER, CENTER);
    text((i+50), i+50, 165);
  }
  // displayed conversion
  ellipse(mouseX, 150, 8, 8);
  if (farToCelOnOff) {
    text(mouseX+"F°", mouseX+4, 135);
    text(farToCel(mouseX)+"C°", width/2, 100);
  } else {
    text(mouseX+"C°", mouseX+4, 135);
    text(celToFar(mouseX)+"F°", width/2, 100);
  }
}
//conversions
float farToCel(float tempFar) {
  tempFar = round((tempFar-32.0)*(5.0/9.0));
  return tempFar;
}

float celToFar(float tempCel) {
  tempCel = round((tempCel*9.0/5.0)+32.0);
  return tempCel;
}
