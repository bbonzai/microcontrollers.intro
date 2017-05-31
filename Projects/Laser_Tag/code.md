## Basic Game Setup ##

    #include <Servo.h>
    
    int GREENLED = 2;
    int REDLED = 4;
    int SERVOPIN = 9;
    int PHOTOCELLPIN = 0;
    int WAITFORRESET = 5000;
    
    int photocellReading;
    int servoPos;
    
    Servo s;
    
    void setup() {
        pinMode(GREENLED, OUTPUT);
        pinMode(REDLED, OUTPUT);
        Serial.begin(9600);
        servoPos = 90;
        s.write(servoPos);
        s.attach(SERVOPIN);
        delay(500);
        servoPos = 0;
        s.write(servoPos);
        delay(500);
    }
    
    void loop() {
      photocellReading = analogRead(PHOTOCELLPIN); 
      Serial.print("Analog reading = ");
      Serial.print(photocellReading);
      Serial.print("\tservoPos = ");
      Serial.println(servoPos);
      if (photocellReading > 900) {
        servoPos += 1;
      } else {
        if (servoPos > 0) servoPos -= 1;
      }
      s.write(servoPos);
    
      if (servoPos >= 180) {
        flashLeds();
        // delay(WAITFORRESET);
        servoPos = 0;
        s.write(servoPos);
        delay(WAITFORRESET);
      }
    }
    
    void flashLeds() {
      for (int i=0; i<3; i++) {
        digitalWrite(GREENLED, HIGH);
        digitalWrite(REDLED, HIGH);
        delay(200);
        digitalWrite(GREENLED, LOW);
        digitalWrite(REDLED, LOW);
        delay(200);
      }
    }
