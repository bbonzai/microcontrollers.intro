int LED = 10;
int SW = 4;
int ledState; 

void setup(void) {
  pinMode(LED, OUTPUT);
  digitalWrite(LED, LOW);
  pinMode(SW, INPUT);
  ledState = digitalRead(SW);
}

void loop() {
  if (digitalRead(SW)) {
    ledState = ! ledState;
    digitalWrite(LED, ledState);
  }
  delay(1000);
}
