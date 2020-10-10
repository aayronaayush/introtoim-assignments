PImage img;
int counter = 0;

void setup() {
  size(1280, 720);
  img = loadImage("scene.jpg");
  image(img, 0, 0, width, height);
}

void draw() {
}

void keyPressed() {
  if (keyCode==49) { //1
    invertRGB();
  } else if (keyCode==50) { //2
    invertR();
  } else if (keyCode==51) { //3
    invertG();
  } else if (keyCode==52) { //4
    invertB();
  } else if (keyCode==53) { //5
    swapPixels();
  } else if (keyCode == 54){ //6
    exagerate();
  }
  else { //anything else
    drawOriginal();
  }
}


void invertRGB() {
  //img = loadImage("scene.jpg");
  //image(img, 0, 0, width, height);
  loadPixels();
  for (int i=0; i<width*height; i++) {
    int r = (int)red(pixels[i]); //get red value
    int g = (int) green(pixels[i]); // get green value
    int b = (int) blue(pixels[i]); //get blue value
    color c = color(255-r, 255-g, 255-b); // take the complement of the rgb values
    pixels[i] = c; //set the new color value
  }
  updatePixels(); //update the pixels on screen
}

void invertR() {
  //img = loadImage("scene.jpg");
  //image(img, 0, 0, width, height);
  loadPixels();
  for (int i=0; i<width*height; i++) {
    int r = (int)red(pixels[i]); //get red value
    int g = (int) green(pixels[i]); // get green value
    int b = (int) blue(pixels[i]); //get blue value
    color c = color(255-r, g, b); // take the complement of the rgb values
    pixels[i] = c; //set the new color value
  }
  updatePixels(); //update the pixels on screen
}

void invertG() {
  //img = loadImage("scene.jpg");
  //image(img, 0, 0, width, height);
  loadPixels();
  for (int i=0; i<width*height; i++) {
    int r = (int)red(pixels[i]); //get red value
    int g = (int) green(pixels[i]); // get green value
    int b = (int) blue(pixels[i]); //get blue value
    color c = color(r, 255-g, b); // take the complement of the rgb values
    pixels[i] = c; //set the new color value
  }
  updatePixels(); //update the pixels on screen
}

void invertB() {
  //img = loadImage("scene.jpg");
  //image(img, 0, 0, width, height);
  loadPixels();
  for (int i=0; i<width*height; i++) {
    int r = (int)red(pixels[i]); //get red value
    int g = (int) green(pixels[i]); // get green value
    int b = (int) blue(pixels[i]); //get blue value
    color c = color(r, g, 255-b); // take the complement of the rgb values
    pixels[i] = c; //set the new color value
  }
  updatePixels(); //update the pixels on screen
}

void drawOriginal() {
  image(img, 0, 0, width, height);
}

void swapPixels() {
  //img = loadImage("scene.jpg");
  //image(img, 0, 0, width, height);
  loadPixels();
  //println(pixels[1]);
  //println(pixels[width*height-2]);
  
  for(int i=0;i<(width*height)/2;i++){
   int temp;
   temp = pixels[i];
   pixels[i] = pixels[width*height-1-i];
   pixels[width*height-1-i] = temp;
  }
  
  updatePixels();
  //println(pixels[1]);
}

void exagerate(){
  //img = loadImage("scene.jpg");
  //image(img, 0, 0, width, height);
  loadPixels();
  for (int i=0; i<width*height; i++) {
    int r = (int)red(pixels[i]); //get red value
    int g = (int) green(pixels[i]); // get green value
    int b = (int) blue(pixels[i]); //get blue value
    int randomR = (int) random(255);
    int randomG = (int) random(255);
    int randomB = (int) random(255);
    color c = color((r+randomR), (g+randomG), (b+randomB)); // take the complement of the rgb values
    pixels[i] = c; //set the new color value
  }
  updatePixels(); //update the pixels on screen
}
