%
% Susan G. Kleinmann
% June 2, 2016

Explanation here...

    int ledPin = 8;
    int pirPin = 2;

    void setup() {
        pinMode(ledPin, OUTPUT);
    }

    void loop() {
        if (digitalRead(pirPin)) {
            digitalWrite(ledPin, HIGH);
            delay(200);
        }
        digitalWrite(ledPin, LOW);
    }
