// use static array to store the recorded codes
int message[500];
int messageSize = 0;
int sos[9] = {0, 0, 0, 1, 1, 1, 0, 0, 0};
int playSos = true;
//pins
int dashPin = 12;
int dotPin = 11;
int recordStopPin = 10;
int playPin = 9;

//one led is dot
//two leds are dash
int led1Pin = 3;
int led2Pin = 2;
int recordPin = 4;
int playingLedPin = 5;

//flags
bool record = false;
bool isPlaying = false;


void setup() {
  Serial.begin(9600);
  pinMode(dashPin, INPUT);
  pinMode(dotPin, INPUT);
  pinMode(recordStopPin, INPUT);
  pinMode(playPin, INPUT);
  pinMode(led1Pin, OUTPUT);
  pinMode(led2Pin, OUTPUT);
  pinMode(recordPin, OUTPUT);
  pinMode(playingLedPin, OUTPUT);
//  play(sos, 9);/
}

void loop() {
  readPin();
  if (record) {
    digitalWrite(recordPin, HIGH);
  } else {
    digitalWrite(recordPin, LOW);
  }
  if (isPlaying) {
    digitalWrite(playingLedPin, HIGH);
    play(message, messageSize);
  } else {
    digitalWrite(playingLedPin, LOW);
  }

  if (playSos) {
    play(sos, 9);
    playSos = false;
  }
}

// register a dash
void registerDash() {
  addDigit(1);
}

// register a dot
void registerDot() {
  addDigit(0);
}

// add the digit to the array
void addDigit(int add) {
  message[messageSize] = add;
  Serial.println(message[messageSize]);
  messageSize++;
}

//
void readPin() {
  if (digitalRead(dashPin) == HIGH && !isPlaying) {
    if (record) {
      registerDash();
    }
    digitalWrite(led1Pin, HIGH);
    digitalWrite(led2Pin, HIGH);
    delay(500);
    digitalWrite(led1Pin, LOW);
    digitalWrite(led2Pin, LOW);
  }
  if (digitalRead(dotPin) == HIGH && !isPlaying) {
    if (record) {
      registerDot();
    }
    digitalWrite(led1Pin, HIGH);
    delay(500);
    digitalWrite(led1Pin, LOW);
  }

  if (digitalRead(recordStopPin) == HIGH && !isPlaying) { //set recording state
    Serial.println("record/stop");
    record = !record;
    delay(500);
  }

  if (digitalRead(playPin) == HIGH && !record) {
    Serial.println("play");
    isPlaying = !isPlaying;
    delay(500);
  }
}

int play(int arr[], int arrSize) {
  for (int i = 0; i < arrSize; i++) {
    if (arr[i] == 1) {
      digitalWrite(led1Pin, HIGH);
      digitalWrite(led2Pin, HIGH);
      delay(500);
      digitalWrite(led1Pin, LOW);
      digitalWrite(led2Pin, LOW);
    }
    if (arr[i] == 0) {
      digitalWrite(led1Pin, HIGH);
      delay(500);
      digitalWrite(led1Pin, LOW);
    }
    delay(500);
  }
  isPlaying = false;
  return 0;
}

//notes
// -1 is invalid
// 0 is a dot
// 1 is a dash
// first button is for registering a dash
// second button is for registering a dot
// third button is to record
// forth button is to play the saved recording
