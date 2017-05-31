% blink.ino
% Susan G. Kleinmann
% May 21, 2016

    /* Blink an external LED attached to pin 8 */
     
    int LED=8; 
    
    void setup (void) {
        pinMode(LED, OUTPUT);    
        digitalWrite(LED, LOW);
    }
    
    void loop (void) {
        digitalWrite(LED, HIGH);   // Turn the LED on.
        delay(1000);               // Leave it on for 1000 ms, which is 1s.
        digitalWrite(LED, LOW);    // Turn the LED off.
        delay(1000);               // Leave it off for 1000 ms.
    }
