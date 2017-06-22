## Controlling Arduinos with Sensors ##

The packets in this section will be about using various devices 
as *inputs* to an Arduino, in order to control one or more output devices.

Whereas a switch acts like an input which can be in one of two states:
`LOW` or `HIGH`, most of the sensors described in this section can produce
*any* value between `0V` and `5V`.  (Well, that's not exactly true since the
Arduino can only distinguish differences larger than about 0.005V.)

These "variable-output" or "analog" devices cannot be used on the digital 
I/O pins of the Arduino.  Instead, they must be used on one of the 
analog I/O pins labelled `A0` through `A5`.

Your sketch will read the value of the voltage produced by one of these 
sensors using the arduino function `analogRead()`, for example:

    int pin = 0; this will be interpreted as `A0` by analogRead()
    int vIn = analogRead(pin);

The function `analogRead()` will output a value between 0 and 1023.

In most of the examples in this section, the value from `analogRead()` is 
simply used to control the blink rate of an LED.  More complicated applications will
be presented in the sections on [Sound](../4-Sound), and [Motors](../5-Motors).

Some sensors require much more complicated setup and interpretation than those
requiring a simple `analogRead()` followed by a call to the `map()` function.
One of those is an ultrasonic module, which is described in
packet [3e](3e-ultrasonic-module).
