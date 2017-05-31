% blink.ino
% Susan G. Kleinmann
% May 21, 2016

The following sketch blinks the on-board LED in a pattern of 3 short blinks, followed by
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
        for (int i=0; i<3; i++) {
            digitalWrite(LED, HIGH);   
            delay(50);               
            digitalWrite(LED, LOW);    
            delay(500);               
        }

        /* Make 3 long blinks, corresponding to the letter 'O' */
        for (int i=0; i<3; i++) {
            digitalWrite(LED, HIGH);   
            delay(500);               
            digitalWrite(LED, LOW);    
            delay(500);               
        }

        /* Make 3 short blinks, corresponding to the letter 'S' */
        for (int i=0; i<3; i++) {
            digitalWrite(LED, HIGH);   
            delay(50);               
            digitalWrite(LED, LOW);    
            delay(500);               
        }

        /* Now pause for a second, corresponding to the spacing between "SOS" calls */
        delay(1000);
    }

### Better Coding:  Give Names to Your Delay Times ###

A much better way to write the program above is to give names to the delay times.
That way, if you choose to re-write the program with slightly different delay times,
you only need to modify the statements where you initialized them:

    void loop (void) {
        int dit = 50;
	int dah = 500;
	int gap = 500;
	int endOfMessage = 1000;

        /* Make 3 short blinks, corresponding to the letter 'S' */
        for (int i=0; i<3; i++) {
            digitalWrite(LED, HIGH);   
            delay(dit);               
            digitalWrite(LED, LOW);    
            delay(gap);               
        }

        /* Make 3 long blinks, corresponding to the letter 'O' */
        for (int i=0; i<3; i++) {
            digitalWrite(LED, HIGH);   
            delay(dah);               
            digitalWrite(LED, LOW);    
            delay(gap);               
        }

        /* Make 3 short blinks, corresponding to the letter 'S' */
        for (int i=0; i<3; i++) {
            digitalWrite(LED, HIGH);   
            delay(dit);               
            digitalWrite(LED, LOW);    
            delay(gap);               
        }

        /* Now pause for a second, corresponding to the spacing between "SOS" calls */
        delay(endOfMessage);
    }

