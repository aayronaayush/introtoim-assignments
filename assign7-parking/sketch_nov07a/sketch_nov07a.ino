// echo produces a pulse when reflected signal is received
// the reflected signal is the one that is sent by the trig pin
int trigPin = 10;
int echoPin = 9;
int statusLedPin = 2;
int prevState = LOW;
int button = 4;
int warningPin = 5;
float distance = 10;
bool parking = false;
int delayMS = 0;
int interval = 500;
unsigned long prevTime = 0;
int warningState = LOW;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(statusLedPin, OUTPUT);
  pinMode(button, INPUT);
  pinMode(warningPin, OUTPUT);

}

void loop() {
  changeState();
  parkingState();
  if (parking) {
    distance = getDistance();
    calculateDelay();
    blinkLed();
    //    Serial.println(delayMS);
  }
  if (!parking && warningState == HIGH) {
    warningState = LOW;
    digitalWrite(warningPin, warningState);
  }
}

float getDistance() {
  digitalWrite(trigPin, LOW); // no signal is sent
  delayMicroseconds(2);

  digitalWrite(trigPin, HIGH); // after 2ms a signal is sent
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW); // signal is not sent after 10 ms

  // read the time taken for the pulse to return
  float duration = pulseIn(echoPin, HIGH);

  // calculate the distance
  return duration * 0.034 / 2;
}

void changeState() {
  if (digitalRead(button) == HIGH && prevState == LOW) {
    //    if (parking) {
    //      parking = false;
    //    } else if (!parking) {
    //      parking = true;
    //    }

    //refactor
    parking = !parking;
  }
  prevState = digitalRead(button);
}

void parkingState() {
  if (parking) {
    digitalWrite(statusLedPin, HIGH);
    //    digitalWrite(warningPin, LOW);
  } else if (!parking) {
    digitalWrite(statusLedPin, LOW);
    //    digitalWrite(warningPin, HIGH);
  }
}

void calculateDelay() {
  if (distance >= 5 && distance <= 25) {
    delayMS = (int) 35 * distance - 75;
  } else if (distance < 5) {
    delayMS = 100;
  } else if (distance > 25) {
    delayMS = 800;
  }
}

void blinkLed() {
  Serial.println("calling");
  unsigned long currTime = millis();
  if (currTime - prevTime >= delayMS) {
    prevTime = currTime;
    if (warningState == LOW) {
      warningState = HIGH;
    } else {
      warningState = LOW;
    }
    digitalWrite(warningPin, warningState);
  }
}
