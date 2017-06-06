## Blink an External LED ##

This program is a simple modification of the 
[program to control the on-board LED](../1a-OnBoardLED/code.html):  
just change the value of the pin associated with the LED being
controlled:

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
