// corey hudson | spacegame | november 6, 2024
SpaceShip s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<Powerup> powerups = new ArrayList<Powerup>();
int score, level, rockRate;
boolean play, invincibility;
PImage pu1, pu2, pu3;
Timer rtimer, stimer, putimer, ivtimer;

void setup() {
  size(600, 600);
  s1 = new SpaceShip();
  score = 0;
  level = 1;
  play = false;
  pu1 = loadImage("healthpack.png");
  pu2 = loadImage("shield.png.png");
  pu3 = loadImage("nuke.png");
  rtimer = new Timer(500);
  rtimer.start();
  stimer = new Timer(100);
  stimer.start();
  putimer = new Timer(10000);
  putimer.start();
  ivtimer = new Timer(5000);
}

void draw() {
  background(20);
  if (stimer.isFinished()) {
    stars.add(new Star());
    stimer.start();
  }
  for (int i = 0; i < stars.size(); i++) {
    Star star = stars.get(i);
    star.display();
    star.move();
    if (star.reachedBottom()) {
      stars.remove(i);
    }
  }
  if (!play) {
    startScreen();
  } else {
    if (frameCount % 1000 == 10) {
      level++;
      rtimer.totalTime -= 40;
    }
    if (putimer.isFinished()) {
      powerups.add(new Powerup());
      putimer.start();
    }
    for (int i = 0; i < powerups.size(); i++) {
      Powerup Powerup = powerups.get(i);
      Powerup.display();
      Powerup.move();
      if (Powerup.reachedBottom()) {
        powerups.remove(i);
      }
      if (Powerup.intersect(s1)) {
        if (Powerup.type == 'h') {
          s1.hp += Powerup.healAmount;
          powerups.remove(i);
        } else if (Powerup.type == 'i') {
          invincibility = true;
          ivtimer.start();
          powerups.remove(i);
        } else if (Powerup.type == 'n') {
          powerups.remove(i);
          score += int(random(300, 700));
          for (int j = 0; j < rocks.size(); j++) {
            rocks.remove(j);
          }
        }
      }
    }
    if (ivtimer.isFinished()) {
      invincibility = false;
    }
    for (int i = 0; i < bullets.size(); i++) {
      Bullet bullet = bullets.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (bullet.intersect(rock)) {
          rock.diam -= 5;
          if (rock.diam<11) {
            rocks.remove(j);
            score += rock.storedScore;
          }
          bullets.remove(i);
        }
      }
      bullet.display();
      bullet.move();
      if (bullet.reachedTop()) {
        bullets.remove(bullet);
        score-=5;
      }
    }

    if (rtimer.isFinished()) {
      rocks.add(new Rock());
      rtimer.start();
    }
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (rock.reachedBottom()) {
        rocks.remove(i);
      }
      if (s1.intersect(rock)) {
        if (!invincibility) {
          s1.hp -= rock.diam/3.5;
        } else {
          score += rock.storedScore;
        }
        rocks.remove(i);
      }
    }
    s1.display(invincibility);
    s1.move(mouseX, 500);
    infoPanel();
  }
  if (s1.hp<1) {
    gameOver();
    noLoop();
  }
}

void infoPanel() {
  stroke(0);
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 20, 500, 30);
  fill(200, 255);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Score - " + score, 100, 20);
  text("Health - " + s1.hp, 210, 20);
  text("Level - " + level, 320, 20);
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(30);
  text("Space Game", width/2, 100);
  textSize(15);
  text("Press Space to play", width/2, 150);
  textSize(12);
  text("- The score you get from a rock depends on how big the rock was -", width/2, 200);
  text("- You are penalized five score for every bullet that goes offscreen -", width/2, 220);
  textSize(13);
  text("- Collect powerups to get benefits -", width/2, 400);
  imageMode(CENTER);
  pu1.resize(32, 32);
  image(pu1, width/2-50, 440);
  pu2.resize(32, 32);
  image(pu2, width/2, 440);
  pu3.resize(32, 32);
  image(pu3, width/2+50, 440);
  if (keyPressed && key == ' ') {
    play = true;
  }
  if (stimer.isFinished()) {
    stars.add(new Star());
    stimer.start();
  }
  for (int i = 0; i < stars.size(); i++) {
    Star star = stars.get(i);
    star.display();
    star.move();
    if (star.reachedBottom()) {
      stars.remove(i);
    }
  }
}

void gameOver() {
  background(0);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(30);
  text("Game Over", width/2, 100);
  textSize(15);
  text("( " + score + " )", width/2, 125);
}

void ticker() {
}

void keyPressed() {
  if (key == ' ') {
    bullets.add(new Bullet(s1.x, s1.y));
    bullets.add(new Bullet(s1.x-21, s1.y+50));
    bullets.add(new Bullet(s1.x+21, s1.y+50));
  }
}
