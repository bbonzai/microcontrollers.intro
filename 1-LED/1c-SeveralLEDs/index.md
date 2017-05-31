%
% Susan G. Kleinmann
% June 25, 2016

This packet just shows how to use the Arduino to control several I/O pins in the same loop.

The project employs three monochrome LEDs, each with a different color: red, green, 
and yellow.  The code  turns on one light after another in a traffic-light sequence. 

⚠ Alert:  Power Limit!

If you built up this circuit so that it had 10 or more LEDs, you'd run in to the
problem that the Arduino can only produce a maximum of 200 mA on all the I/O pins (if they
are all powered on at the same time).  For more info, see this article on
[Arduino power limits](http://www.electricrcaircraftguy.com/2014/02/arduino-power-current-and-voltage.html).
