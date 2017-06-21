int LED = 10;
int SW = 4;

int ledState = LOW;
int waitTime = 150;
bool waitedLongEnough = false;
int startTime;

void setup() {
  pinMode(LED, OUTPUT);
  pinMode(SW, INPUT);
  digitalWrite(LED, ledState);
  startTime = millis();
  Serial.begin(57600);
}

void loop() {
  if (waitedLongEnough == true) {
    if (digitalRead(SW)) {   
      ledState = !ledState;
      digitalWrite(LED, ledState);
      waitedLongEnough = false;
      startTime = millis();
    }
  } else {
    if ((millis() - startTime) > waitTime) waitedLongEnough = true;
    Serial.println(millis() - startTime);
  }
}
