%
% Susan G. Kleinmann
% Jun 20, 2016

### Power Required (Current Draw) by Ordinary Speakers ###

Typically, ordinary speakers or loudspeakers have either 4W or 8W of resistance,
and advertise that they produce 0.5W or more of sound.  (Beefy speakers might
advertise that they provide 500W or more of sound.)  

In order to provide that much power, the speakers need to draw a lot of current:

    Current = Square Root of (Power/Resistance)

If the Power is 1W, a speaker with 8Ω resistance would
require 0.35A or 35 mA.  This exceeds the current that can be delivered by
any Arduino I/O pin, which is only 20mA.  In fact, since the current delivered to the 
speaker is likely to be much less than the current drawn from the I/O pin, you would 
probably need much more than 35 mA.  

### Providing More Power ###

The solution to controlling power-hungry devices with an Arduino is to
provide a supplemental source of power.  Any device can draw its high voltage
from another source (like a battery or power supply), *as long as its `GND` is
connected to the `GND` of the Arduino.

In this case, you will use your Arduino *not* to deliver a square wave directly 
to the speaker, but to turn a switch (in this case, a transistor) on and off, so 
that the external power is alternately turned on and off as far as the speaker can tell.

A setup where the Arduino I/O pin is used *not* to provide power, but as a
smart "gate" to an external power source, is encountered over and over again 
in Arduino usage, particularly with respect to motors (which also draw a lot of power).

This packet will use the same buzzer you used before, but will show you
how to power it with an external power source.  

