## Sketch to control 3 LEDs ##

The sketch below causes three LEDs with the colors red, yellow, and green, to light up
in sequence like a traffic light.

    /* Blink a series of external LEDs attached to pins 8, 9, and 10 */
     
    int rLED=8; 
    int yLED=9; 
    int gLED=10; 
    
    void setup() {
        pinMode(rLED, OUTPUT);
        pinMode(yLED, OUTPUT);
        pinMode(gLED, OUTPUT);
        digitalWrite(rLED, LOW);
        digitalWrite(yLED, LOW);
        digitalWrite(gLED, LOW);
    }
    
    void loop() {
        digitalWrite(rLED, HIGH);   // Turn on the red light for 2s
        delay(2000);                // Red lights take a loooong time
        digitalWrite(rLED, LOW);    // Turn off the red light and immediately turn on yellow
        digitalWrite(yLED, HIGH);
        delay(250);                 // Doesn't it seem as if yellow lights are always really short?
        digitalWrite(yLED, LOW);
        digitalWrite(gLED, HIGH);   // Turn on the green light for only 1s
        delay(1000);                // Green lights always seem too short!
        digitalWrite(gLED, LOW);
    }
