## Sketches with a User-Defined Function ##

Of course, every Arduino sketch by default has two 
user-defined functions:

* `init()` and 

* `loop`.

This example below is a case where the sketch employs another function.

### Signalling the Morse Code for "SOS" Using the on-Board LED ###

The following sketch defines two user-defined functions:

* `initLed`, which is invoked only once, from within the `init` function.

* `blink`, which is repeatedly invoked within the `loop` function.

All of the timing specs are from the Wikipedia 
description of [Morse Code](https://wikipedia.org/wiki/Morse_code).
Each iteration of the statements in `loop` should produce a light
signal that would be interpreted as "SOS".

    int ledPin = 13;               // Pin number for the on-board LED

    int dit = 100;                 // Morse code "dit", 0.1s 
    int dah = 3 * dit;             // Morse code "dah", 3 times the length of a dit

    int interBitDelay = dit;       // Delay between bits of one char
    int interCharDelay = 3 * dit;  // Delay between one char and the next char
    int interWordDelay = 7 * dit;  // Delay after each word.
    
    void setup() {
        initLED(ledPin);
        blink(ledPin, 100, 1000);  // blink for only 0.1s
    }
    
    void loop() {
        blink(ledPin, dit, interBitDelay);     // Dit-Dit-Dit == Morse code 'S'
        blink(ledPin, dit, interBitDelay);     
        blink(ledPin, dit, interCharDelay);     

        blink(ledPin, dah, interBitDelay);     // Dah-Dah-Dah == Morse code 'O'
        blink(ledPin, dah, interBitDelay);     
        blink(ledPin, dah, interCharDelay);     

        blink(ledPin, dit, interBitDelay);     // Dit-Dit-Dit == Morse code 'S'
        blink(ledPin, dit, interBitDelay);     
        blink(ledPin, dit, interCharDelay);     

        digitalWrite(ledPin, LOW);             // Longer delay til next word
        delay(interWordDelay);
    }
    
    void initLED(int pin) {
        pinMode(ledPin,OUTPUT);
        digitalWrite(pin, LOW);
    }

    void blink(int pinNumber, int onTime, int offTime) {
        digitalWrite(pinNumber, HIGH);
        delay(onTime);
        digitalWrite(ledPin, LOW);
        delay(offTime);
    }

