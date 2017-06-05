## General structure of an Arduino program ##

Programs written in the Arduino IDE are called "sketches".

A proram or a sketch contains a series of statements which tell the
microcontroller what to do.  Each statement *must* end in a semi-colon.

Sometimes, it is convenient to treat a group of statements as a single
entity, or "block".  Curly braces (`{`..`}`) are used to enclose a block.

A function is a block of statements which has:

* a name (by which it can be invoked once or many times)
* a set of input parameters
* an output value

An Arduino sketch must contain at least two functions with specific names:

:` setup()`
: This function is executed just once, after the board is powered on or reset.
: This is a good place to set whatever I/O pin you'll use into INPUT mode 
: or OUTPUT mode.  All pins on Arduino boards are in INPUT mode by default.

`loop()`
: This function is executed repeatedly until the board is powered off or reset.

Neither function takes any input parameters, and neither one produces an output
value.  So they they both have the same "signature", either

    void setup() {...}
    void loop() {...)

You could also write:

    void setup (void) {...}
    void loop (void) {...}

### Bare-bones version ###

A bare-bones program to turn on the on-board LED for 1 second, and 
then turn it off for 1 second is:

    void setup() {
        pinMode(13, OUTPUT);
        digitalWrite(13, LOW);
    }

    void loop() {
        digitalWrite(13, HIGH);
        delay(1000);            
        digitalWrite(13, LOW); 
        delay(1000);            

    }

In reality, this sketch is incorporated by the Arduino software in a larger
program.  that program calls the `setup()` function once.  In this case,
the `setup()` function tells the microcontroller that digital pin 13 will be
operated in `OUTPUT` mode.  If this statement were missing, then the microcontroller
would operate pin 13 as if it were in the default mode, which is `INPUT`.

Digital pins output voltage at two levels: 0V and 5V.  The statement:

    digitalWrite(13, LOW);

sets the initial value of the voltage on pin 13 to be 0V.  The LED will be off.

Once the `setup()` function has executed both statements, the larger program
then calls the function `loop()` again, and again, and again, forever.  
In this case, the statements in `loop()` have the effect:

1.  Set the voltage on pin 13 to 5V.
2.  Wait 1000 msec = 1 second.
3.  Set the voltage on pin 13 to 0V.
4.  Wait 1000 msec = 1 second.

This action continues until the microcontroller is reset.

### Improved Version ###

A simple improvement to the above program makes it much easier to
maintain.  Suppose you wanted to use the same code (or similar)
on another microcontroller board where the on-board LED was controlled 
through digital pin 8.  Then you'd have to modify the above program in 3 places.

To avoid that, write a *single* statement at the top of the program, where
you specify the pin number of the on-board LED, and assign that value to a
"name"; in this case, the name "LED" is an obvious choice, but "ONBOARDLED"
would work fine also.  (It is common practice to use names with all caps for
variables that won't be changed during the course of the program.)  
Whatever name you use, since the statement is outside of both functions,
it is said to be a "global" variable, and can be accessed by both of them.

    int LED=13;

    void setup() {
        pinMode(LED, OUTPUT);
        digitalWrite(LED, LOW);
    }

    void loop() {
        digitalWrite(LED, HIGH);
        delay(1000);            
        digitalWrite(LED, LOW); 
        delay(1000);            

    }

### Ahh, Comments! ###

Good coding practice demands that you put comments in your code, so that
other people can understand what you did, and so that you can understand what
you did (and why you did it) an hour or a week after you wrote it.

The compiler simply ignores comments when it compiles your code.

There are two kinds of comments:

Multi-line comments
: These comments begin with the two-character sequence: `/*`, and end with
: the two-character sequence: `*/`.

Single-line comments
: These comments begin with the two-character sequence: `//`, and end at 
: the end of the line.

It is good practice to put a multi-line comment at the beginning of your code,
which sates the purpose of the program.  

    /* Blink the onboard LED using an Arduino UNO */
     
    int LED=13;    // The onboard LED on the UNO is activated on pin 13
                   // Change this to pin 1 if you are using a Trinket.
                   // Change this to pin 7 if you are using a Flora.
    
    void setup (void) {
        pinMode(LED, OUTPUT);     // Normally, all pins are in INPUT mode
                                  // The processor can only change the state of
    			          // a pin by putting that pin in OUTPUT mode.
        digitalWrite(LED, LOW);   // This is just to start the program in a known state.
                                  // Whether it should start in the ON state or the OFF
    			          // state just depends on your application.
    }
    
    void loop (void) {
        digitalWrite(LED, HIGH);   // Turn the LED on.
        delay(1000);               // Leave it on for 1000 ms, which is 1s.
        digitalWrite(LED, LOW);    // Turn the LED off.
        delay(1000);               // Leave it off for 1000 ms.
    }
