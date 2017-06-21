## Using Pushbutton Switches as Latches ##

This packet shows you how to use a pushbutton switch to change the state of
a device until the next time you push the button.  That is, if you push
the button once, you'll expect, say, an LED to turn on and stay on until 
the next time you push the button.  When you push the button a second time,
you'll expect the LED to turn off and stay off, etc.  A pushbutton used in
this mode is a "latch".

### Real Switches Don't Just "Switch" ###

Using pushbuttons as latches highlights a problem with all switches,
called "bouncing".  

When you push a button, it does not just turn "on" or "off".  Instead, its contacts 
crash into one another and then bounce around before settling down.  (The same is 
true of all physical objects; a sudden impact on a physical object makes it 
"ring".)  Because of this bounce, a pushbutton will seem to oscillate randomly 
between "on" states and "off" states for a short time after it is pushed, and a 
program that does not take this instability into account will seem to produce 
erratic results.

This packet shows how to account for switch bouncing by adding a delay before
the switch is read again.  This is called "debouncing" a switch.  

The size of the bounce delay depends on the particular switch.  Most decent 
switches will stop ringing in about 20 ms.  Some switches take more than 200ms.  
Two switches of the same type might have slightly different bounce behaviours.
You have to experiment to see what works with the switch you have.

[Here](https://www.allaboutcircuits.com/technical-articles/switch-bounce-how-to-deal-with-it/) is a beautiful graphical illustration showing in detail how switches
bounce "under the hood".

