void setup() {
  size(640, 480);
  background(111, 143, 114);
}

int scale = 2;
int faceWidth = 80;

float centerX = 320;
float centerY = 240;

void draw() {
  neck();
  face();
  hair();
}

void face() {
  fill(210, 153, 108); //skin color
  middleOfFace();
  foreHead();
  chin();
  eye();
  eyeBrows();
  nose();
  lips();
}

void foreHead() {
  arc(centerX, centerY-100, faceWidth*scale, 50*scale, PI, 2*PI, OPEN);
}

void middleOfFace() {
  rect(centerX-faceWidth*scale/2, centerY-102, faceWidth*scale, 84);
}

void chin() {
  arc(centerX, centerY-20, faceWidth*scale, 85*scale, 0, PI);
}
void hair() {
  pushStyle();
  fill(0, 0, 0);
  arc(centerX, centerY-105, 160, 105, PI, 2*PI);
  triangle(centerX-faceWidth, centerY-105, centerX-faceWidth+20, centerY-105, centerX-faceWidth, centerY-40);
  triangle(centerX+faceWidth, centerY-105, centerX+faceWidth-20, centerY-105, centerX+faceWidth, centerY-40);
  
    popStyle();
}

void eye() {
  //left sclera
  fill(255, 255, 255);
  arc(centerX-30, centerY-80, 30, 13, PI, PI*2);
  arc(centerX-30, centerY-80, 30, 13, 0, PI);
  //right sclera
  fill(255, 255, 255);
  arc(centerX+30, centerY-80, 30, 13, PI, PI*2);
  arc(centerX+30, centerY-80, 30, 13, 0, PI);

  //iris
  pushStyle();
  fill(0, 0, 0);
  circle(centerX-30, centerY-80, 8);
  circle(centerX+30, centerY-80, 8          );
  popStyle();
}

void eyeBrows() {
  pushStyle();
  noFill();
  stroke(0, 0, 0);
  strokeWeight(2);
  arc(centerX-30, centerY-87, 38, 8, PI, PI*2); //left eyebrow
  arc(centerX+30, centerY-87, 38, 8, PI, PI*2); //right eyebrow
  popStyle();
}

void neck() {
  pushStyle();
  fill(210, 153, 108); //skin color
  noStroke();
  int neckWidth = 55;
  rect(centerX-neckWidth/2, centerY+50, neckWidth, 70);
  popStyle();
}


void nose() {
  int noseWidth=30;
  int yShift = -10;
  fill(217, 168, 130);
  quad(centerX, centerY-45+yShift, centerX-noseWidth/2, centerY+yShift, centerX, centerY+5+yShift, centerX+noseWidth/2, centerY+yShift);
}

void lips() {
  pushStyle();
  fill(210, 153, 133);
  int lipsWidth = 50;
  int lipsHeight = 16;
  ellipse(centerX, centerY+25, lipsWidth, lipsHeight);
  arc(centerX, centerY+23, lipsWidth, 6, 0, PI);
  popStyle();
}
