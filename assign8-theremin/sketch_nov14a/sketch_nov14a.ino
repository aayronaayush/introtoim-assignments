int ldrPin = A0;
int playButton = 7;

bool multiplyFrequency = false;
int prevButtonState = LOW;

void setup() {
  Serial.begin(9600);
  pinMode(ldrPin, INPUT);
  pinMode(playButton, INPUT);
}

void loop() {
  changeState();
  Serial.println(multiplyFrequency);
  //  int ultSonData = getUltraSonicData();
  int ldrData = getLDRData();
  //  int transformed = transformData(related);
  if (multiplyFrequency) {
    tone(4, ldrData * 1.5);
  } else {
    tone(4, ldrData);
  }

}

float getLDRData() {
  return floor(analogRead(ldrPin));
}

float changeState() {
  //  Serial.println(digitalRead(playButton));
  if (prevButtonState == LOW && digitalRead(playButton) == HIGH) {
    multiplyFrequency = !multiplyFrequency;
  }
  prevButtonState = digitalRead(playButton);
}
