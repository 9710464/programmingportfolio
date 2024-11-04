// Corey Hudson | Calculator App | Sept 30 2024
// PRESS BACKSPACE TO DELETE LAST CHARACTER
// PRESS END TO CLEAR
Button[] buttons = new Button[23];
String dVal = "0";
float l, r, result;
char op;
boolean left, rslt;

void setup() {
  size(210, 250);
  background(50);
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;
  buttons[0] = new Button(45, 185, 76, 36, "0", true);
  buttons[1] = new Button(25, 145, 36, 36, "1", true);
  buttons[2] = new Button(65, 145, 36, 36, "2", true);
  buttons[3] = new Button(105, 145, 36, 36, "3", true);
  buttons[4] = new Button(25, 105, 36, 36, "4", true);
  buttons[5] = new Button(65, 105, 36, 36, "5", true);
  buttons[6] = new Button(105, 105, 36, 36, "6", true);
  buttons[7] = new Button(25, 65, 36, 36, "7", true);
  buttons[8] = new Button(65, 65, 36, 36, "8", true);
  buttons[9] = new Button(105, 65, 36, 36, "9", true);
  buttons[10] = new Button(185, 25, 36, 36, "AC", false);
  buttons[11] = new Button(145, 65, 36, 36, "+", false);
  buttons[12] = new Button(145, 105, 36, 36, "-", false);
  buttons[13] = new Button(185, 65, 36, 36, "*", false);
  buttons[14] = new Button(185, 105, 36, 36, "/", false);
  buttons[15] = new Button(145, 145, 36, 36, "+/-", false);
  buttons[16] = new Button(185, 145, 36, 36, "%", false);
  buttons[17] = new Button(125, 185, 76, 36, ".", false);
  buttons[18] = new Button(185, 205, 36, 76, "=", false);
  buttons[19] = new Button(25, 225, 36, 36, "pi", false);
  buttons[20] = new Button(65, 225, 36, 36, "sq", false);
  buttons[21] = new Button(105, 225, 36, 36, "sqrt", false);
  buttons[22] = new Button(145, 225, 36, 36, "rnd", false);
}

void draw() {
  background(50);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}



void mouseReleased() {
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].hvring && buttons[i].isNum && left && dVal.length()<18) {
      if (dVal.equals("0")) {
        dVal = buttons[i].val;
      } else {
        dVal += buttons[i].val;
      }
      l = float(dVal);
    } else if (buttons[i].hvring && buttons[i].isNum && !left && dVal.length()<18) {
      if (dVal.equals("0")) {
        dVal = buttons[i].val;
      } else {
        dVal += buttons[i].val;
      }
      r = float(dVal);
    } else if (buttons[i].hvring && buttons[i].val.equals("AC")) {
      handleEvent("end", false);
    } else if (buttons[i].hvring && buttons[i].val.equals(".")) {
      handleEvent(".", false);
    } else if (buttons[i].hvring && buttons[i].val.equals("+")) {
      handleEvent("+", false);
    } else if (buttons[i].hvring && buttons[i].val.equals("-")) {
      handleEvent("-", false);
    } else if (buttons[i].hvring && buttons[i].val.equals("*")) {
      handleEvent("*", false);
    } else if (buttons[i].hvring && buttons[i].val.equals("/")) {
      handleEvent("/", false);
    } else if (buttons[i].hvring && buttons[i].val.equals("+/-")) {
      if (rslt) {
        return;
      } else if (left) {
        l = -l;
        dVal = str(l);
      } else {
        r = -r;
        dVal = str(r);
      }
    } else if (buttons[i].hvring && buttons[i].val.equals("%")) {
      if (left) {
        l *= 0.01;
        dVal = str(l);
      } else if (rslt) {
        result *= 0.01;
        dVal = str(result);
      } else {
        r *= 0.01;
        dVal = str(r);
      }
    } else if (buttons[i].hvring && buttons[i].val.equals("pi")) {
      if (rslt) {
        return;
      } else if (left) {
        l = PI;
        dVal = str(l);
      } else {
        r = PI;
        dVal = str(r);
      }
    } else if (buttons[i].hvring && buttons[i].val.equals("sq")) {
      if (left) {
        l = l*l;
        dVal = str(l);
      } else if (rslt) {
        result = result*result;
        dVal = str(result);
      } else {
        r = r*r;
        dVal = str(r);
      }
    } else if (buttons[i].hvring && buttons[i].val.equals("sqrt")) {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else if (rslt) {
        result = sqrt(result);
        dVal = str(result);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (buttons[i].hvring && buttons[i].val.equals("rnd")) {
      if (left) {
        l = round(l);
        dVal = str(l);
      } else if (rslt) {
        result = round(result);
        dVal = str(result);
      } else {
        r = round(r);
        dVal = str(r);
      }
    } else if (buttons[i].hvring && buttons[i].val.equals("=")) {
      performCalculation();
    }
  }
  //println("left - " + l + ") right - " + r + ") result - " + result + ") operator - " + op + ") L - " + left + ")");
}

