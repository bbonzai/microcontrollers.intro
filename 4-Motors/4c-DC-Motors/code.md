%
% Susan G. Kleinmann
% June 27, 2016

The DC motor in this packet gets power from the battery pack when the Collector 
(center) pin of the transistor is set `HIGH`.  That transistor is attached
to an I/O pin that produces analog output (i.e., voltages in the range 0-5V),
using the technique of Pulse Width Modulation.  

The I/O pin attached to the collector must be initialized for `OUTPUT` mode.

The Arduino command to write to that pin is:

    analogWrite(pin_number, value);

where `value` is any integer between 0 and 255.

Note that the DC motors that were tested did not move AT ALL when `value` was less than about 50.

Hint:  Be sure to make a little "flag" to attach to the spindle of the motor
so that you can see it moving around.

### Simple Sketch to Set the Motor at a Series of Different Speeds ###

This sketch makes the motor move at 4 different speeds, corresponding to 4 different
voltages:

50/255 `x` 5V = 1V                  
150/255 `x` 5V = 1.5V                
250/255 `x` 5V = 4.9V               
0/255 `x` 5V = 0V  (i.e., stopped)

    int motorpin = 9; // D9

    void setup() {
        pinMode(motorpin, OUTPUT);
        analogWrite(motorpin, 0);
    }

    void loop() {
        analogWrite(motorpin, 50);
        delay(2000);
        analogWrite(motorpin, 150);
        delay(2000);
        analogWrite(motorpin, 250);
        delay(2000);
        analogWrite(motorpin, 0);
        delay(4000);
    }
