% blink.ino
% Susan G. Kleinmann
% June 19, 2016

### Another Way to Blink the on-Board LED ###

The following sketch turns off the on-board LED if it is on, and turns it back on
if it is on.  It is another version of a blink pattern.  

    int LED=13; 
    int currentState;
    
    void setup (void) {
        pinMode(LED, OUTPUT);    
        digitalWrite(LED, LOW);
        currentState= 1;
    }
    
    void loop (void) {
        if (currentState == 1) {
            digitalWrite(LED, LOW);   
            currentState = 0;
        } else {
            digitalWrite(LED, HIGH);   
            currentState = 1;
        }
        delay(250);
    }

### Using a `bool` variable ###

The sketch above would use less memory if the `currentState` variable were 
declared as a `bool` type (which occupies only 1 byte) instead of an `int` type (which occupies
4 bytes).  This change of declaration means that within the `if...else` statement,
`currentState` can only be assigned the values `true` or `false`, not `0` or '`1`.

    int LED=13; 
    bool currentState;
    
    void setup (void) {
        pinMode(LED, OUTPUT);    
        digitalWrite(LED, LOW);
        currentState = false;
    }
    
    void loop (void) {
        if (currentState) {
            digitalWrite(LED, LOW);   
            currentState = false;
        } else {
            digitalWrite(LED, HIGH);   
            currentState = true;
        }
        delay(250);
    }
