## Ultrasonic Distance Sensors ## 

Ultrasonic sensor work by sending out a sound wave at a particular
frequency, and then measuring the amount of time it takes for the sound wave to 
reflect off of some surface back to it.  Therefore, ultrasonic sensors have
two parts: a sender and a receiver.  These types of sensors are frequently
used in robots to detect when the robot is nearing an obstacle.

Because of the way they work, ultrasonic sensors can succeed in measuring 
distances to objects that are difficult to "see" either because they are
in unlit areas or because their color resembles the surroundings.
However, ultrasonic sensors are a poor choice when the target being tracked
is made of some soft material; such objects will not reflect the sound
wave very efficiently.

This packet shows how to use the HC-SR04 ultrasonic module, which can
be used to detect obstacles that are as near as 2cm and as distant as 400cm,
and can measure their distance with a precision of 0.3cm.  

The two components of the HC-SR04 ultrasonic module are:

* the trigger, which should be activated by setting it at a `HGH` 
state for 10 µs.  This has the effect of making the trigger unit
send out a high-frequency sound wave consisting of 8 pulses.
This sound wave will bounce off nearby objects.

* the echo, which detects sound waves at the "correct" frequency (i.e.,
the frequency used by the trigger).  When it makes a detection, it
reports a `long int` value which twice the time `t` it takes sound to travel
to that object.

Since the speed of sound is (roughly) constant at 0.034 cm/µs, the
distance to the detected object is:

    distance = t * 0.034 / 2;

(Divide by a factor of 2 because the travel time `t` includes both the
time for the sound wave to reach the obstacle plus the time to return
from it.)
