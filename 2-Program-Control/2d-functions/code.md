### The simple `blink` function ###

The following sketch uses the `blink` function described in the [intro to this section](index.html).

    int ledPin = 13;    // Pin number for the on-board LED
    
    void setup() {
        pinMode(ledPin,OUTPUT);
    }
    
    void loop() {
        blink(3);       // Execute 3 blinks 
        delay(2000);    // Pause before the next sequence of blinks
    }
    
    void blink(int howMany) {
        for (int i=0; i<howMany; i++) {
            digitalWrite(ledPin, HIGH);
            delay(250);
            digitalWrite(ledPin, LOW);
            delay(250);
        }
    }

### A `blink` function with several parameters ###

The following sketch invokes a function, `customBlink()`, which takes 3 arguments:

* the first argument is an `int`, and it is the number of blinks to execute

* the second argument is an `unsigned long`, and it is the time the LED will be `HIGH` or `LOW`

* the third argument is also `unsigned long`, and it is the time between blinks.

#
    int ledPin = 13;    // Pin number for the on-board LED
    
    void setup() {
        pinMode(ledPin,OUTPUT);
    }
    
    void loop() {
        customBlink(2,200,300);       // Execute 3 blinks 
        delay(2000);    // Pause before the next sequence of blinks
    }
    
    void customBlink(int howMany, unsigned long blinkTime, unsigned long delayBetweenBlinks) {
        for (int i=0; i<howMany; i++) {
            digitalWrite(ledPin, HIGH);
            delay(blinkTime);
            digitalWrite(ledPin, LOW);
            delay(blinkTime);
        }
        delay(delayBetweenBlinks);
    }

