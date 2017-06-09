## Using a Speaker Rather than a Buzzer ##

### Power Required (Current Draw) by Ordinary Speakers ###

An ordinary buzzer typically has a high resistance, perhaps 1 kΩ or more.
In contrast, a typical speaker has only 4Ω or 8Ω of resistance.
With so little resistance, speakers can draw a lot of current, and therefore
produce a powerful sound.  

However, the maximum current that can be delivered by any one pin on
an Arduino board is typically only 20mA, so an Arduino board, by itself, 
which is several times less than what is required to get sound from a 
regular speaker.

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

