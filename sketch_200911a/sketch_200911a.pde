void setup() {
  size(640, 480);
  background(111, 143, 114);
}

int scale = 2;
int faceWidth = 80;

int centerX = 320;
int centerY = 240;

void draw() {
  face();
}

void face() {
  noStroke();
  fill(210, 153, 108);
  //hair();
  middleOfFace();
  foreHead();
  chin();
}

void foreHead() {
  arc(centerX, centerY-100, faceWidth*scale, 50*scale, PI, 2*PI);
}

void middleOfFace(){
  rect(centerX-faceWidth*scale/2, centerY-100,faceWidth*scale,80);
}

void chin() {
  arc(centerX, centerY-20, faceWidth*scale, 85*scale, 0, PI);
}
void hair() {
  pushStyle();
  fill(0);
  arc(centerX, centerY-95, 98*scale, 60*scale, PI, 2*PI);
  popStyle();
}
