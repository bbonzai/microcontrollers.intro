% blink.ino
% Susan G. Kleinmann
% June 29, 2016

The following sketches show how to make a note close to Middle C and a note close 
to High C on a piezo buzzer. The table below shows the relevant parameters:

| Note       | Approximate Frequency | Period | Half-Period | # of Vibrations for a 1s sound |
|:----------:|:---------------------:|:------:|:-----------:|:------------------------------:|
| "Middle C" | 250 Hz                | 4 ms   | 2 ms        | 250                            |
| "High C"   | 500 Hz                | 2 ms   | 1 ms        | 500                            |

The sketches make a sound of a given frequency by:

1.  Setting the buzzer into a `HIGH` state for the half-period of the desired sound, then
2.  Setting the buzzer into a `LOW` state for the half-period of the desired sound.

### Version 1, using `delay()` ###

The following sketch uses `delay()` to set the buzzer in its `HIGH` then `LOW` states.
The `delay()` function takes one argument, which is of type `long int`, meaning 
it can take any integer value from -2,147,483,647 to 2,147,483,647.  (Negative 
values would however make no sense.)  The argument to `delay()` is time in units 
of ms, so the smallest half-period it can make is 1 ms.  

    int BUZZER=7; 
    
    void setup (void) {
        pinMode(BUZZER, OUTPUT);    
        digitalWrite(BUZZER, LOW);
    }
    
    void loop (void) {
        for (int i=0; i<250; i++) { 
            digitalWrite(BUZZER, HIGH);   // Set the buzzer on a HIGH voltage
            delay(2);                     // Leave it HIGH for only 1 ms.
            digitalWrite(BUZZER, LOW);    // Set the buzzer on a LOW voltage
            delay(2);                     // Leave it LOW for 1 ms.
        }

        delay(1000);                      // Wait a second between tones.
    }

### Version 2, using `delayMicroseconds()` ###

Since `delay()` cannot use any argument smaller than 1 to make a sound, the
highest frequency sound it can make is 500 Hz, which is actually not quite as
high as a real "High C" note.  So, rather than use `delay()` to make high
frequency sound, use `delayMicroseconds()`, which can produce much shorter
delays. `delayMicroseconds()` takes one argument, which is an 
unsigned integer value in units of microsec.  

    delay(1) = delayMicroseconds(1000)

(Recall, an unsigned int can take on values from 0 through 65,535; therefore,
the maximum delay that `delayMicroseconds()` can cause is 65 ms.  Longer delays
require the use of the standard `delay()` function.)

Using `delayMicroseconds()`, the previous sketch can be revised this way:

        for (int i=0; i<250; i++) { 
            digitalWrite(BUZZER, HIGH);   
            delayMicroseconds(2000);      
            digitalWrite(BUZZER, LOW);    
            delayMicroseconds(2000);      
        }

(To make a "real" Middle C, the argument to `delayMicroseconds()` should actually be
1911, not 2000.)

