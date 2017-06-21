## Switches ##

In the [first series of packets](../1-LED), the code in most examples was used as
a "switch" to turn LEDs on and off.

What if you want manual control, so that *you* can switch the Arduino's 
functioning `ON` or `OFF`?  One way to do this is the Serial Console, 
introduced in [packet 1g-SerialConsole](../1g-SerialConsole).

You can also use any one of a variety of mechanical switches to exert
human control over the Arduino's behaviour.  This packet illustrates some 
common types of mechanical switches.

### Some Switch Nomenclature ###

There are hundreds (at least) types of switches.

* the number of "poles"
: A pole is a switch position.  Depending on its position, a switch can cause 
: current to flow along one direction, or another direction, or not at all.
: The diagram on the left below shows a "switch that has 2 poles, because it can 
: cause current to flow, or not at all.  The diagram on the right below shows a 
: switch that can cause current to flow in one direction, or another direction, 
: or not at all.

* the number of "throws"
: A single physical switch can contain any number of pathways, all of which 
: activate current flow through their respective pole *at the same time*.
: The diagram below shows a simple, "single throw" switch, and more complicated 
: "double throw" switch.  Mechanical switches rarely have more than 4 "throws".

Switches are also characterized by the amount of current and voltage they can 
switch.  Typically, big switches are needed to turn on or off a lot of current,
and tiny switches can be used to turn on and off a small amount of current.
The pins on an Arduino typically convey <40mA of current, so tiny switches work
well with Arduino hardware.

### Types of Switches 
Packet [2a-slide-switches](2a-slide-switches) 
: introduces slide switches, which you can use to activate or de-activate
: some statement or block of your code by pushing the handle from one side
: to the other.

Packet [2b-pushbutton](2b-pushbutton) 
: introduces pushbutton switches. 

Packet [2c-latches](2c-latches)
: uses the same hardware and circuitry as packet [2b-pushbutton](2b-pushbutton),
: but shows how to use the pushbutton in a "latching" mode, instead of a 
: "press-and-hold" mode.  This simple change will introduce the phenomenon of 
: switch bouncing, and show you how to overcome it.

All of the packets in this section use simple LEDs.
 
Wikipedia has a great summary of the nomenclature and various forms of 
[physical switches](https://wikipedia.org/wiki/Switch).

