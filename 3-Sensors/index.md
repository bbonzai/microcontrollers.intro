## Controlling Arduinos with Sensors ##

The packets in this section show you how to use a variety of sensors
as *inputs* to an Arduino, in order to control one or more output devices.

### Analog Sensors ###

The first two sensors introduced in this section, a [potentiometer](3a-potentiometer)
and a [light sensor](3b-light-sensor), are both "analog" sensors.
That is instead of producing values which are either `LOW` (0V) or `HIGH` (5V),
like the reading from a switch, they can produce values over the entire
range from 0V to 5V.  The input from these "analog" devices cannot be read 
on the digital I/O pins of the Arduino.  Instead, they must be used on one 
of the analog I/O pins labelled `A0` through `A5`.

Your sketch will read the value of the voltage produced by one of these 
sensors using the arduino function `analogRead()`, for example:

    int PIN = 0; this will be interpreted as `A0` by analogRead()

    int vIn = analogRead(PIN);

The function `analogRead()` will output a value between 0 and 1023.

### Digital Sensors ###

Packet [3c](3c-PIR) shows how to use a Passive InfraRead (PIR) sensor to
detect motion.  These devices produce *digital* output, i.e., their
signal pin goes `HIGH` when motion is detected; they are therefore
digital, not analog sensors.  Typically, PIR sensors detect motion within
about 20 feet, but they can be adjusted to be more or less sensitive
than that.

### Other Sensors ###
 
Packet [3d-ultrasonic-module](3d-ultrasonic-module) shows how to use an ultrasonic sensor
to detection the distance to the object in front of it.  This sensor
not an analog sensor, nor is it a digital sensor like the PIR.  Instead,
this sensor produces a pulse (a transition from `LOW` to `HIGH`, followed 
by a subsequent transition back from `HIGH` to `LOW`) whose *duration*
is used to infer the target's distance.  Using this sensor requires the
introduction of a new, special-purpose arduino function, `pulseIn()`.

### Using the Sensors to Control Something! ###

In most of the examples in this section, the value from a sensor is simply used to 
control the brightness or blink rate of an LED.  More complicated applications will
be presented in the sections on [Sound](../4-Sound), and [Motors](../5-Motors).

