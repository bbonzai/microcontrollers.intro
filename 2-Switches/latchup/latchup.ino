int LED = 10;
int SW = 4;
int ledState = LOW; 

void setup(void) {
  Serial.begin(9600);
  pinMode(LED, OUTPUT);
  digitalWrite(LED, ledState);
  pinMode(SW, INPUT_PULLUP);
}

void loop() {
  if (! digitalRead(SW)) {
    ledState = ! ledState;
    digitalWrite(LED, ledState);
  }
  delay(200);
}
