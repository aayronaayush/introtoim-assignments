int led1 = 3;
int led2 = 2;
int enter = 8;
int dot = 9;
int dash = 10;
int buttonDelay = 400;
int wrong = 7;
int correct = 6;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(led1,OUTPUT);
  pinMode(led2,OUTPUT);
  pinMode(enter,INPUT);
  pinMode(dot,INPUT);
  pinMode(dash,INPUT);
  pinMode(wrong,OUTPUT);
  pinMode(correct,OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  if (digitalRead(dot)==1){
    // send a 1 to processing
    Serial.write(1);
    digitalWrite(led1,HIGH);
    delay(buttonDelay);
    digitalWrite(led1,LOW);
  }
  
  else if(digitalRead(dash)==1){
    // send a 2 to processing
    Serial.write(2);
    digitalWrite(led1,HIGH);
    digitalWrite(led2,HIGH);
    delay(buttonDelay);
    digitalWrite(led1,LOW);
    digitalWrite(led2,LOW);
  }
  
  else if(digitalRead(enter)==1){
    Serial.write(3);
    delay(buttonDelay);
  }

  if (Serial.available()>0){
    int data = Serial.read();
    if (data == 100){
      digitalWrite(wrong,HIGH);
      delay(100);
      digitalWrite(wrong,LOW);
    } else if(data == 101){
      digitalWrite(correct,HIGH);
      delay(100);
      digitalWrite(correct,LOW);
    }
  }
}

/* 
 *  1 for dot 
 *  2 for dash
 *  3 for enter
 */
