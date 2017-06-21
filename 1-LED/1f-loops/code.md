## Sample Coding for `for` and `while` loops ##

### `for` loop ###

The following sketch blinks the on-board LED in a pattern of 3 short blinks, followed by
3 long blinks, followed by 3 short blinks, followed by a long delay.  This is the light
pattern corresponding to the Morse code for "SOS".

    /* Blink the on-board LED in a pattern to display SOS */
    /* 
     
    int LED=13;                   // Pin number for on-board LED
    int dit = 100;                // 0.1s for Morse 'dit'
    int dah = 3 * dit;            // 0.3s for Morse 'dah' 
    int interBitDelay = dit;      // Delay between bits
    int interCharDelay = 3 * dit; // Delay between characters
    int interWordDelay = 7 * dit; // Delay between words
    
    void setup (void) {
        pinMode(LED, OUTPUT);    
        digitalWrite(LED, LOW);
    }
    
    void loop (void) {
        for (int i=0; i<3; i=i+1) {     // Make 3 short blinks, corresponding to 'S'   
            digitalWrite(LED, HIGH);   
            delay(dit);               
            digitalWrite(LED, LOW);    
            delay(interBitDelay);               
        }

        delay(interCharDelay);
        for (int i=0; i<3; i=i+1) {     // Make 3 long blinks, corresponding to 'O'
            digitalWrite(LED, HIGH);   
            delay(dah);               
            digitalWrite(LED, LOW);    
            delay(interBitDelay);               
        }
        delay(interCharDelay);

        for (int i=0; i<3; i=i+1) {     // Make 3 short blinks, corresponding to 'S'
            digitalWrite(LED, HIGH);   
            delay(dit);               
            digitalWrite(LED, LOW);    
            delay(interBitDelay);               
        }
        delay(interWordDelay);          // Longer delay before sending the next "SOS"
    }

### Better Coding:  Use Functions; Use Shortcut for Incrementing ###

The following re-write of the above `loop` function streamlines it in two ways:

* The 3 `for` loops are relegated to a function.

* Within the `for` loop, a `C` shortcut is used to increment the loop counter.

    void loop (void) {
        blink(dit,3);
        delay(interCharDelay);
        blink(dah,3);
        delay(interCharDelay);
        blink(dit,3);
        delay(interWordDelay);
    }

    void blink(int onTime, int nBlinks) {
        for (int i = 0; i < nBlinks; i = i++) {  // Use C shortcut to increment counter
            digitalWrite(LED, HIGH);   
            delay(onTime);                       // LED stays on for onTime msec 
            digitalWrite(LED, LOW);    
            delay(interBitDelay);       
        }
    }

### `while` loop ###

One can achieve the same effect as the `for` loop with the following re-write of the
function `blink`:


    void blink(int onTime, int nBlinks) {
        int i = 0;
        while (i < nBlinks) {     
            digitalWrite(LED, HIGH);   
            delay(onTime);                 
            digitalWrite(LED, LOW);    
            delay(interBitDelay);       
            i=i++;
        }
    }
