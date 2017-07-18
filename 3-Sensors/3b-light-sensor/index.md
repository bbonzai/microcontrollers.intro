## A Simple Light Sensor ##

Probably the most widely used light sensor (maybe even the most widely
used sensor of any type) on Arduino boards is a CdS (Cadmium Sulfide)
photoresistor like the one shown below:

| A CdS light sensor  |
|:-------------------:|
| ![](images/cds.png) |

These devices are something like ordinary resistors.  The difference is
that their resistance *changes* when light falls on them.  Left in the dark, 
a typical CdS photoresistor might have a resistance > 1 MΩ, but that
resistance drops by more than a factor of 1000 to < 1 kΩ when a light shines
on them.

These resistors are very inexpensive, and not terribly consistent:  two
different CdS cells will likely respond differently to the same light
conditions.  They are also a little slow: their resistence might not
sensibly drop for ~10 msec after light shines on them.  Thus, they might
not be the ideal sensor in an application like Laser Tag.

They are, however, very inexpensive and reasonably rugged.

This packet shows how to use light shining on a CdS cell to change the
voltage read on an analog pin, and then to use that reading to turn an
LED on or off.

