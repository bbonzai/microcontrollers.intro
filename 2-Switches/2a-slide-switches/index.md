## Slide Switches ##

The switches used in this packet have 3 pins.  

When the slide is moved all the way to one side, the center pin is
connected to the pin on that side.  Therefore, at any one time, the
center pin may be connected either to the right pin or the left pin.

For the purposes of illustrating the switch alone, this packet just
shows how to set up the slide switch to control a single LED.

In the process of building and using this circuit, you will probably
find that the switch does not behave as you originally expected.  The
reason is most likely due to the fact that a slide switch, like any other
switch, does *not* switch instantaneously from one position to the other.
In fact, when the position of a switch is changes, internally that switch
makes a contact, then "bounces" off the contact, then strikes the contact 
again, etc., etc. until it finally comes to rest on the contact.  
The time during which a switch is bouncing on and off the contact 
(the so-called "bounce time") is hundreds or thousands of
times longer than the amount of time it takes an Arduino to execute a
single command.  To mitigate the effects of a switch which is in its
transient state, it is necessary to add some code for "de-bouncing"
the switch.  

Be aware:  some slide switches are built with pins separated by exactly 
0.1"; these switches fit nicely into a breadboard.  Most switches aren't 
built that way.  To use these switches, you may want to insert them into 
your breadboard using a jumper cable with a female connection on one end.
