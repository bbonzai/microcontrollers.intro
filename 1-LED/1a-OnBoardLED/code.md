% blink.ino
% Susan G. Kleinmann
% May 24, 2016

An Arduino program (or "sketch") must define two functions:

`setup()`
: This function is executed just once, after the board is powered on or reset.
: This is a good place to set whatever I/O pin you'll use into INPUT mode 
: or OUTPUT mode.  All pins on Arduino boards are in INPUT mode by default.

`loop()`
: This function is executed repeatedly until the board is powered off or reset.

Neither function takes any arguments.  So they can be written as: `setup()` or `setup(void)`,
and `loop()` or `loop(void)`.

Your program can define other functions, but these two functions are essential.

### Bare-bones version ###

Here is a bare-bones version of a program that will turn on the on-board LED
for 1 second, and then turn it off for 1 second:

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

### Improved Version ###

This revised version of the program assigns a "name" to the address of the I/O pin 
being used (the name is simply `LED`).  By giving the pin number a name, you can
easily modify the program for a different board (where the I/O pin of the on-board
LED might be different).  Since this name is used both in the `setup()` function
and in the `loop()` function, it must be defined before both of them:

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