void performCalculation() {
  if (op== '+') {
    result = l + r;
  } else if (op== '-') {
    result = l - r;
  } else if (op== '*') {
    result = l * r;
  } else if (op== '/') {
    result = l / r;
  }
  dVal = str(result);
  rslt = true;
}

void updateDisplay() {
  fill(200);
  rectMode(CENTER);
  rect(85, 25, 156, 36, 3 );
  fill(0);
  if (dVal.length()<12) {
    textSize(25);
  } else if (dVal.length() == 12) {
    textSize(24);
  } else if (dVal.length() == 13) {
    textSize(22);
  } else if (dVal.length() == 14) {
    textSize(21);
  } else if (dVal.length() == 15) {
    textSize(19);
  } else if (dVal.length() == 16) {
    textSize(18);
  } else if (dVal.length() == 17) {
    textSize(17);
  }
  textAlign(RIGHT, CENTER);
  text(dVal, 160, 30);
  textSize(15);
  text(l + " " + op + " " + r + " = " + result, 160, 15);
}

void keyReleased() {
  println("key - " + key + ") - " + keyCode);
  if (keyCode == 96 || keyCode == 48) {
    handleEvent("0", true);
  } else if (keyCode == 97 || keyCode == 49) {
    handleEvent("1", true);
  } else if (keyCode == 98 || keyCode == 50) {
    handleEvent("2", true);
  } else if (keyCode == 99 || keyCode == 51) {
    handleEvent("3", true);
  } else if (keyCode == 100 || keyCode == 52) {
    handleEvent("4", true);
  } else if (keyCode == 101 || keyCode == 53) {
    handleEvent("5", true);
  } else if (keyCode == 102 || keyCode == 54) {
    handleEvent("6", true);
  } else if (keyCode == 103 || keyCode == 55) {
    handleEvent("7", true);
  } else if (keyCode == 104 || keyCode == 56) {
    handleEvent("8", true);
  } else if (keyCode == 105 || keyCode == 57) {
    handleEvent("9", true);
  } else if (keyCode == 106) {
    handleEvent("*", false);
  } else if (keyCode == 107) {
    handleEvent("+", false);
  } else if (keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 110) {
    handleEvent(".", false);
  } else if (keyCode == 111) {
    handleEvent("/", false);
  } else if (keyCode == 10) {
    handleEvent("=", false);
  } else if (keyCode == 8) {
    handleEvent("del", false);
  } else if (keyCode == 35) {
    handleEvent("end", false);
  }
}

void handleEvent(String keyVal, boolean isNum) {
  if (left && dVal.length()<18 && isNum && !rslt) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (!left && dVal.length()<18 && isNum && !rslt) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r = float(dVal);
  } else if (keyVal.equals("end") && !isNum) {
    dVal = "0";
    l = 0.0;
    r = 0.0;
    result = 0.0;
    op = ' ';
    left = true;
    rslt = false;
  } else if (keyVal.equals("+") && !isNum && !rslt) {
    left = false;
    dVal = "0";
    op = '+';
  } else if (keyVal.equals("-") && !isNum && !rslt) {
    left = false;
    dVal = "0";
    op = '-';
  } else if (keyVal.equals("*") && !isNum && !rslt) {
    left = false;
    dVal = "0";
    op = '*';
  } else if (keyVal.equals("/") && !isNum && !rslt) {
    left = false;
    dVal = "0";
    op = '/';
  } else if (keyVal.equals(".") && !isNum && !rslt) {
    if (!dVal.contains(".")) {
      dVal += keyVal;
    }
  } else if (keyVal.equals("=") && !isNum && !rslt) {
    performCalculation();
  } else if (keyVal.equals("del") && !isNum && !rslt) {
    if (left) {
      if (dVal.length()>0) {
        dVal = dVal.substring(0, dVal.length() -1);
        l = float(dVal);
      }
    } else {
      if (dVal.length()>0) {
        dVal = dVal.substring(0, dVal.length() -1);
        r = float(dVal);
      }
    }
  }
}
