## Code to Use a Proximity Sensor ##

The following code uses a PIR sensor to control an LED.  PIR sensors are
digital output devices, so they will be read as either `HIGH` or `LOW`.

When a warm object *moves* in front of the PIR sensor, its signal pin goes
`HIGH` for a period of time determined by the position of the potentiometer on the 
underside of the PIR sensor labelled `Tx`.  

Once the PIR settles down, its output goes `LOW`, and then code below will
drive the LED `LOW`.  

The PIR remains `LOW` for a period of time, typically a second or so.
After that, the PIR is ready to be triggered again by anything moving in
front of it.


    int ledPin = 8;
    int pirPin = 2;         

    void setup() {
        pinMode(ledPin, OUTPUT);
        digitalWrite(ledPin, LOW);

        pinMode(pirPin, INPUT);
    }

    void loop() {
        while (HIGH = digitalRead(pirPin)) {
            digitalWrite(ledPin, HIGH);
            delay(200);
        }
        digitalWrite(ledPin, LOW);
    }
