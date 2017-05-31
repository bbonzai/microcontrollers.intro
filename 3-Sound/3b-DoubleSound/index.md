%
% Susan G. Kleinmann
% June 26, 2016

The piezo buzzer reacts to the magnitude of the change in voltage across its terminals.
You can double the volume of the sound created by doubling the voltage change.

To do that, instead of attaching one pin from the buzzer to `GND` (where it is permanently 0V),

* attach one pin from the buzzer to a digital I/O pin, and
* attach the other pin from the buzzer to a *second* digital I/O pin.

Then, modify your sketch so that immediately after it drives the first pin `HIGH`, it
drives the second pin `LOW`, and vice versa.
