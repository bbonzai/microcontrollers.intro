%
% Susan G. Kleinmann
% June 22, 2016

In this sketch, it is assumed that the pushbutton is wired up so that when it 
is pressed, it connects an I/O pin to `GND`.  That I/O pin is initialized as 
an `INPUT_PULLUP` type; therefore it is normally in the `HIGH` state.
When the button is pressed, the pin goes `LOW`; then

* if the LED is already off, it is turned on, or
* if the LED is already on, it is turned off.

Note that it takes <10 microseconds to execute `loop()` function.  A typical 
switch takes about 1000 times this long to settle down after having been pushed.
So, suppose the sketch has a `delayTime` of 0, and suppose that the `ledState` is
initially `-1`.  Then someone pushes the button.  The following sequence of events 
is likely:

1.  The `buttonState` is detected as `LOW`, so the `ledState` is changed to `+1`,
and the LED is turned `ON`. This whole process takes less than 10 microSeconds.

2.  On the next iteration of the loop, the `buttonState` is read again.  This time,
it's still depressed (because real people don't move their finger as fast as 10 microSeconds).
So the `ledState` is changed *again*, and the LED is turned off (`LOW`).  Since this
occurs only a few microSeconds after it was turned on, you never see it.

3.  On the 50th iteration of the loop, the `buttonState` might be `HIGH` or `LOW`
(we don't know which, because it's still bouncing around).  So the `ledState` might
be changed yet again.

4.  On the 5000th iteration of the loop, the `buttonState` will be `LOW`, and the
`ledState` will remain unchanged from whatever it was the last time the `buttonState`
was `HIGH`.

By implementing a `delayTime` after the *first* time the `ledState` is changed,
the sketch ensures that on the next loop, the `buttonState` will be read as `HIGH`
(i.e., the button is not being pressed), and the `ledState` will be remain in its
new state.

    const int led=8; 
    const int button= 12; 
     
    void setup() {
        pinMode(led, OUTPUT);
        pinMode(button, INPUT_PULLUP);
    }
    
    int buttonState = LOW; 
    int ledState = -1; 
    
    void loop() {
        buttonState = digitalRead(button);
        if (buttonState == LOW) {
            if (ledState < 0) {
                digitalWrite(led, HIGH);
            } else {
                digitalWrite(led, LOW); 
    	    } 
            ledState = -ledState;
        } 
    }

