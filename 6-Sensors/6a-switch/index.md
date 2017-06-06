## Using Pushbutton Switches ##

This packet shows you how to use a pushbutton switch to turn on a device
(or a whole suite of devices).

### Real Switches Don't Just "Switch" ###

Have you ever held a TV controller stick that just didn't seem to do what you wanted?
Where you had to push a button again and again to get it to "listen"?  Ah, you may
be encountering the ever-present problem of bouncing switches!

When you push a button, it does not just turn "on" or "off".  Instead, its contacts 
crash into one another and then bounce around before settling down.  (The same is 
true of all physical objects; a sudden impact on a physical object makes it 
"ring".)  Because of this bounce, a pushbutton will seem to oscillate randomly 
between "on" states and "off" states for a short time after it is pushed, and a 
program that does not take this instability into account will seem to produce 
erratic results.

This packet shows how to account for switch bouncing by adding a delay before
the switch is read again.  This is called "debouncing" a switch.  

<!--The size of
the delay depends on the particular switch.  Most decent switches will stop 
ringing in about 20 ms.  Some switches take more than 200ms.  You have to 
experiment to see what works with the switch you have.
-->
