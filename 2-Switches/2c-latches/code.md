## Code for a Pushbutton as a Latch ##

These sketches show how debouncing improves the reliability
of a pushbutton.  All of them use the [circuit](../circuit.html#pulldown)
with an LED and a pushbutton attached to a digital I/O pin with an 
external pull-down resistor.

### Attempt #1:  No Debouncing ###

The sketch initializes an LED to be in the `OFF` position.

The state of the I/O pin attached to the switch is normally `LOW` when the 
button is not pressed.  Therefore when the switch is not pressed, the 
expression

    digitalRead(SW);

should be `LOW` (or `false` or `0`; they are all the same).  Therefore
the block of statements in the clause beginning:

    if (digitalRead(SW)) { ... }

is only executed if/when the switch is pressed.

The `if` statement could also have been written in these equivalent ways:

    if (digitalRead(SW) == true) { ... }
    if (digitalRead(SW) == 1) { ... }

Whichever way you write it, all of the above `if` statements
are equivalent to asking "Is the button being pressed?"

Whenever the button is pressed, the sketch is designed to change the 
state of the LED (from off to on, or from on to off).  To do that,
it changes the value of the `ledState` to be the opposite of what it
had been before the button was pressed.  The statement:

    ledState = ! ledState

takes the current value of `ledState`, applied the `!` ("not") operator 
to it, and then assigns that new value to the variable `ledState`.  
So if the LED was in the `ON` state, the new state will be `OFF`.
and vice versa.  Then the sketch writes this new state to the LED. 

    int LED = 10;
    int SW = 4;
    
    int ledState = LOW;  // Start out with the LED turned off.

    void setup(void) {
      pinMode(LED, OUTPUT);
      digitalWrite(LED, LOW);
      pinMode(SW, INPUT);
    }
    
    void loop() {
      if (digitalRead(SW)) {
          ledState = ! ledState;
          digitalWrite(LED, ledState);
      }
    }

You should find that the circuit behaves erratically.  Sometimes, when you
push the button, it changes the state of the LED, sometimes it doesn't.

### Attempt #2:  Add Debouncing ###

Each iteration of the `loop()` function in the sketch above executes in
a few **micro**seconds.  But switches typically bounce for 
several **milli**seconds.  So, sometimes, when the state of the I/O pin
attached to the switch is read, it will appear to be `ON`, and sometimes
it will appear to be `OFF`, until the switch stops bouncing.

To avoid the erratic behaviour associated with bouncing, force the loop
to wait a while before each reading of the switch pin.  How long is "a while"?
The answer is different for every switch, but 20 milliseconds is a typical value.  

To force the Arduino to wait for "a while", set up a "timer", i.e., 
a variable that measures the time difference between some "starting point"
and the current time.  Both your starting point and the current time
is read by using the arduino function: `millis()`, which returns the number 
of millseconds since the last time the Arduino board was reset.  So if you 
just reset (or started) your program 1 second ago, then the `millis()` 
function would return `1000`.

In the following sketch, the `setup()` function stores the current 
time in the variable `startTime`, and initializes the variable
`waitedLongEnough` to `false`.  Then it wraps all the statements in
the `loop()` function from the previous sketch in a test:

    if (waitedLongEnough == true) {
        ... // then go ahead and check the state of the switch
    } else {
        ... // check to see if the waiting time has expired

When the `if` block is executed, the `startTime` for the timer is
reset to the current time, and the flag `waitedLongEnough` is reset
to `false`.

When the `else` block is executed, the current time is evaluated
(using `millis()`), and compared to the last time the timer
was set (`startTime`).  When that time difference execeeds the
amount of time you estimated would be needed to wait for the
button to stabilize:

    (millis() - startTime) > waitTime

then the flag `waitedLongEnough` is set to `true`, which will
cause the next iteration of `loop()` to activate the branch that 
actually reads the switch and (if the switch is pressed), change
the state of the LED, restart the time, and reset the
flag `waitedLongEnough`.

    int LED = 10;
    int SW = 4;
    
    int ledState = LOW;
    int waitTime = 150;
    bool waitedLongEnough = false;
    int startTime;
    
    void setup() {
      pinMode(LED, OUTPUT);
      pinMode(SW, INPUT);
      digitalWrite(LED, ledState);
      startTime = millis();
    }
    
    void loop() {
      if (waitedLongEnough == true) {
        if (digitalRead(SW)) {   
          ledState = !ledState;
          digitalWrite(LED, ledState);
          waitedLongEnough = false;
          startTime = millis();
        }
      } else {
        if ((millis() - startTime) > waitTime) waitedLongEnough = true;
      }
    }
    
