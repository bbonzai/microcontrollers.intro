%
% Susan G. Kleinmann
% July 6, 2016

1.  Speakers should have a much wider range of output frequencies than simple buzzers.
To check this, add a buzzer to your circuit; e.g. add the `+` lead of a buzzer to GPIO
pin 5.  For example, a buzzer might have trouble producing much sound at a frequency
less than 50Hz, or greater than 3000 Hz.
Use [the `makesound()` function](../3b-DoubleSound/code.html) to make a
very low frequency sound first from the buzzer, and then from the speaker.  Try the
same with a high frequency sound.
