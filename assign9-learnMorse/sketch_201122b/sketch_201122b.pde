import processing.serial.*;

Serial port;

int[][] morseCode = {
  {1, 2}, //a
  {2, 1, 1, 1}, //b
  {2, 1, 2, 1}, //c
  {2, 1, 1}, //d
  {1}, //e
  {1, 1, 2, 1}, //f
  {2, 2, 1}, //g
  {1, 1, 1, 1}, //h
  {1, 1}, //i
  {1, 2, 2, 2}, //j
  {2, 1, 2}, //k
  {1, 2, 1, 1}, //l
  {2, 2}, //m
  {2, 1}, //n
  {2, 2, 2}, //o
  {1, 2, 2, 1}, //p
  {2, 2, 1, 2}, //q
  {1, 2, 1}, //r
  {1, 1, 1}, //s
  {2}, //t
  {1, 1, 2}, //u
  {1, 1, 1, 2}, //v
  {1, 2, 2}, //w
  {2, 1, 1, 2}, //x
  {2, 1, 2, 2}, //y
  {2, 2, 1, 1} //z
};


int currentAlphabet;
ArrayList<Integer> input = new ArrayList<Integer>();
int recInput = -1;
String inputStr = "";
/*
the ascii for uppercase alphahets range from 65[A] to 90[Z]
 */

void setup() {
  size(600, 600);
  //println(morseCode.length);
  generateNewLetter();
  //printArray(Serial.list());
  String portname = Serial.list()[0];
  port = new Serial(this, portname, 9600);
  println(portname);
}

void draw() {
  background(167);
  displayLetter();
  displayInput();
}

void generateNewLetter() {
  currentAlphabet = floor(random(26));
}

void displayLetter() {
  // (char)(currentAlphabet+65) -> this will give the letter based on current alphabet index
  pushStyle();
  fill(0);
  textAlign(CENTER);
  textSize(200);
  text((char)(currentAlphabet+65), width/2, height/2);
  popStyle();
}

void displayInput() {
  pushStyle();
  fill(0);
  textAlign(CENTER);
  textSize(72);
  text(inputStr, width/2, height/2+200);
  popStyle();
}

void serialEvent(Serial port) {
  recInput = port.read();
  if (recInput == 1) {
    input.add(recInput);
    inputStr+=" *";
  } else if (recInput==2) {
    input.add(recInput);
    inputStr+=" -";
  } else if (recInput == 3)
  {
    if (checkCorrect()) {
      port.write(101);
    } else if (!checkCorrect()) {
      port.write(100);
    }
    inputStr = "";
    input.clear();
    generateNewLetter();
    println("enter was pressed");
  }
}

boolean checkCorrect() {
  boolean correct = true;
  if (morseCode[currentAlphabet].length == input.size()) {
    for (int i=0; i<morseCode[currentAlphabet].length; i++) {
      if (morseCode[currentAlphabet][i] != input.get(i)) {
        correct = false;
        break;
      }
    }
  } else {
    correct = false;
  }
  println(correct);
  return correct;
}
