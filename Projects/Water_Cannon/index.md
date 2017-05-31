%
% Susan G. Kleinmann
% September 17, 2016

## A Little Cultural Background ##

People have been making fountains that are coordinated with music for
centuries.  Here are a couple of very different examples:

| The Fountains at the Palace of Versaille  |  The Dancing Fountains of Dubai  |
|:-----------------------------------------:|:--------------------------------:|
| <iframe src="https://www.youtube.com/embed/AVuE2bjlXPw" frameborder="0" allowfullscreen/> | <iframe src="https://www.youtube.com/embed/mGDNKHMJVOo" frameborder="0" allowfullscreen></iframe> |

## The Basic Components of a Fountain Extravaganza ##

To make a dancing fountain, a single controller system must coordinate changes 
in several types of devices.  

| Device to be controlled | See This Packet to Learn How to Control That Device |
|:------------------------|:----------------------------------------------------|
| one or more water jets  | [Controlling DC Motors]()                           |
| sound                   | [Making Sound with an Arduino]()                    |
| lights (optional)       | [Controlling LEDs with an Arduino]()                |

## Plumbing:  The Hard Part ##

The real challenge was finding the right devices to make a water jet.  
The central component of the jet is a solenoid valve that can be digitally 
controlled. To an Arduino, this type of device looks just like other toy 
DC motors whose operation was described in [a previous packet]().

Unfortunately, the valves we found are built with the assumption that they
will be connected to *indoor* plumbing devices, which have different threads
and pitches than, say, an outdoor hose.  So the key to success in this project
was finding the right indoor-outdoor interface coupler.  The precise
coupler we used is listed along with the other required components 
in the [Bill of Materials](circuit.md).

## Timing: The Other Hard Part ##

The famous fountains shown above combine music and water motions in a broad brush 
fashion.  Phrases (consisting of a sequence of notes), and "Period Forms" (conssisting
of 2-4 phrases) are accompanied by grand motions of one or more water jets.

The project described here is more literal than that:  each individual note in the 
music is accompanied by a burst from the water jet.  This water-burst-for-each-note
approach puts a severe time constraint on the response time of the solenoid.
To see how well our configuration works, we included in the code a time-sequence
of shorter and shorter pulses to see how fast the water jet could respond.





