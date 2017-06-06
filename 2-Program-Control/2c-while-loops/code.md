The first sketch below just shows how to replace a `while` loop with a `for` loop. 

The second sketch illustrates a case where `while` is more appropriate than
`for`.  Whereas `for` loops specify a specific number of iterations, `while` loops
can go on (forever) until some condition is met.  


### Replacing `for` with `while` ###

This script blinks the on-board LED in a pattern of 3 short blinks, followed by
3 long blinks, followed by 3 short blinks, followed by a long delay.  This is the light
pattern corresponding to the Morse code for "SOS".

    /* Blink the on-board LED in a pattern to display SOS */
    int LED=13; 
    
    void setup (void) {
        pinMode(LED, OUTPUT);    
        digitalWrite(LED, LOW);
    }
    
    void loop (void) {
        /* Make 3 short blinks, corresponding to the letter 'S' */
        int i=0;
        while (i < 3) {
            digitalWrite(LED, HIGH);   
            delay(50);               
            digitalWrite(LED, LOW);    
            delay(500);               
            i = i+1;
        }

        i = 0;
        /* Make 3 long blinks, corresponding to the letter 'O' */
        while (i < 3) {
            digitalWrite(LED, HIGH);   
            delay(500);               
            digitalWrite(LED, LOW);    
            delay(500);               
            i = i+1;
        }

        i = 0;
        /* Make 3 short blinks, corresponding to the letter 'S' */
        while (i < 3) {
            digitalWrite(LED, HIGH);   
            delay(50);               
            digitalWrite(LED, LOW);    
            delay(500);               
            i = i+1;
        }

        /* Now pause for a second, corresponding to the spacing between "SOS" calls */
        delay(1000);
    }


### Exploiting `while` ###

Unlike a `for` loop which goes through a preset number of iterations, a `while` loop
is useful when you don't know ahead of time how many iterations would be needed to
satisfy some condition.  The following sketch sets up a rapidly blinking LED
(ontime is only 20 msec, and offtime is 100msec), and then uses a `while` loop
to stop the blinking after 5 seconds.

To make this work, the sketch uses Arduino's internal clock.  Unlike a real
clock that reports the time in some universal standard (e.g., Eastern Dayling
Savings Time), Arduino's `millis()` "clock" reports the number of seconds since
the board was last reset.  This is sufficient for the purposes of this sketch.

    void loop (void) {
        int ontime  = 20;
        int offtime = 100;

        // Blink for 5 seconds 
        long int t0 = millis(); 
        long int dt = 0;
        while ( dt < 5000) {
            digitalWrite(LED, HIGH);   
            delay(ontime);               
            digitalWrite(LED, LOW);    
            delay(offtime);               
            dt = millis() - t0;
        }

        delay(1000);
    }

