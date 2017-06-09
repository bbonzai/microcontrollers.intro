## Code to Drive a Solenoid Motor ##

The code for this circuit is just like the 
[code to blink an LED](../../1-LED/1b-ExternalLED/code.html)!

Caution:  The `delay()` time used in this code is > 1ms.  That is
OK for a circuit like the one used here.  If the delay time got 
much smaller, e.g., in the range of 1 microsecond, then it the
circuit should be redesigned to include another transistor to
control current flow to the MOSFET.  This additional transistor,
could provide fast response to rapid signal changes, and
protect the MOSFET from overheating.

### Code to "Blink" the Solenoid ###

The following sketch turns on the solenoid for 1.5s,
then turns it off for 4s.

    int solenoidPin=3;

    void setup() {
        pinMode(solenoidPin, OUTPUT);
        digitalWrite(solenoidPin, LOW);
    }

    void loop() {
        digitalWrite(solenoidPin, HIGH);
        delay(1500);
        digitalWrite(solenoidPin, LOW);
        delay(4000);
    }

