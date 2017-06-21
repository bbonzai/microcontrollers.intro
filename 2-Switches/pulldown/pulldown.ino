int LED = 10;
int SW = 4;

void setup(void) {
  Serial.begin(9600);
  pinMode(LED, OUTPUT);
  digitalWrite(LED, LOW);
  pinMode(SW, INPUT_PULLUP);
}

void loop() {
  
  if (! digitalRead(SW)) {
      digitalWrite(LED, HIGH);
  }
  delay(200);
  
  Serial.print("Switch input: ");
  Serial.println(digitalRead(SW));
  digitalWrite(LED, LOW);
}

void blink() {
    digitalWrite(LED, HIGH);
    delay(500);
    digitalWrite(LED, LOW);
    delay(500);
}
