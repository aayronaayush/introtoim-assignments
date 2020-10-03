void setup() {
  size(640, 480);
}

int x = floor(random(640));
int y = floor(random(480));
int orientation = floor(random(10))%2; // 0 -> x, y -> 1
int direction = floor(random(10))%2; // 0 for up or right | 1 for down or left

//colors
int r = floor(random(255));
int rAddition = 1;
int g = floor(random(255));
int gAddition = 1;
int b = floor(random(255));
int bAddition = 1;

void draw() {
  // println(x,y); // debugging code
  int length = floor(random(7)); // to determine of segment
  for (int i=0; i< length; i++)
  {
    strokeWeight(10); // make the point thicker
    drawPoint(); // draw a point
    updateCoordinate();
    offScreenFix();
  }
  int nextInterval = floor(random(25, 60));
  if (frameCount%nextInterval ==0) // to change the direction
  {
    orientation();
    direction();
  }

  changeColor();
}

void offScreenFix() {
  
  //if point off screen
  if (y>478) {
    y-=1;
    println("off screen");
  } else if (y<2) {
    y+=1;
    println("off screen");
  }

  if (x>638) {
    x-=1;
    println("off screen");
  } else if (x<2) {
    x+=1;
    println("off screen");
  }
}


void updateCoordinate() {
  if (orientation == 0) {
    // do x operations
    if (direction == 0) x+=1;
    else if (direction ==1) x-=1;
  } else if (orientation == 1) {
    // do y operations
    if (direction == 1) y+=1;
    else if (direction == 0) y-=1;
  }
}


void orientation() {
  if (orientation==0) orientation = 1;
  else if (orientation==1) orientation = 0;
}

void direction() {  
  direction = floor(random(10))%2;
}

void drawPoint() {
  stroke(r, g, b);
  point(x, y);
}

void changeColor() {
  if (r==255) {
    rAddition = -1;
    r += rAddition;
  } else if (r==0) {
    rAddition = 1;
  }
  if (g==255) {
    gAddition = -1;
  } else if (g==0) {
    gAddition = 1;
  }

  if (b==255) {
    bAddition = -1;
  } else if (g==0) {
    bAddition = 1;
  }
  r += rAddition;
  g += gAddition;
  b += bAddition;
}
