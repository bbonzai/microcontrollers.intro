## Making Sounds ###

Many types of devices make sounds, for example:

* simple buzzers, which make sound at only one pitch 
(i.e. one frequency of sound)
* piezo buzzers which can make a sound over a wide range of frequencies
* loudspeakers, which are meant to deliver sound over the full range of
audible tones, with a wide range of amplification.

### "Manually" Making a Tone with a Piezo Buzzer ###

Piezo buzzers make sounds when the voltage across the buzzer changes; i.e., it
is not the *level* of the voltage over the buzzer that determines the frequency
or loudness of the sound they make, but the *change* in that voltage.

[DIYSquareWave](3a-DIYSquareWave) 
shows you how to make a sound just by "manually" turning a buzzer ON and OFF
in rapid succession.

### Quick Method to Get Twice the Sound ###

Packet [3b-DoubleSound](3b-DoubleSound) 
shows you how to get twice the volume out of a piezo-buzzer with just a
simple change in the circuit and sketch.

### Using the Arduino `tone()` Function to Create Sound ###

Packet [3c-Tone](3c-tone) shows how to use the function `tone()` built into the Arduino 
library to make tones on buzzers or speakers.

### Connecting a Loudspeaker to an Arduino ###

While buzzers can often be activated using the current available through
an I/O pin of an Arduino, speakers often require much more power.  There's
a fix for that!  The packet [3d-speakers](3d-speakers) shows how to control
a power-hungry device with an Arduino.



